
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


SensorModel = PSQLTypes.create_from_yaml('SensorModel',pkg_resources.resource_filename(__name__, 'SensorModel.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    SensorModel.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=43&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'SensorModels.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'SensorModels.csv')) as f:
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
                    name = row['sm/name'],
                    description = row['sm/description'],
                    manufacturer = row['sm/manufacturer'],
                    manufacturer_url = row['sm/manufacturer_url'],
                    reference_urls = row['sm/reference_urls'],
                    weight = row['sm/weight'],
                    voltage = row['sm/voltage'],
                    wattage = row['sm/wattage'],
                    height = row['sm/height'],
                    length = row['sm/length'],
                    width = row['sm/width'],
                )
            entry = SensorModel(**args)
            entry.create(connection)


