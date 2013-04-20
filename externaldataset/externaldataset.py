
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ExternalDataset = PSQLTypes.create_from_yaml('ExternalDataset',pkg_resources.resource_filename(__name__, 'ExternalDataset.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ExternalDataset.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=74&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ExternalDatasets.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ExternalDatasets.csv')) as f:
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
                    name = row['name'],
                    description = row['description'],
                    data_sampling = row['data_sampling'],
                    parameters = row['parameters'],
                    model = row['model'],
                )
            entry = ExternalDataset(**args)
            entry.create(connection)


