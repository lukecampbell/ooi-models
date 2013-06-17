#!/usr/bin/env python

def initialize_view(engine):
    conn = engine.connect()
    conn.execute('''CREATE VIEW pdict_view AS
SELECT 
    pdict.scenario as pdict_scenario,
    pdict.id as pdict_id,
    pdict.name as pdict_name,
    p.scenario as scenario,
    p.confluence as confluence,
    p.name as name,
    p.id as id,
    p.parameter_type as parameter_type,
    p.value_encoding as value_encoding,
    p.code_set as code_set,
    p.unit_of_measure as unit_of_measure,
    p.fill_value as fill_value,
    p.display_name as display_name,
    p.precision as precision,
    p.parameter_function_map as parameter_function_map,
    p.lookup_value as lookup_value, 
    p.qc_functions as qc_functions,
    p.standard_name as standard_name,
    p.data_product_identifier as data_product_identifier,
    p.reference_urls as reference_urls,
    p.description as description,
    p.review_status as review_status,
    p.review_comment as review_comment,
    p.long_name as long_name,
    pfunc.id as pfunc_id,
    pfunc.name as pfunc_name,
    pfunc.instrument_class as pfunc_instrument_class,
    pfunc.instrument_series as pfunc_instrument_series,
    pfunc.function_type as pfunc_function_type,
    pfunc.function as pfunc_function,
    pfunc.owner as pfunc_owner,
    pfunc.args as pfunc_args
    
FROM 
    parameterrefs as pref
    
LEFT JOIN
    parameterdictionaries as pdict on pref.pdict_id = pdict.id
LEFT JOIN
    parameterdefs as p on pref.param_id = p.id
LEFT JOIN
    parameterfunctions as pfunc on p.parameter_function_id=pfunc.id''')
    

def drop_view(engine):
    conn = engine.connect()
    conn.execute('DROP VIEW IF EXISTS pdict_view')
