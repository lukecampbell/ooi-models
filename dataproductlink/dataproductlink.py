
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


DataProductLink = PSQLTypes.create_from_yaml('DataProductLink',pkg_resources.resource_filename(__name__, 'DataProductLink.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    DataProductLink.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=23&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'DataProductLinks.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'DataProductLinks.csv')) as f:
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
                    data_product_id = row['data_product_id'],
                    input_resource_id = row['input_resource_id'],
                    source_resource_id = row['source_resource_id'],
                    resource_type = row['resource_type'],
                    comment = row['comment'],
                )
            entry = DataProductLink(**args)
            try:
                entry.create(connection)
            except Exception as e:
                print e.message
                connection.rollback()


