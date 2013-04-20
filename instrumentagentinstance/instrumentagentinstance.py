
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


InstrumentAgentInstance = PSQLTypes.create_from_yaml('InstrumentAgentInstance',pkg_resources.resource_filename(__name__, 'InstrumentAgentInstance.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    InstrumentAgentInstance.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=21&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'InstrumentAgentInstances.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'InstrumentAgentInstances.csv')) as f:
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
                    instrument_agent_id = row['instrument_agent_id'],
                    instrument_device_id = row['instrument_device_id'],
                    name = row['iai/name'],
                    description = row['iai/description'],
                    comms_device_address = row['comms_device_address'],
                    comms_device_port = row['comms_device_port'],
                    comms_server_address = row['comms_server_address'],
                    comms_server_port = row['comms_server_port'],
                    comms_server_cmd_port = row['comms_server_cmd_port'],
                    alerts = row['alerts'],
                    startup_config = row['startup_config'],
                    comment = row['comment'],

                )
            entry = InstrumentAgentInstance(**args)
            entry.create(connection)


