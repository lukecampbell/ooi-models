
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Contact = PSQLTypes.create_from_yaml('Contact',pkg_resources.resource_filename(__name__, 'Contact.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Contact.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=45&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Contacts.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Contacts.csv')) as f:
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
                confluence = row['confluence'],
                individual_names_given = row['c/individual_names_given'],
                individual_name_family = row['c/individual_name_family'],
                organization_name = row['c/organization_name'],
                position_name = row['c/position_name'],
                email = row['c/email'],
                url = row['c/url'],
                street_address = row['c/street_address'],
                city = row['c/city'],
                postal_code = row['c/postal_code'],
                administrative_area = row['c/administrative_area'],
                country = row['c/country'],
                phones = row['c/phones'],
                roles = row['c/roles'],
                )
            entry = Contact(**args)
            entry.create(connection)


