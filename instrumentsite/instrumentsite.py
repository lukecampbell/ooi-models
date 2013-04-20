
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


InstrumentSite = PSQLTypes.create_from_yaml('InstrumentSite',pkg_resources.resource_filename(__name__, 'InstrumentSite.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    InstrumentSite.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=1&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'InstrumentSites.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'InstrumentSites.csv')) as f:
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
                    instrument_model_ids = row['instrument_model_ids'],
                    name = row['is/name'],
                    description = row['is/description'],
                    constraint_ids = row['constraint_ids'],
                    coordinate_system = row['coordinate_system'],
                )
            entry = InstrumentSite(**args)
            entry.create(connection)


