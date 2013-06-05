from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


DataProduct = PSQLTypes.create_from_yaml('DataProduct',pkg_resources.resource_filename(__name__, 'DataProduct.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    DataProduct.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=7&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'DataProducts.csv'),'w') as f:
            f.write(response.content)
    
def parse_bool(val):
    val = val.strip()
    if val.lower()=='true':
        return True
    elif val.lower()=='false':
        return False
    raise TypeError('Unsupported Boolean Value: %s' % val)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'DataProducts.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            if not row['ID']:
                continue
            try:
                args = dict(
                    scenario=row['Scenario'],
                    id=row['ID'],
                    owner_id=row['owner_id'],
                    lcstate=row['lcstate'],
                    org_ids=row['org_ids'],
                    stream_def_id=row['stream_def_id'],
                    persist_metadata=parse_bool(row['persist_metadata']),
                    persist_data=parse_bool(row['persist_data']),
                    geo_constraint_id=row['geo_constraint_id'],
                    coordinate_system_id=row['coordinate_system_id'],
                    contact_ids=row['contact_ids'],
                    name=row['dp/name'],
                    description=row['dp/description'],
                    processing_level=row['dp/processing_level_code'],
                    ooi_short_name=row['dp/ooi_short_name'],
                    ooi_product_name=row['dp/ooi_product_name']
                    )
            except TypeError:
                print row
                continue
            entry = DataProduct(**args)
            try:
                entry.create(connection)
            except Exception as e:
                connection.rollback()
                print e.message










