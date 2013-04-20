
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Deployment = PSQLTypes.create_from_yaml('Deployment',pkg_resources.resource_filename(__name__, 'Deployment.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Deployment.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=34&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Deployments.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Deployments.csv')) as f:
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
            if row['activate'].lower() == 'true':
                activate = True
            elif row['activate'].lower() == 'false':
                activate = False
            else:
                activate = None
            args = dict(
                    scenario = row['Scenario'],
                    confluence = row['confluence'],
                    id = row['ID'],
                    owner_id = row['owner_id'],
                    org_ids = row['org_ids'],
                    site_id = row['site_id'],
                    device_id = row['device_id'],
                    activate = activate,
                    name = row['d/name'],
                    description = row['d/description'],
                    constraint_ids = row['constraint_ids'],
                    coordinate_system = row['coordinate_system'],
                    context_type = row['context_type'],

                )
            entry = Deployment(**args)
            entry.create(connection)


