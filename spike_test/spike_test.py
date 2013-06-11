from flask_mvc.model.psql import *
import pkg_resources
import csv


SpikeTest = PSQLTypes.create_from_yaml('SpikeTest',pkg_resources.resource_filename(__name__, 'SpikeTest.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):

    SpikeTest.reinitialize(connection)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Data_QC_Lookup_Table_spike_test_updated.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            instrument_array = row['Array']
            instrument_class = row['Instrument Class']
            reference_designator = row['Reference Designator']
            data_products = row['Data Products']
            units = row['Units']
            try:
                accuracy = float(row['ACC'])
            except ValueError:
                accuracy = None
            try:
                spike_n = float(row['N'])
            except ValueError:
                spike_n = None
            try:
                spike_l = float(row['L'])
            except ValueError:
                spike_l = None
            try:
                unicode(units)
            except UnicodeDecodeError:
                print 'Unicode detected'
                print row
                continue
            units = units.replace('%','percent')

            entry = SpikeTest(instrument_array=instrument_array, 
                    instrument_class=instrument_class, 
                    reference_designator=reference_designator,
                    data_products=data_products,
                    units=units,
                    accuracy=accuracy,
                    spike_n=spike_n,
                    spike_l=spike_l
                    )

            entry.create(connection)








