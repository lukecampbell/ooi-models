from flask_mvc.model.psql import *
import pkg_resources
import csv


StuckValueTest = PSQLTypes.create_from_yaml('StuckValueTest',pkg_resources.resource_filename(__name__, 'StuckValueTest.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):

    StuckValueTest.reinitialize(connection)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Data_QC_Lookup_Table_Stuck_Value_Test.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            instrument_array = row['Array']
            instrument_class = row['Instrument Class']
            reference_designator = row['Reference Designator']
            data_products = row['Data Products']
            units = row['Units']
            try:
                resolution_r = float(row['Resolution R'])
            except ValueError:
                resolution_r = None
            try:
                number_n = int(row['Number of repeat values N'])
            except ValueError:
                number_n = None
            try:
                unicode(units)
            except UnicodeDecodeError:
                print 'Unicode detected'
                print row
                continue
            units = units.replace('%','percent')

            entry = StuckValueTest(instrument_array=instrument_array, 
                    instrument_class=instrument_class, 
                    reference_designator=reference_designator,
                    data_products=data_products,
                    units=unicode(units),
                    resolution_r=resolution_r,
                    number_n=number_n
                    )

            entry.create(connection)







