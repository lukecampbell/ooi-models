
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


DataProcessDefinition = PSQLTypes.create_from_yaml('DataProcessDefinition',pkg_resources.resource_filename(__name__, 'DataProcessDefinition.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    DataProcessDefinition.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=3&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'DataProcessDefinitions.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'DataProcessDefinitions.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            if not row['Scenario']:
                continue
            args = dict(
                    scenario = row['Scenario'],
                    id = row['ID'],
                    owner_id = row['owner_id'],
                    org_ids = row['org_ids'],
                    input_stream_defs = row['input_stream_defs'],
                    output_stream_defs = row['output_stream_defs'],
                    name = row['dpd/name'],
                    description = row['dpd/description'],
                    module = row['dpd/module'],
                    class_name = row['dpd/class_name'],
                )
            entry = DataProcessDefinition(**args)
            try:
                entry.create(connection)
            except Exception as e:
                connection.rollback()
                print e.message


