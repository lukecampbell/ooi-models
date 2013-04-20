
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ExternalDataProvider = PSQLTypes.create_from_yaml('ExternalDataProvider',pkg_resources.resource_filename(__name__, 'ExternalDataProvider.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ExternalDataProvider.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=76&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ExternalDataProviders.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ExternalDataProviders.csv')) as f:
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
                    contact_id = row['contact_id'],
                    name = row['p/name'],
                    description = row['p/description'],
                )
            entry = ExternalDataProvider(**args)
            entry.create(connection)


