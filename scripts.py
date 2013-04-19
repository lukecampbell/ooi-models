from data_product import data_product
from parameter import parameter
from parameter_dictionary import parameter_dictionary
from parameter_function import parameter_function
from stream_definition import stream_definition
from grt import grt
from saf_data_product import saf_data_product
from saf_instrument import saf_instrument
from spike_test import spike_test
from stuck_value_test import stuck_value_test
from trend_test import trend_test
from attachment import attachment
from alert import alert
import sys

download_modules = [data_product,parameter,parameter_dictionary,parameter_function,stream_definition, attachment, alert]
all_modules = [
        parameter_dictionary, parameter_function, parameter, stream_definition, data_product, 
        grt, saf_data_product, saf_instrument, spike_test, stuck_value_test, trend_test, attachment, alert]
def download_all():
    for module in download_modules:
        print 'Download for ' + module.__name__
        module.download()

def initialize_all():
    conn = all_modules[0].connection()
    try:
        parameter_dictionary.drop_view(conn)
    except:
        conn.rollback()
    for module in all_modules:
        print 'Initializing ' + module.__name__
        module.initialize(conn)
        print 'Basing...'
        module.base(conn)
    parameter_dictionary.initialize_view(conn)

def new_model(model_name):
    import os
    model_name_lc = model_name.lower()
    path = '%s' % model_name_lc
    os.makedirs(path)

    with open(os.path.join(path,model_name_lc+'.py'), 'w') as f:
        f.write(template % dict(model_name=model_name))
    with open(os.path.join(path,'__init__.py'),'w') as f:
        f.write('\n')
    with open(os.path.join(path,model_name+'.yml'),'w') as f:
        f.write('%s:\n  id: integer*\n' % model_name)


def main():
    if not len(sys.argv) >1:
        download_all()
        initialize_all()
        print 'All models initialized.'
        return
    if sys.argv[1][0] == '-':
        if sys.argv[1]=='-n':
            model_name = sys.argv[2]
            new_model(model_name)
        return
    



template='''
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


%(model_name)s = PSQLTypes.create_from_yaml('%(model_name)s',pkg_resources.resource_filename(__name__, '%(model_name)s.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    %(model_name)s.reinitialize(connection)


def base(connection):
    with open(pkg_resources.resource_filename(__name__,'%(model_name)ss.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            args = dict(
                id = int(row['ID'][4:]),
                )
            entry = %(model_name)s(**args)
            entry.create(connection)


'''
if __name__ == '__main__':
    main()

