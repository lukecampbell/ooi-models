
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


StreamConfiguration = PSQLTypes.create_from_yaml('StreamConfiguration',pkg_resources.resource_filename(__name__, 'StreamConfiguration.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    StreamConfiguration.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=56&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'StreamConfigurations.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'StreamConfigurations.csv')) as f:
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
                    name = row['cfg/stream_name'],
                    parameter_dictionary_name = row['cfg/parameter_dictionary_name'],
                    records_per_granule = row['cfg/records_per_granule'],
                    granule_publish_rate = row['cfg/granule_publish_rate'],
                )
            entry = StreamConfiguration(**args)
            entry.create(connection)


