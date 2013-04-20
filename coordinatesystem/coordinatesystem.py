
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


CoordinateSystem = PSQLTypes.create_from_yaml('CoordinateSystem',pkg_resources.resource_filename(__name__, 'CoordinateSystem.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    CoordinateSystem.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=46&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'CoordinateSystems.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'CoordinateSystems.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            args = dict(
                scenario = row['Scenario'],
                id = row['ID'],
                owner_id = row['owner_id'],
                confluence = row['confluence'],
                geospatial_geodetic_crs = row['m/geospatial_geodetic_crs'],
                geospatial_vertical_crs = row['m/geospatial_vertical_crs'],
                geospatial_latitude_units = row['m/geospatial_latitude_units'],
                geospatial_longitude_units = row['m/geospatial_longitude_units'],
                geospatial_vertical_units = row['m/geospatial_vertical_units'],
                geospatial_vertical_positive = row['m/geospatial_vertical_positive'],
                )
            entry = CoordinateSystem(**args)
            entry.create(connection)


