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
    p.visible as visible,
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
    

def initialize_saf_instrument_view(engine):
    conn = engine.connect()
    conn.execute('''CREATE VIEW saf_instrument_view AS
SELECT 
    i.class,
    i.first_deployment_date,
    i.platform_agent_type,
    i.relative_depth,
    i.saf_deploy_date,
    i.da_pr,
    i.da_rt,
    i.data_product_list,
    i.deploy_date,
    i.depth_port_max,
    i.depth_port_min,
    i.depth_subsite,
    i.ia_rt_data,
    i.id,
    i.instrument_class,
    i.instrument_model,
    i.instrument_model1,
    i.instrument_series,
    i.instrument_subseries,
    i.latitude,
    i.longitude,
    i.makemodel,
    i.ready_for_2013,
    dp.combine_qc_flags_cmbnflg_qc,
    dp.conductivity_compressibility_compensation_condcmp_qc,
    dp.doors_l2_science_requirement_s,
    dp.doors_l2_science_requirement_text,
    dp.dps_dcn_s,
    dp.data_product_level,
    dp.data_product_name,
    dp.evaluate_polynomial_polyval_qc,
    dp.global_range_test_glblrng_qc,
    dp.gradient_test_gradtst_qc,
    dp.local_range_test_loclrng_qc,
    dp.modulus_modulus_qc,
    dp.notes,
    dp.processing_flow_diagram_dcn_s,
    dp.solar_elevation_solarel_qc,
    dp.spike_test_spketst_qc,
    dp.stuck_value_test_stuckvl_qc,
    dp.trend_test_trndtst_qc,
    dp.code,
    dp.diagrams,
    dp.dps,
    dp.id as dp_id,
    dp.instrument_class_list,
    dp.level,
    dp.name,
    dp.regime,
    dp.units
FROM 
    saf_instrument_refs
INNER JOIN 
    saf_instruments as i on i.id=saf_instrument_refs.instrument_id
INNER JOIN
    saf_data_products as dp on dp.id=saf_instrument_refs.data_product_id''')


def drop_saf_instrument_view(engine):
    conn = engine.connect()
    conn.execute('DROP VIEW IF EXISTS saf_instrument_view')

