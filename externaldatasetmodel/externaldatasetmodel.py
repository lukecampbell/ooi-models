
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


ExternalDatasetModel = PSQLTypes.create_from_yaml('ExternalDatasetModel',pkg_resources.resource_filename(__name__, 'ExternalDatasetModel.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    ExternalDatasetModel.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=75&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'ExternalDatasetModels.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'ExternalDatasetModels.csv')) as f:
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
                    name = row['edm/name'],
                    description = row['edm/description'],
                    dataset_type = row['edm/dataset_type'],
                )
            entry = ExternalDatasetModel(**args)
            try:
                entry.create(connection)
            except Exception as e:
                print e
                connection.rollback()
                continue


