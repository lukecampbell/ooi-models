
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


PlatformModel = PSQLTypes.create_from_yaml('PlatformModel',pkg_resources.resource_filename(__name__, 'PlatformModel.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    PlatformModel.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=12&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'PlatformModels.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'PlatformModels.csv')) as f:
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
                    param_dict_id = row['param_dict_id'],
                    name = row['pm/name'],
                    description = row['pm/description'],
                    platform_family = row['pm/platform_family'],
                    manufacturer = row['pm/manufacturer'],
                    ci_onboard = row['pm/ci_onboard'],
                    shore_networked = row['pm/shore_networked'],
                    platform_type = row['pm/platform_type'],
                )
            entry = PlatformModel(**args)
            entry.create(connection)


