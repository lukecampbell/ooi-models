
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ExternalDatasetAgent = PSQLTypes.create_from_yaml('ExternalDatasetAgent',pkg_resources.resource_filename(__name__, 'ExternalDatasetAgent.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ExternalDatasetAgent.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=72&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ExternalDatasetAgents.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ExternalDatasetAgents.csv')) as f:
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
                    lcstate = row['lcstate'],
                    org_ids = row['org_ids'],
                    #dataset_id = row['dataset_id'],
                    name = row['eda/name'],
                    description = row['eda/description'],
                    agent_version = row['eda/agent_version'],
                    #handler_module = row['eda/handler_module'],
                    #handler_class = row['eda/handler_class'],
                    #dataset_model = row['dataset_model'],
                )
            entry = ExternalDatasetAgent(**args)
            try:
                entry.create(connection)
            except Exception as e:
                print e
                connection.rollback()
                continue


