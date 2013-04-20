
from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


InstrumentModel = PSQLTypes.create_from_yaml('InstrumentModel',pkg_resources.resource_filename(__name__, 'InstrumentModel.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    InstrumentModel.reinitialize(connection)

def download():
    base_url = 'https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE'
    url = '%s&single=true&gid=4&output=csv' % base_url
    response = requests.get(url)
    if response.status_code == 200:
        with open(pkg_resources.resource_filename(__name__,'InstrumentModels.csv'),'w') as f:
            f.write(response.content)

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'InstrumentModels.csv')) as f:
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
                    scenario = row['Scenario'],
                    id = row['ID'],
                    owner_id = row['owner_id'],
                    org_ids = row['org_ids'],
                    name = row['im/name'],
                    description = row['im/description'],
                    reference_urls = row['im/reference_urls'],
                    instrument_family = row['im/instrument_family'],
                    instrument_classes_supported = row['im/instrument_classes_supported'],
                    primary_interface = row['im/primary_interface'],
                    baud_rate_default = row['im/baud_rate_default'],
                    manufacturer = row['im/manufacturer'],
                    manufacturer_url = row['im/manufacturer_url'],
                    mixed_sampling_mode = row['im/mixed_sampling_mode'],
                    internal_data_storage = row['im/internal_data_storage'],
                    integrated_inductive_modem_available = row['im/integrated_inductive_modem_available'],
                    internal_battery = row['im/internal_battery'],
                    clock_max_drift = row['im/clock_max_drift'],
                    operational_depth_maximum = row['im/operational_depth_maximum'],
                    survival_depth_maximum = row['im/survival_depth_maximum'],
                    hotel_current = row['im/hotel_current'],
                    electrical_notes = row['im/electrical_notes'],
                    power_source = row['im/power_source'],
                    clock_notes = row['im/clock_notes'],
                    power_supply_voltage_minimum = row['im/power_supply_voltage_minimum'],
                    power_supply_voltage_maximum = row['im/power_supply_voltage_maximum'],
                    weight = row['im/weight'],
                    voltage = row['im/voltage'],
                    wattage = row['im/wattage'],
                    height = row['im/height'],
                    length = row['im/length'],
                    width = row['im/width'],
                    required_on_time = row['im/required_on_time'],

                )
            entry = InstrumentModel(**args)
            entry.create(connection)


