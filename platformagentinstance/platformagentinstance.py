
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


PlatformAgentInstance = PSQLTypes.create_from_yaml('PlatformAgentInstance',pkg_resources.resource_filename(__name__, 'PlatformAgentInstance.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    PlatformAgentInstance.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=52&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'PlatformAgentInstances.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'PlatformAgentInstances.csv')) as f:
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
                    platform_agent_id = row['platform_agent_id'],
                    platform_device_id = row['platform_device_id'],
                    unused_start_agent = row['unused/start_agent'],
                    name = row['pai/name'],
                    description = row['pai/description'],
                    driver_config = row['driver_config'],
                    platform_id = row['platform_id'],
                    agent_device_map = row['agent_device_map'],
                    agent_streamconfig_map = row['agent_streamconfig_map'],
                    alerts = row['alerts'],
                )
            entry = PlatformAgentInstance(**args)
            entry.create(connection)


