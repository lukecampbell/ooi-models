
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


InstrumentAgent = PSQLTypes.create_from_yaml('InstrumentAgent',pkg_resources.resource_filename(__name__, 'InstrumentAgent.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    InstrumentAgent.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=8&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'InstrumentAgents.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'InstrumentAgents.csv')) as f:
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
                    instrument_model_ids = row['instrument_model_ids'],
                    name = row['ia/name'],
                    description = row['ia/description'],
                    agent_version = row['ia/agent_version'],
                    driver_uri = row['ia/driver_uri'], 
                    driver_module = row['ia/driver_module'],
                    driver_class = row['ia/driver_class'],
                    stream_configurations = row['stream_configurations'],
                )
            entry = InstrumentAgent(**args)
            entry.create(connection)


