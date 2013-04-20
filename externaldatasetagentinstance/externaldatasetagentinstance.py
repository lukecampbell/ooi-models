
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ExternalDatasetAgentInstance = PSQLTypes.create_from_yaml('ExternalDatasetAgentInstance',pkg_resources.resource_filename(__name__, 'ExternalDatasetAgentInstance.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ExternalDatasetAgentInstance.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=73&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ExternalDatasetAgentInstances.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ExternalDatasetAgentInstances.csv')) as f:
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
                    confluence = row['Confluence'],
                    id = row['ID'],
                    owner_id = row['owner_id'],
                    org_ids = row['org_ids'],
                    name = row['name'],
                    description = row['description'],
                    agent = row['agent'],
                    dataset = row['dataset'],
                    streamdef = row['streamdef'],
                    agent_config = row['agent_config'],
                    driver_config = row['driver_config'],
                    handler_module = row['handler_module'],
                    handler_class = row['handler_class'],
                    parser_module = row['parser_module'],
                    parser_class = row['parser_class'],
                )
            entry = ExternalDatasetAgentInstance(**args)
            entry.create(connection)


