
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


PlatformSite = PSQLTypes.create_from_yaml('PlatformSite',pkg_resources.resource_filename(__name__, 'PlatformSite.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    PlatformSite.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=19&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'PlatformSites.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'PlatformSites.csv')) as f:
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
                    confluence = row['confluence'],
                    owner_id = row['owner_id'],
                    org_ids = row['org_ids'],
                    parent_site_id = row['parent_site_id'],
                    platform_model_ids = row['platform_model_ids'],
                    name = row['ps/name'],
                    description = row['ps/description'],
                    alt_resource_type = row['ps/alt_resource_type'],
                    constraint_ids = row['constraint_ids'],
                    coordinate_system = row['coordinate_system'],
                )
            entry = PlatformSite(**args)
            entry.create(connection)


