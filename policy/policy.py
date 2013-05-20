
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Policy = PSQLTypes.create_from_yaml('Policy',pkg_resources.resource_filename(__name__, 'Policy.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Policy.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=42&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Policys.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Policys.csv')) as f:
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
                    policy_type = row['policy_type'],
                    name = row['p/name'],
                    description = row['p/description'],
                    enabled = row['p/enabled'],
                    required = row['p/required'],
                    definition = row['p/definition'],
                    policy_rule = row['policy_rule'].replace('%s','%%s'),
                )
            entry = Policy(**args)
            try:
                entry.create(connection)
            except Exception as e:
                connection.rollback()
                print e.message


