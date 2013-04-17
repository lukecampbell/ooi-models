from flask_mvc.model.psql import *
import pkg_resources
import csv
import requests


ParameterContext = PSQLTypes.create_from_yaml('ParameterContext',pkg_resources.resource_filename(__name__, 'ParameterContext.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):

    ParameterContext.reinitialize(connection)

def units_filter(val):
    if '%' in val:
        val = val.replace('%','percent')
    return val

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=57&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ParameterDefs.csv'),'w') as f:
            f.write(response.content)
    
def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ParameterDefs.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if row['SKIP']:
                continue
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            args = dict(
                scenario = row['Scenario'],
                confluence = row['confluence'],
                name = row['Name'],
                id = int(row['ID'][2:]),
                parameter_type=row['Parameter Type'],
                value_encoding=row['Value Encoding'],
                code_set=row['Code Set'],
                uom=units_filter(row['Unit of Measure']),
                fill_value=row['Fill Value'],
                pmap=row['Parameter Function Map'],
                parameter_function_id=None,
                lookup_value=row['Lookup Value'],
                qc_functions=row['QC Functions'],
                data_product=row['Data Product Identifier'])

            if row['Parameter Function ID']:
                try:
                    args['parameter_function_id'] = int(row['Parameter Function ID'].replace('PFID',''))
                except ValueError:
                    pass


            entry = ParameterContext(**args)
            entry.create(connection)







