from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


StreamDefinition = PSQLTypes.create_from_yaml('StreamDefinition',pkg_resources.resource_filename(__name__, 'StreamDefinition.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    StreamDefinition.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=13&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'StreamDefinitions.csv'),'w') as f:
            f.write(response.content)
    

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'StreamDefinitions.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if row['SKIP']:
                continue
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if not row['ID']:
                continue
            args = dict(
                scenario = row['Scenario'],
                id = row['ID'],
                name = row['Name'],
                instrument_class = row['Instrument Class'],
                instrument_series = row['Instrument Series'],
                function_type = row['Function Type'],
                function = row['Function'],
                owner = row['Owner'],
                args = row['Args'],
                kwargs = row['Kwargs']
                )




            entry = StreamDefinition(**args)
            entry.create(connection)









