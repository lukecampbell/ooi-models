
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


gradienttest = PSQLTypes.create_from_yaml('gradienttest',pkg_resources.resource_filename(__name__, 'gradienttest.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    gradienttest.reinitialize(connection)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'gradienttests.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            args = dict(
                    instrument_array=row['Array'],
                    instrument_class=row['Instrument Class'],
                    reference_designator=row['Reference Designator'],
                    dat=row['Data Product used as Input Data (DAT)'],
                    x=row['Data Product used as Input Parameter X'],
                    dat_units=row['Units of DAT'],
                    x_units=row['Units of X'],
                    ddatdx=float(row['DDATDX']),
                    mindx=float(row['MINDX']),
                    startdat=float(row['STARTDAT']) if row['STARTDAT'] else None,
                    toldat=float(row['TOLDAT'])
                )
            entry = gradienttest(**args)
            entry.create(connection)


