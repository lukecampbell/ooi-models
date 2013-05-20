
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Org = PSQLTypes.create_from_yaml('Org',pkg_resources.resource_filename(__name__, 'Org.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Org.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=9&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Orgs.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Orgs.csv')) as f:
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
                    org_type = row['org_type'],
                    name = row['org/name'],
                    org_governance_name = row['org/org_governance_name'],
                    description = row['org/description'],
                    institution_name = row['org/institution/name'],
                    contact_id = row['contact_id'],
                    org_url = row['org/url'],
                )
            entry = Org(**args)
            try:
                entry.create(connection)
            except Exception as e:
                connection.rollback()
                print e.message


