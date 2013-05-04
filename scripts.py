from alert import alert
from attachment import attachment
from constraint import constraint
from contact import contact
from coordinatesystem import coordinatesystem
from data_product import data_product
from dataprocess import dataprocess
from dataprocessdefinition import dataprocessdefinition
from dataproductlink import dataproductlink
from deployment import deployment
from externaldataprovider import externaldataprovider
from externaldataset import externaldataset
from externaldatasetagent import externaldatasetagent
from externaldatasetagentinstance import externaldatasetagentinstance
from externaldatasetmodel import externaldatasetmodel
from grt import grt
from instrumentagent import instrumentagent
from instrumentagentinstance import instrumentagentinstance
from instrumentdevice import instrumentdevice
from instrumentmodel import instrumentmodel
from instrumentsite import instrumentsite
from observatory import observatory
from org import org
from parameter import parameter
from parameter_dictionary import parameter_dictionary
from parameter_function import parameter_function
from parametercontext import parametercontext
from parser import parser
from platformagent import platformagent
from platformagentinstance import platformagentinstance
from platformdevice import platformdevice
from platformmodel import platformmodel
from platformsite import platformsite
from policy import policy
from saf_data_product import saf_data_product
from saf_instrument import saf_instrument
from sensordevice import sensordevice
from sensormodel import sensormodel
from spike_test import spike_test
from stream_definition import stream_definition
from streamconfiguration import streamconfiguration
from stuck_value_test import stuck_value_test
from subsite import subsite
from transformfunction import transformfunction
from trend_test import trend_test
from user import user
import sys

'''
|+alert/
|+attachment/
|+constraint/
|+contact/
|+coordinatesystem/
|+data_product/
|+dataprocess/
|+dataprocessdefinition/
|+dataproductlink/
|+deployment/
|+externaldataprovider/
|+externaldataset/
|+externaldatasetagent/
|+externaldatasetagentinstance/
|+externaldatasetmodel/
|+grt/
|+instrumentagent/
|+instrumentagentinstance/
|+instrumentdevice/
|+instrumentmodel/
|+instrumentsite/
|+observatory/
|+org/
|+parameter/
|+parameter_dictionary/
|+parameter_function/
|+parametercontext/
|+parser/
|+platformagent/
|+platformagentinstance/
|+platformdevice/
|+platformmodel/
|+platformsite/
|+policy/
|+saf_data_product/
|+saf_instrument/
|+sensordevice/
|+sensormodel/
|+spike_test/
|+stream_definition/
|+streamconfiguration/
|+stuck_value_test/
|+subsite/
|+transformfunction/
|+trend_test/
'''

download_modules = [data_product,
    parametercontext,
    parameter_dictionary,
    parameter_function,
    stream_definition,
    alert,
    attachment, 
    constraint, 
    contact, 
    coordinatesystem,
    data_product,
    dataprocess,
    dataprocessdefinition,
    dataproductlink,
    deployment,
    externaldataprovider,
    externaldataset,
    externaldatasetagent,
    externaldatasetagentinstance,
    instrumentagent,
    instrumentagentinstance,
    instrumentdevice,
    instrumentmodel,
    instrumentsite,
    observatory,
    org,
    parameter_dictionary,
    parameter_function,
    parametercontext,
    parser,
    platformagent,
    platformagentinstance,
    platformdevice,
    platformsite,
    policy,
    sensordevice,
    sensormodel,
    stream_definition,
    streamconfiguration,
    subsite,
    transformfunction,
    user,
    
    ]
all_modules = [
alert,
attachment,
constraint,
contact,
coordinatesystem,
data_product,
dataprocess,
dataprocessdefinition,
dataproductlink,
deployment,
externaldataprovider,
externaldataset,
externaldatasetagent,
externaldatasetagentinstance,
externaldatasetmodel,
grt,
instrumentagent,
instrumentagentinstance,
instrumentdevice,
instrumentmodel,
instrumentsite,
observatory,
org,
parameter,
parameter_dictionary,
parameter_function,
parametercontext,
parser,
platformagent,
platformagentinstance,
platformdevice,
platformmodel,
platformsite,
policy,
saf_data_product,
saf_instrument,
sensordevice,
sensormodel,
spike_test,
stream_definition,
streamconfiguration,
stuck_value_test,
subsite,
transformfunction,
trend_test,
user,
    ]
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

        if sys.argv[1] == '-r':
            model_name = sys.argv[2]
            lc_name = model_name.lower()
            module = __import__('%s.%s' % (lc_name,lc_name), fromlist=[''])
            if hasattr(module,'download'):
                print 'Downloading ', model_name
                module.download()
            conn = module.connection()
            print 'Initializing ', model_name
            module.initialize(conn)
            print 'Basing ', model_name
            module.base(conn)
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

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%%s&single=true&gid=32&output=csv' %% base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'%(model_name)ss.csv'),'w') as f:
            f.write(response.content)

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
            if not row['Scenario']:
                continue
            args = dict(
                id = int(row['ID'][4:]),
                )
            entry = %(model_name)s(**args)
            entry.create(connection)


'''
if __name__ == '__main__':
    main()

