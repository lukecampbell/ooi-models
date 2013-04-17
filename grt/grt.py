from flask_mvc.model.psql import *
import pkg_resources
import csv


GRT = PSQLTypes.create_from_yaml('GRT',pkg_resources.resource_filename(__name__, 'GRT.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):

    GRT.reinitialize(connection)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Data_QC_Lookup_Table_Global_Range_Test_2013-2-21.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            instrument_array = row['Array']
            instrument_class = row['Instrument Class']
            reference_designator = row['Reference Designator']
            data_products = row['Data Products']
            units = row['Units']
            flagged = row['Data Product Flagged']
            grt_min = row['Minimum Range (lim(1))']
            try:
                grt_min = float(grt_min)
            except ValueError:
                grt_min = None
            grt_max = row['Maximum Range (lim(2))']
            try:
                grt_max = float(grt_max)
            except ValueError:
                grt_max = None
            try:
                unicode(units)
            except UnicodeDecodeError:
                print 'Unicode detected'
                print row
                continue
            units = units.replace('%','percent')

            entry = GRT(instrument_array=instrument_array, 
                    instrument_class=instrument_class, 
                    reference_designator=reference_designator,
                    data_products=data_products,
                    units=unicode(units),
                    flagged=flagged,
                    grt_min=grt_min,
                    grt_max=grt_max)
            entry.create(connection)






