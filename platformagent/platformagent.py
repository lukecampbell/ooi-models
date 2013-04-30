
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


PlatformAgent = PSQLTypes.create_from_yaml('PlatformAgent',pkg_resources.resource_filename(__name__, 'PlatformAgent.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    PlatformAgent.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=51&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'PlatformAgents.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'PlatformAgents.csv')) as f:
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
                    platform_model_ids = row['platform_model_ids'],
                    name = row['pa/name'],
                    description = row['pa/description'],
                    agent_version = row['pa/agent_version'],
                    driver_module = row['pa/driver_module'],
                    driver_class = row['pa/driver_class'],
                    stream_configurations = row['stream_configurations'],
                )
            entry = PlatformAgent(**args)
            entry.create(connection)


