from flask_mvc.model.psql import *
import pkg_resources
import csv


TrendTest = PSQLTypes.create_from_yaml('TrendTest',pkg_resources.resource_filename(__name__, 'TrendTest.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):

    TrendTest.reinitialize(connection)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Data_QC_Lookup_Table_Trend_Test.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            instrument_array = row['Array']
            instrument_class = row['Instrument Class']
            reference_designator = row['Reference Designator']
            data_products = row['Data Products']
            try:
                time_interval = float(row['Time interval length in days'])
            except ValueError:
                time_interval = None
            try:
                polynomial_order = int(row['Polynomial order'])
            except ValueError:
                polynomial_order = None
            try:
                standard_deviation = float(row['Standard deviation reduction factor (nstd)'])
            except ValueError:
                standard_deviation = None


            entry = TrendTest(instrument_array=instrument_array, 
                    instrument_class=instrument_class, 
                    reference_designator=reference_designator,
                    data_products=data_products,
                    time_interval=time_interval,
                    polynomial_order=polynomial_order,
                    standard_deviation=standard_deviation)
            entry.create(connection)

