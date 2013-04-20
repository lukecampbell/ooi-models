
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


InstrumentDevice = PSQLTypes.create_from_yaml('InstrumentDevice',pkg_resources.resource_filename(__name__, 'InstrumentDevice.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    InstrumentDevice.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=0&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'InstrumentDevices.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'InstrumentDevices.csv')) as f:
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
                    instrument_model_id = row['instrument_model_id'],
                    platform_device_id = row['platform_device_id'],
                    contact_ids = row['contact_ids'],
                    name = row['id/name'],
                    description = row['id/description'],
                    serial_number = row['id/serial_number'],
                    firmware_version = row['id/firmware_version'],
                    hardware_version = row['id/hardware_version'],
                    controllable = row['id/controllable'],
                    monitorable = row['id/monitorable'],
                    message_controllable = row['id/message_controllable'],
                    reference_urls = row['id/reference_urls'],
                )
            entry = InstrumentDevice(**args)
            entry.create(connection)


