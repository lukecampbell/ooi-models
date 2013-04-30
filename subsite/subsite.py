
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Subsite = PSQLTypes.create_from_yaml('Subsite',pkg_resources.resource_filename(__name__, 'Subsite.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Subsite.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=10&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Subsites.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Subsites.csv')) as f:
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
                    parent_site_id = row['parent_site_id'],
                    name = row['site/name'],
                    local_name = row['site/local_name'],
                    description = row['site/description'],
                    reference_designator = row['site/reference_designator'],
                    constraint_ids = row['constraint_ids'],
                    coordinate_system = row['coordinate_system'],
                )
            entry = Subsite(**args)
            entry.create(connection)


