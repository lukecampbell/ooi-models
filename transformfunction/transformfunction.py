
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


TransformFunction = PSQLTypes.create_from_yaml('TransformFunction',pkg_resources.resource_filename(__name__, 'TransformFunction.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    TransformFunction.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=64&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'TransformFunctions.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'TransformFunctions.csv')) as f:
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
                    name = row['tfm/name'],
                    module = row['tfm/module'],
                    cls = row['tfm/cls'],
                    uri = row['tfm/uri'],
                    function_type = row['tfm/function_type'],
                    description = row['tfm/description'],
                )
            entry = TransformFunction(**args)
            entry.create(connection)


