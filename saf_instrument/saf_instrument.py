from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


SAFInstrumentDevice = PSQLTypes.create_from_yaml('SAFInstrumentDevice',pkg_resources.resource_filename(__name__, 'SAFInstrumentDevice.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    SAFInstrumentDevice.reinitialize(connection)


def base(connection):
    with open(pkg_resources.resource_filename(__name__,'SAFInstrumentDevices.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            for k,v in row.iteritems():
                if '%' in v:
                    row[k] = v.replace('%','percent')
            args = dict(
                    iclass=row['Class'],
                    first_deployment_date=row['First Deployment Date'],
                    platform_agent_type=row['Platform Agent Type'],
                    relative_depth=row['Relative Depth'],
                    data_agent_recovery=row['data_agent_recovery'],
                    data_agent_rt=row['data_agent_rt'],
                    data_product_list=row['data_product_list'],
                    deploy_date=row['deploy_date'],
                    depth_port_max=row['depth_port_max'],
                    depth_port_min=row['depth_port_min'],
                    depth_subsite=row['depth_subsite'],
                    id=row['id'],
                    instrument_agent_rt=row['instrument_agent_rt'],
                    instrument_class=row['instrument_class'],
                    instrument_model=row['instrument_model'],
                    instrument_model1=row['instrument_model1'],
                    instrument_series=row['instrument_series'],
                    instrument_subseries=row['instrument_subseries'],
                    latitude=row['latitude'],
                    longitude=row['longitude'],
                    makemodel=row['makemodel'],
                    ready_for_2013=row['ready_for_2013'],
                )




            entry = SAFInstrumentDevice(**args)
            entry.create(connection)

