
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ParameterContext = PSQLTypes.create_from_yaml('ParameterContext',pkg_resources.resource_filename(__name__, 'ParameterContext.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ParameterContext.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=57&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ParameterContexts.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ParameterContexts.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            if not row['Scenario']:
                continue
            args = dict(
                    scenario = row['Scenario'],
                    id = row['ID'],
                    name = row['Name'],
                    parameter_type = row['Parameter Type'],
                    value_encoding = row['Value Encoding'],
                    code_set = row['Code Set'],
                    unit_of_measure = row['Unit of Measure'].replace('%','percent'),
                    fill_value = row['Fill Value'],
                    display_name = row['Display Name'].replace('%','percent'),
                    precision = row['Precision'],
                    parameter_function_id = row['Parameter Function ID'],
                    param_map = row['Parameter Function Map'],
                    lookup_value = row['Lookup Value'],
                    qc_functions = row['QC Functions'],
                    standard_name = row['Standard Name'],
                    ooi_short_name = row['Data Product Identifier'],
                    reference_urls = row['Reference URLS'],
                    description = row['Description'],
                    review_status = row['Review Status'],
                    review_comment = row['Review Comment'],
                    long_name = row['Long Name'],
                    skip = row['SKIP'],
                )
            entry = ParameterContext(**args)
            try:
                entry.create(connection)
            except:
                from traceback import print_exc
                print 'Failed to insert: '
                print row
                print_exc()
                connection.rollback()


