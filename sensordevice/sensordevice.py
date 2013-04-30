
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


SensorDevice = PSQLTypes.create_from_yaml('SensorDevice',pkg_resources.resource_filename(__name__, 'SensorDevice.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    SensorDevice.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=44&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'SensorDevices.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'SensorDevices.csv')) as f:
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
                    sensor_model_id = row['sensor_model_id'],
                    instrument_device_id = row['instrument_device_id'],
                    contact_ids = row['contact_ids'],
                    name = row['sd/name'],
                    description = row['sd/description'],
                    serial_number = row['sd/serial_number'],
                    firmware_version = row['sd/firmware_version'],
                    controllable = row['sd/controllable'],
                    uuid = row['sd/uuid'],
                )
            entry = SensorDevice(**args)
            entry.create(connection)


