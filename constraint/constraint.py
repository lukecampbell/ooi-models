
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Constraint = PSQLTypes.create_from_yaml('Constraint',pkg_resources.resource_filename(__name__, 'Constraint.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Constraint.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=41&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Constraints.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Constraints.csv')) as f:
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
                    owner_id=row['owner_id'],
                    confluence=row['confluence'],
                    type=row['type'],
                    south=row['south'],
                    north=row['north'],
                    west=row['west'],
                    east=row['east'],
                    top=row['top'],
                    bottom=row['bottom'],
                    vertical_direction=row['vertical_direction'],
                    start=row['start'],
                    end=row['end'],
                )
            entry = Constraint(**args)
            entry.create(connection)


