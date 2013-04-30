
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Observatory = PSQLTypes.create_from_yaml('Observatory',pkg_resources.resource_filename(__name__, 'Observatory.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Observatory.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=28&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Observatorys.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Observatorys.csv')) as f:
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
                    name = row['obs/name'],
                    description = row['obs/description'],
                    spatial_area_name = row['obs/spatial_area_name'],
                    constraint_ids = row['constraint_ids'],
                    coordinate_system = row['coordinate_system'],
                )
            entry = Observatory(**args)
            entry.create(connection)


