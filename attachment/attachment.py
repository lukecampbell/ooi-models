
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


Attachment = PSQLTypes.create_from_yaml('Attachment',pkg_resources.resource_filename(__name__, 'Attachment.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    Attachment.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=24&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'Attachments.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'Attachments.csv')) as f:
        dr = csv.DictReader(f)
        for row in dr:
            if 'doc' in row['Scenario'].lower():
                continue
            if 'void' in row['Scenario'].lower():
                continue
            if 'stop' in row['Scenario'].lower():
                continue
            args = dict(
				id=row['ID'],
				scenario=row['Scenario'],
				resource_id=row['resource_id'],
				file_path=row['file_path'],
				name=row['att/name'],
				description=row['att/description'],
				attachment_type=row['att/attachment_type'],
				content_type=row['att/content_type'],
				content=row['att/content'],
				keywords=row['att/keywords'],
				parser=row['parser'],
                )
            entry = Attachment(**args)
            entry.create(connection)


