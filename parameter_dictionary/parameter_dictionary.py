from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ParameterDictionary = PSQLTypes.create_from_yaml('ParameterDictionary',pkg_resources.resource_filename(__name__, 'ParameterDictionary.yml'))
ParameterRelation = PSQLTypes.create_from_yaml('ParameterRelation',pkg_resources.resource_filename(__name__, 'ParameterDictionary.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    connection.cursor.execute('DROP VIEW pdict_view')
    ParameterDictionary.reinitialize(connection)
    ParameterRelation.reinitialize(connection)
    pdict_view='''CREATE VIEW pdict_view(
        pdict_scenario,
        pdict_id,
        pdict_confluence,
        pdict_name,
        pdict_parameter_ids,
        pdict_temporal_parameter,
        param_scenario,
        param_confluence,
        param_name,
        param_id,
        param_parameter_type,
        param_value_encoding,
        param_code_set,
        param_uom,
        param_fill_value,
        param_parameter_function_id,
        param_pmap,
        param_lookup_value,
        param_qc_functions,
        param_data_product)
    AS 
    SELECT 
        ParameterDictionaries.*,
        ParameterContexts.*
    FROM ParameterRelations 
        INNER JOIN ParameterDictionaries ON ParameterDictionaries.id=ParameterRelations.pdict_id 
        INNER JOIN ParameterContexts ON ParameterRelations.parameter_id=ParameterContexts.id;
'''    
    connection.execute(pdict_view)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=58&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ParameterDictionaries.csv'),'w') as f:
            f.write(response.content)
    

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ParameterDictionaries.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if row['SKIP']:
                continue
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if not row['ID'] or 'DICT' not in row['ID']:
                continue
            if not row['temporal_parameter']:
                continue
            args = dict(
                    scenario=row['Scenario'],
                    id=int(row['ID'][4:]),
                    confluence=row['confluence'],
                    name=row['name'],
                    parameter_ids=row['parameter_ids'],
                    temporal_parameter=int(row['temporal_parameter'][2:])
                )

            entry = ParameterDictionary(**args)
            entry.create(connection)
            p_ids = set(row['parameter_ids'].split(','))


            for p_id in p_ids:
                p_id = p_id.strip()
                args = dict(
                        parameter_id=int(p_id[2:]),
                        pdict_id=int(row['ID'][4:])
                        )
                relation = ParameterRelation(**args)
                relation.create(connection)


