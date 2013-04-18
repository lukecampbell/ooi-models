from flask_mvc.model.psql import *
import pkg_resources
import requests
import csv


SAFDataProduct = PSQLTypes.create_from_yaml('SAFDataProduct',pkg_resources.resource_filename(__name__, 'SAFDataProduct.yml'))
connection_string = "dbname='work' user='luke' host='localhost'"

def connection():
    connection = PSQLConnection(connection_string)
    return connection

def initialize(connection):
    SAFDataProduct.reinitialize(connection)
    

def base(connection):
    with open(pkg_resources.resource_filename(__name__,'SAFDataProducts.csv')) as f:
        dr = csv.DictReader(f)
        for i,row in enumerate(dr):
            for k,v in row.iteritems():
                if '%' in v:
                    row[k] = v.replace('%','percent')
            args = dict(
                id=i,
                interp1= row['1-D Interpolation (INTERP1) QC'],
                combine_qc_flags= row['Combine QC Flags (CMBNFLG) QC'],
                condcmp= row['Conductivity Compressibility Compensation (CONDCMP) QC'],
                doors_l2_rq= row['DOORS L2 Science Requirement #(s)'],
                doors_l2_text= row['DOORS L2 Science Requirement Text'],
                dcn= row['DPS DCN(s)'],
                dp_level= row['Data_Product_Level'],
                name= row['Data_Product_Name'],
                polyval_qc= row['Evaluate Polynomial (POLYVAL) QC'],
                glblrng_qc= row['Global Range Test (GLBLRNG) QC'],
                gradtst_qc= row['Gradient Test (GRADTST) QC'],
                loclrng_qc= row['Local Range Test (LOCLRNG) QC'],
                modulus_qc= row['Modulus (MODULUS) QC'],
                notes= row['Notes'],
                flow_diag= row['Processing Flow Diagram DCN(s)'],
                solarel_qc= row['Solar Elevation (SOLAREL) QC'],
                spketst_qc= row['Spike Test (SPKETST) QC'],
                stuckvl_qc= row['Stuck Value Test (STUCKVL) QC'],
                trndtst_qc= row['Trend Test (TRNDTST) QC'],
                units= row['Units'],
                code= row['code'],
                diagrams= row['diagrams'],
                dps= row['dps'],
                dp_id= row['id'],
                instrument_class_list= row['instrument_class_list'],
                level= row['level'],
                description= row['name'],
                regime= row['regime'],
                dp_units= row['units'],
                )

            entry = SAFDataProduct(**args)
            entry.create(connection)









