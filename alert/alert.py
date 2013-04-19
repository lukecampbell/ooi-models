
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Alert = PSQLTypes.create_from_yaml('Alert',pkg_resources.resource_filename(__name__, 'Alert.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Alert.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=69&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Alerts.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Alerts.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            args = dict(
                    scenario=row['Scenario'],
                    id=row['ID'],
                    name=row['name'],
                    message=row['message'],
                    type=row['type'],
                    range=row['range'],
                    config=row['config'],
                )
            entry = Alert(**args)
            entry.create(connection)


