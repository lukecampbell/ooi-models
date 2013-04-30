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

def initialize_view(connection):
    view_sql='''CREATE VIEW public.pdict_view
AS
SELECT 
    pdict.scenario as pdict_scenario,
    pdict.id as pdict_id,
    pdict.name as pdict_name,
    pdict.temporal_parameter,
    param.scenario as param_scenario,
    param.name as param_name,
    param.id as param_id,
    param.parameter_type,
    param.value_encoding,
    param.code_set,
    param.unit_of_measure,
    param.fill_value,
    param.parameter_function_id,
    param.lookup_value,
    param.qc_functions,
    param.ooi_short_name
FROM ParameterRelations as prelat
    INNER JOIN ParameterDictionaries AS pdict ON pdict.id=prelat.pdict_id
    INNER JOIN ParameterContexts AS param ON param.id=prelat.parameter_id;
    '''
    connection.execute(view_sql);

def drop_view(connection):
    connection.execute('DROP VIEW pdict_view')

def initialize(connection):
    ParameterDictionary.reinitialize(connection)
    ParameterRelation.reinitialize(connection)

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
                    id=row['ID'],
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
                        parameter_id=p_id,
                        pdict_id=row['ID'],
                        )
                relation = ParameterRelation(**args)
                relation.create(connection)


