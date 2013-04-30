
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


PlatformDevice = PSQLTypes.create_from_yaml('PlatformDevice',pkg_resources.resource_filename(__name__, 'PlatformDevice.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    PlatformDevice.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=11&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'PlatformDevices.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'PlatformDevices.csv')) as f:
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
                    lcstate = row['lcstate'],
                    org_ids = row['org_ids'],
                    contact_ids = row['contact_ids'],
                    platform_model_id = row['platform_model_id'],
                    network_parent_id = row['network_parent_id'],
                    name = row['pd/name'],
                    description = row['pd/description'],
                    serial_number = row['pd/serial_number'],
                )
            entry = PlatformDevice(**args)
            entry.create(connection)


