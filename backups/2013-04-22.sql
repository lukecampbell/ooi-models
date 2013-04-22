--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alerts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE alerts (
    scenario character varying(128),
    id character varying(128) NOT NULL,
    name character varying(128),
    message text,
    type character varying(32),
    range character varying(32),
    config text
);


ALTER TABLE public.alerts OWNER TO luke;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE attachments (
    id character varying(128) NOT NULL,
    scenario character varying(32),
    resource_id character varying(128),
    file_path character varying(128),
    name character varying(128),
    description text,
    attachment_type character varying(32),
    content_type character varying(128),
    content character varying(128),
    keywords character varying(128),
    parser character varying(32)
);


ALTER TABLE public.attachments OWNER TO luke;

--
-- Name: constraints; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE constraints (
    scenario character varying(128),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    confluence text,
    type character varying(32),
    south double precision,
    north double precision,
    west double precision,
    east double precision,
    top double precision,
    bottom double precision,
    vertical_direction character varying(32),
    start_date character varying(128),
    end_date character varying(128)
);


ALTER TABLE public.constraints OWNER TO luke;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE contacts (
    scenario character varying(128),
    id character varying(32) NOT NULL,
    confluence character varying(128),
    individual_names_given character varying(32),
    individual_name_family character varying(32),
    organization_name character varying(128),
    position_name character varying(128),
    email character varying(128),
    url text,
    street_address character varying(128),
    city character varying(128),
    postal_code character varying(128),
    administrative_area character varying(32),
    country character varying(32),
    phones text,
    roles character varying(128)
);


ALTER TABLE public.contacts OWNER TO luke;

--
-- Name: coordinatesystems; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE coordinatesystems (
    scenario character varying(128),
    id character varying(128) NOT NULL,
    owner_id character varying(128),
    confluence text,
    geospatial_geodetic_crs text,
    geospatial_vertical_crs text,
    geospatial_latitude_units character varying(128),
    geospatial_longitude_units character varying(128),
    geospatial_vertical_units character varying(128),
    geospatial_vertical_positive character varying(128)
);


ALTER TABLE public.coordinatesystems OWNER TO luke;

--
-- Name: dataprocessdefinitions; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE dataprocessdefinitions (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    org_ids character varying(32),
    input_stream_defs character varying(128),
    output_stream_defs text,
    name character varying(128),
    description text,
    module text,
    class_name character varying(128)
);


ALTER TABLE public.dataprocessdefinitions OWNER TO luke;

--
-- Name: dataprocesses; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE dataprocesses (
    scenario character varying(128),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    org_ids character varying(32),
    data_process_definition_id character varying(128),
    in_data_product_id character varying(128),
    out_data_products text,
    configuration text,
    comment text
);


ALTER TABLE public.dataprocesses OWNER TO luke;

--
-- Name: dataproductlinks; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE dataproductlinks (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    data_product_id character varying(32),
    input_resource_id character varying(32),
    source_resource_id character varying(32),
    resource_type character varying(32),
    comment text
);


ALTER TABLE public.dataproductlinks OWNER TO luke;

--
-- Name: dataproducts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE dataproducts (
    scenario character varying(128),
    id character varying(128) NOT NULL,
    owner_id character varying(128),
    lcstate character varying(128),
    org_ids character varying(128),
    stream_def_id character varying(128) NOT NULL,
    persist_metadata boolean,
    persist_data boolean,
    geo_constraint_id character varying(128),
    coordinate_system_id character varying(128),
    contact_ids text,
    name character varying(128),
    description text,
    processing_level character varying(128),
    ooi_short_name character varying(128),
    ooi_product_name character varying(128)
);


ALTER TABLE public.dataproducts OWNER TO luke;

--
-- Name: deployments; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE deployments (
    scenario character varying(32),
    confluence text,
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    org_ids character varying(32),
    site_id character varying(32),
    device_id character varying(32),
    activate boolean,
    name character varying(32),
    description text,
    constraint_ids character varying(128),
    coordinate_system character varying(128),
    context_type character varying(128)
);


ALTER TABLE public.deployments OWNER TO luke;

--
-- Name: externaldataproviders; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE externaldataproviders (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(128),
    lcstate character varying(128),
    org_ids character varying(128),
    contact_id character varying(128),
    name character varying(32),
    description text
);


ALTER TABLE public.externaldataproviders OWNER TO luke;

--
-- Name: externaldatasetagentinstances; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE externaldatasetagentinstances (
    scenario character varying(32),
    confluence text,
    id character varying(32) NOT NULL,
    owner_id character varying(128),
    org_ids character varying(128),
    name character varying(128),
    description text,
    agent character varying(32),
    dataset character varying(32),
    streamdef character varying(32),
    agent_config text,
    driver_config text,
    handler_module text,
    handler_class character varying(128),
    parser_module text,
    parser_class character varying(128)
);


ALTER TABLE public.externaldatasetagentinstances OWNER TO luke;

--
-- Name: externaldatasetagents; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE externaldatasetagents (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    lcstate character varying(32),
    org_ids character varying(32),
    dataset_id character varying(32),
    name character varying(128),
    description text,
    agent_version character varying(128),
    handler_module text,
    handler_class character varying(128),
    dataset_model character varying(32)
);


ALTER TABLE public.externaldatasetagents OWNER TO luke;

--
-- Name: externaldatasetmodels; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE externaldatasetmodels (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    lcstate character varying(32),
    org_ids character varying(128),
    name character varying(128),
    description text,
    dataset_type character varying(128)
);


ALTER TABLE public.externaldatasetmodels OWNER TO luke;

--
-- Name: externaldatasets; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE externaldatasets (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    lcstate character varying(32),
    org_ids character varying(32),
    contact_id character varying(32),
    name character varying(128),
    description text,
    data_sampling character varying(128),
    parameters text,
    model character varying(32)
);


ALTER TABLE public.externaldatasets OWNER TO luke;

--
-- Name: grts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE grts (
    instrument_array character varying(128),
    instrument_class character varying(128),
    reference_designator character varying(128) NOT NULL,
    data_products character varying(128) NOT NULL,
    units character varying(128),
    flagged character varying(128),
    grt_min double precision,
    grt_max double precision
);


ALTER TABLE public.grts OWNER TO luke;

--
-- Name: instrumentagentinstances; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE instrumentagentinstances (
    scenario character varying(32) NOT NULL,
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    org_ids character varying(32),
    instrument_agent_id character varying(32),
    instrument_device_id character varying(32),
    name character varying(128),
    description text,
    comms_device_address character varying(128),
    comms_device_port character varying(32),
    comms_server_address character varying(128),
    comms_server_port character varying(32),
    comms_server_cmd_port character varying(32),
    alerts character varying(128),
    startup_config text,
    comment text
);


ALTER TABLE public.instrumentagentinstances OWNER TO luke;

--
-- Name: instrumentagents; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE instrumentagents (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    lcstate character varying(32),
    org_ids character varying(32),
    instrument_model_ids character varying(128),
    name character varying(128),
    description text,
    agent_version character varying(128),
    driver_uri text,
    driver_module text,
    driver_class character varying(128),
    stream_configurations character varying(128)
);


ALTER TABLE public.instrumentagents OWNER TO luke;

--
-- Name: instrumentdevices; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE instrumentdevices (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    confluence text,
    owner_id character varying(32),
    lcstate character varying(32),
    org_ids character varying(128),
    instrument_model_id character varying(32),
    platform_device_id character varying(32),
    contact_ids character varying(128),
    name character varying(128),
    description text,
    serial_number character varying(128),
    firmware_version character varying(128),
    hardware_version character varying(128),
    controllable character varying(128),
    monitorable character varying(128),
    message_controllable character varying(128),
    reference_urls text
);


ALTER TABLE public.instrumentdevices OWNER TO luke;

--
-- Name: instrumentmodels; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE instrumentmodels (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    owner_id character varying(32),
    org_ids character varying(32),
    name character varying(128),
    description text,
    reference_urls text,
    instrument_family character varying(32),
    instrument_classes_supported character varying(128),
    primary_interface character varying(128),
    baud_rate_default character varying(32),
    manufacturer character varying(128),
    manufacturer_url character varying(128),
    mixed_sampling_mode boolean,
    internal_data_storage boolean,
    integrated_inductive_modem_available boolean,
    internal_battery boolean,
    clock_max_drift integer,
    operational_depth_maximum integer,
    survival_depth_maximum integer,
    hotel_current character varying(128),
    electrical_notes character varying(128),
    power_source character varying(128),
    clock_notes character varying(128),
    power_supply_voltage_minimum character varying(128),
    power_supply_voltage_maximum character varying(128),
    weight character varying(128),
    voltage character varying(128),
    wattage character varying(128),
    height character varying(128),
    length character varying(128),
    width character varying(128),
    required_on_time character varying(128)
);


ALTER TABLE public.instrumentmodels OWNER TO luke;

--
-- Name: instrumentsites; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE instrumentsites (
    scenario character varying(32),
    id character varying(32) NOT NULL,
    confluence text,
    owner_id character varying(32),
    org_ids character varying(32),
    parent_site_id character varying(32),
    instrument_model_ids character varying(32),
    name character varying(128),
    description text,
    constraint_ids character varying(128),
    coordinate_system character varying(32)
);


ALTER TABLE public.instrumentsites OWNER TO luke;

--
-- Name: parametercontexts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE parametercontexts (
    scenario character varying(128),
    confluence character varying(128),
    name character varying(128),
    id integer NOT NULL,
    parameter_type character varying(128),
    value_encoding character varying(128),
    code_set character varying(128),
    uom character varying(128),
    fill_value character varying(128),
    parameter_function_id integer,
    pmap text,
    lookup_value character varying(128),
    qc_functions character varying(128),
    data_product character varying(128)
);


ALTER TABLE public.parametercontexts OWNER TO luke;

--
-- Name: parameterdictionaries; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE parameterdictionaries (
    scenario character varying(128),
    id integer NOT NULL,
    confluence character varying(128),
    name character varying(128),
    parameter_ids text,
    temporal_parameter integer
);


ALTER TABLE public.parameterdictionaries OWNER TO luke;

--
-- Name: parameterfunctions; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE parameterfunctions (
    scenario character varying(128),
    id integer NOT NULL,
    name character varying(128),
    instrument_class character varying(128),
    instrument_series character varying(128),
    function_type character varying(128),
    function character varying(128),
    owner character varying(128),
    args character varying(128),
    kwargs character varying(128)
);


ALTER TABLE public.parameterfunctions OWNER TO luke;

--
-- Name: parameterrelations; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE parameterrelations (
    parameter_id integer NOT NULL,
    pdict_id integer NOT NULL
);


ALTER TABLE public.parameterrelations OWNER TO luke;

--
-- Name: safdataproducts; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE safdataproducts (
    id integer NOT NULL,
    interp1 character varying(128),
    combine_qc_flags character varying(128),
    condcmp character varying(128),
    doors_l2_rq text,
    doors_l2_text text,
    dcn text,
    dp_level character varying(128),
    name character varying(128),
    polyval_qc character varying(128),
    glblrng_qc character varying(128),
    gradtst_qc character varying(128),
    loclrng_qc character varying(128),
    modulus_qc character varying(128),
    notes text,
    flow_diag text,
    solarel_qc character varying(128),
    spketst_qc character varying(128),
    stuckvl_qc character varying(128),
    trndtst_qc character varying(128),
    units character varying(128),
    code character varying(128),
    diagrams character varying(128),
    dps character varying(128),
    dp_id character varying(128),
    instrument_class_list text,
    level character varying(128),
    description character varying(128),
    regime character varying(128),
    dp_units character varying(128)
);


ALTER TABLE public.safdataproducts OWNER TO luke;

--
-- Name: safinstrumentdevices; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE safinstrumentdevices (
    iclass character varying(128),
    first_deployment_date character varying(128),
    platform_agent_type character varying(128),
    relative_depth character varying(128),
    data_agent_recovery character varying(128),
    data_agent_rt character varying(128),
    data_product_list text,
    deploy_date character varying(128),
    depth_port_max character varying(128),
    depth_port_min character varying(128),
    depth_subsite character varying(128),
    id character varying(128) NOT NULL,
    instrument_agent_rt character varying(128),
    instrument_class character varying(128),
    instrument_model character varying(128),
    instrument_model1 character varying(128),
    instrument_series character varying(128),
    instrument_subseries character varying(128),
    latitude character varying(128),
    longitude character varying(128),
    makemodel character varying(128),
    ready_for_2013 character varying(128)
);


ALTER TABLE public.safinstrumentdevices OWNER TO luke;

--
-- Name: spiketests; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE spiketests (
    instrument_array character varying(128),
    instrument_class character varying(128),
    reference_designator character varying(128) NOT NULL,
    data_products character varying(128) NOT NULL,
    units character varying(128),
    accuracy double precision,
    spike_n double precision,
    spike_l double precision
);


ALTER TABLE public.spiketests OWNER TO luke;

--
-- Name: streamdefinitions; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE streamdefinitions (
    scenario character varying(128),
    id character varying(32) NOT NULL,
    comment character varying(128),
    org_ids character varying(128),
    name character varying(128),
    description text,
    pdict_name character varying(128),
    available_fields character varying(128)
);


ALTER TABLE public.streamdefinitions OWNER TO luke;

--
-- Name: stuckvaluetests; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE stuckvaluetests (
    instrument_array character varying(128),
    instrument_class character varying(128),
    reference_designator character varying(128) NOT NULL,
    data_products character varying(128) NOT NULL,
    units character varying(128),
    resolution_r double precision,
    number_n integer
);


ALTER TABLE public.stuckvaluetests OWNER TO luke;

--
-- Name: trendtests; Type: TABLE; Schema: public; Owner: luke; Tablespace: 
--

CREATE TABLE trendtests (
    instrument_array character varying(128),
    instrument_class character varying(128),
    reference_designator character varying(128) NOT NULL,
    data_products character varying(128) NOT NULL,
    time_interval double precision,
    polynomial_order integer,
    standard_deviation double precision
);


ALTER TABLE public.trendtests OWNER TO luke;

--
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY alerts (scenario, id, name, message, type, range, config) FROM stdin;
R2_DEMO	AA1	temperature_warning_interval	Temperature is below the normal range of 50.0 and above.	WARNING	50<temp	
BETA	PREST1	temperature_min_alert_interval	PTemp value below 0 C	ALERT	0< pressure_temp	
BETA	PREST2	temperature_max_alert_interval	PTemp value exceeds 30 C	ALERT	pressure_temp<30.0	
BETA	PREST3	pressure_value	Press value < 0.50*depth(deployment) or Press value > 1.50*depthdeployment	ALERT	0< absolute_pressure <100	
BETA	PREST4	pressure_sci_value	Press value < 0.99*depth(deployment) or Press value > 1.01*depthdeployment	WARNING	 45< absolute_pressure <55	
BETA	CTDBP1	salinity_min_max	Salinity reading is > 40 psu or < 20 psu	ALERT	25<salinity<40	
BETA	CTDBP2	temperature_min_max	Temperature reading is < 3 C or > 30C	ALERT	3<temperature<30	
BETA	CTDBP3	conductivity_min_max	Conductivity reading is not between 3 siemans/meter and 6 siemans/meter	ALERT	3<conductivity<30	
BETAX	CTDBP4	density_min_max	Pressure reading is > 5 meters from deployment depth or < 5 meters from deployment depth	ALERT	5<density<5	
NOSE	NOSE_ALARM	test_temp_warning	Temperature is below the normal range of 50.0 and above.	WARNING	50<temp<=100	
NOSE	NOSE_ALARM2	test_density_warning	Temperature is below the normal range of 50.0 and above.	WARNING	density<=10	
BETA	A_TEMP	temperature_warning_interval	Temperature is below the normal range of 50.0 and above.	WARNING	50<temp	stream_name: parsed, aggregate_type: 2, alert_class: IntervalAlert
BETA	A_LATE	late_data_warning	Expected data has not arrived.	WARNING		stream_name: parsed, aggregate_type: 1, time_delta: 2, alert_class: LateDataAlert
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY attachments (id, scenario, resource_id, file_path, name, description, attachment_type, content_type, content, keywords, parser) FROM stdin;
ATT1	R2_DEMO	ID3	att1.pdf	Testpdf	Test of PDF File	BLOB	application/pdf			
ATT2	R2_DEMO	ID3	att2.png	Testpng	Test of PNG file	BLOB	image/png		["IMAGE"]	
ATT3	R2_DEMO	ID4	att3.csv	Testcsv	Test of CSV file	ASCII	text/csv			
ATT4	R2_DEMO	EEInstrumentDevice	att1.pdf	Testpdf2	Test of a PDF File	BLOB	application/pdf			
ATT5	R2_DEMO	DPROD13	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT6	R2_DEMO	DPROD14	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT7	R2_DEMO	DPROD15	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT8	R2_DEMO	DPROD16	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT9	R2_DEMO	DPROD17	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT10	R2_DEMO	DPROD18	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT11	R2_DEMO	DPROD19	1341-00040_Data_Product_SPEC_PRACSAL_OOI.pdf	1341-00040_Data_Product_SPEC_PRACSAL_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT12	R2_DEMO	DPROD20	1341-00050_Data_Product_SPEC_DENSITY_OOI.pdf	1341-00050_Data_Product_SPEC_DENSITY_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT_TEST	NOSE	ID_TEST	att1.pdf	Testpdf	Test of PDF File	BLOB	application/pdf			
ATT13	ALPHA_SYS	DPROD43	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT14	ALPHA_SYS	DPROD44	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT15	ALPHA_SYS	DPROD45	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT16	ALPHA_SYS	DPROD46	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT17	ALPHA_SYS	DPROD47	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT18	ALPHA_SYS	DPROD48	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT19	ALPHA_SYS	DPROD49	1341-00040_Data_Product_SPEC_PRACSAL_OOI.pdf	1341-00040_Data_Product_SPEC_PRACSAL_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT20	ALPHA_SYS	DPROD50	1341-00050_Data_Product_SPEC_DENSITY_OOI.pdf	1341-00050_Data_Product_SPEC_DENSITY_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT21	BETA_SYS	DPROD53	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT22	BETA_SYS	DPROD54	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT23	BETA_SYS	DPROD55	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT24	BETA_SYS	DPROD56	1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf	1341-00030_Data_Product_SPEC_CONDWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT25	BETA_SYS	DPROD57	1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf	1341-00010_Data_Product_SPEC_TEMPWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT26	BETA_SYS	DPROD58	1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf	1341-00020_Data_Product_SPEC_PRESWAT_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT27	BETA_SYS	DPROD59	1341-00040_Data_Product_SPEC_PRACSAL_OOI.pdf	1341-00040_Data_Product_SPEC_PRACSAL_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT28	BETA_SYS	DPROD60	1341-00050_Data_Product_SPEC_DENSITY_OOI.pdf	1341-00050_Data_Product_SPEC_DENSITY_OOI	OOI Data Product Specification	BLOB	application/pdf			
ATT29	LC_TEST	DPROD85	lc_test_global_range.csv	lc_test_global_range	Global Range Test QC Reference LC_TEST	REFERENCE	text/csv			
\.


--
-- Data for Name: constraints; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY constraints (scenario, id, owner_id, confluence, type, south, north, west, east, top, bottom, vertical_direction, start_date, end_date) FROM stdin;
BETA	GEO1	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	32.8823700000000017	32.8823700000000017	-117.232140000000001	-117.232140000000001	100	140	depth		
BETA	GEO2	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	44.5	44.7000000000000028	-125.5	-125.299999999999997	0	3000	depth		
BETA	GEO3	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	47.6000000000000014	47.7000000000000028	-122.299999999999997	-122.200000000000003	0	5	depth		
R2_DEMO	GEO4	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	41.5	41.6000000000000014	-70.5999999999999943	-70.5	0	0	depth		
R2_DEMO	GEO5	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	44.4500000000000028	44.5499999999999972	-125.450000000000003	-125.349999999999994	2905	2907	depth		
BETA	TEMP1	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	temporal	\N	\N	\N	\N	\N	\N		2011-01-01T0:00:00	2054-01-01T0:00:00
BETA	GEO_UW	USER_1		geospatial	47.6000000000000014	47.7000000000000028	-122.299999999999997	-122.200000000000003	0	0	depth		
BETA	GEO_WHOI	USER_1		geospatial	41.5	41.6000000000000014	-70.5999999999999943	-70.5	0	0	depth		
IDK	GEO_IDK	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	geospatial	44.4500000000000028	44.5499999999999972	-125.450000000000003	-125.349999999999994	2905	2907	depth		
IDK	TEMP_IDK	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	temporal	\N	\N	\N	\N	\N	\N		2011-01-01T0:00:00	2054-01-01T0:00:00
BETA	GEO_WHOI2	USER_1		geospatial	41.5	41.6000000000000014	-70.5999999999999943	-70.5	0	0	depth		
FOO	GEO_WHOI3	USER_1		geospatial	41.5	41.6000000000000014	-70.5999999999999943	-70.5	0	0	depth		
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY contacts (scenario, id, confluence, individual_names_given, individual_name_family, organization_name, position_name, email, url, street_address, city, postal_code, administrative_area, country, phones, roles) FROM stdin;
R2_DEMO	J_DELANEY		John	Delaney	Univ. of Washington	Director	jd@domainname.com	http://ooi.washington.edu/rsn/jrd/poetry/spiral.html	Box 357940	Seattle	98195	WA	USA	office: 213-377-2929, home: 222-555-1212	primary
R2_DEMO	B_WELLER		Bob	Weller	Woods Hole Oceanographic Institution	Senior Scientist	bw@woodhole.org	http://www.whoi.edu/profile/rweller/	266 Woods Hole Rd MS#29	Woods Hole	02543	MA	USA	508-289-2509	primary
BETA	O_OWNERREP		Owen	Ownerrep	Univ. of Washington	Representative	owenownerrep@gmail.com	www.yahoo.com	123 Anytown Rd	Some Place	02392	CA	USA	office: 858-822-6379, home: 222-555-1212	alternate
R2_DEMO	J_ORCUTT		John	Orcutt	OOI Cyberinfrastructure	Principal Investigator	jorcutt@ucsd.edu	www.yahoo.com	123 Anytown Rd	Some Place	02392	CA	USA	office: 858-822-6379, home: 222-555-1212	alternate
BETA	M_MANAGER		Mike	Manager	UNoIt	Manager	mikemanagerooi@gmail.com	www.yahoo.com	123 Anytown Rd	Some Place	02392	CA	USA	619-555-1212	primary
BETA	T_AMPE		Tim	Ampe	UCSD	System Development Manager	tampe@ucsd.edu	www.oceanobservatories.org	Atkinson Hall	La Jolla	92037	CA	USA	858-822-5142	primary
BETA	B_OPERATOR		Beta Operator	User	OOI	Beta System Operator	BetaOperator1@gmail.com	www.oceanobservatories.org	Atkinson Hall	La Jolla	92037	CA	USA	858-555-5555	primary
NOSE	TEST_USER		Testathan	Userbrough	GGW	Illustrious Test Passagist	tester@somewhere.com	www.reddit.com	Box 357940	Shantytown	92037	CA	USA	858-555-5555	primary
IDK	IDK_USER1		Primary	Developer	IDK	Illustrious Test Passagist	tester@somewhere.com	www.reddit.com	Box 357940	Shantytown	92037	CA	USA	858-555-5555	primary
IDK	IDK_USER2		Secondary	Developer	IDK	Illustrious Test Passagist	tester@somewhere.com	www.reddit.com	Box 357940	Shantytown	92037	CA	USA	858-555-5555	alternate
BETA	A_PLUEDDEMANN		Al	Plueddemann	WHOI	scientist	aplueddemann@whoi.edu					MA	USA		primary
BETA	B_BERGEN		Bill	Bergen	Ocean Leadership	lacky	billbergen16@gmail.com					CO	USA		primary
BETA	B_PRITCHETT		Bill	Pritchett	Ocean Leadership	Sr. Project Manager	wpritchett@oceanleadership.org		1201 New York Ave, NW	Washington	20005	DC	USA	2027871611	primary
BETA	C_RISEN		Craig	Risien	Oregon State University	Senior Faculty Research Assistant	crisien@coas.oregonstate.edu		104 CEOAS Administration Building	Corvallis	97331	OR	USA	541-737-9682	primary
BETA	D_MANALANG		Dana	Manalang	University of Washington		danam@apl.washington.edu					WA	USA		primary
BETA	G_PROSKUROWSKI		GIORA	PROSKUROWSKI	University of Washington	RSN-OOI Project Scientist	giora@uw.edu		UW School of Oceanography Box 357940	Seattle	98195	WA	USA		primary
BETA	J_LUND		John	Lund	WHOI	Engineer II	jlund@whoi.edu					MA	USA	508.289.3636	primary
BETA	K_STIFFEL		Kurt	Stiffel	WHOI-OOI	Instrument Lead	Kurt_Stiffel@raytheon.com					MA	USA	508-289-3920	primary
BETA	L_MORGAN		Lynn	Morgan	OSU-OOI		lmorgan@coas.oregonstate.edu					OR	USA		primary
BETA	M_VARDARO		Michael	Vardaro	Oregon State University		mvardaro@coas.oregonstate.edu					OR	USA		primary
BETA	O_ KAWKA		Orest	Kawka	Regional Scale Nodes, OOI (University of Washington)	Project Scientist	kawkaoe@uw.edu		School of Oceanography, Box 357940	Seattle	98195	OR	USA	2062216411	primary
BETA	K_FELDMAN		Ken	Feldman	RSN		ksf1@uw.edu								primary
\.


--
-- Data for Name: coordinatesystems; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY coordinatesystems (scenario, id, owner_id, confluence, geospatial_geodetic_crs, geospatial_vertical_crs, geospatial_latitude_units, geospatial_longitude_units, geospatial_vertical_units, geospatial_vertical_positive) FROM stdin;
BETA	SUBMERGED	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	http://www.opengis.net/def/crs/EPSG/0/4326 	http://www.opengis.net/def/cs/EPSG/0/6498 	degrees_north 	degrees_east	meter 	down 
R2_DEMO	AERIAL	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	http://www.opengis.net/def/crs/EPSG/0/4269	http://www.opengis.net/def/cs/EPSG/0/6499	degrees_north	degrees_east	meter	up
IDK	SUBMERGED1	USER_1	https://confluence.oceanobservatories.org/display/CIDev/Preload+constraints	http://www.opengis.net/def/crs/EPSG/0/4326 	http://www.opengis.net/def/cs/EPSG/0/6498 	degrees_north 	degrees_east	meter 	down 
\.


--
-- Data for Name: dataprocessdefinitions; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY dataprocessdefinitions (scenario, id, owner_id, org_ids, input_stream_defs, output_stream_defs, name, description, module, class_name) FROM stdin;
BETA	DPD1	USER_1	MF_3	StreamDef12	{"conductivity":"StreamDef13","temperature":"StreamDef14","pressure":"StreamDef15"}	CTD_L0 demo	L0 - Conductivity/Temp/Pressure	ion.processes.data.transforms.ctd.ctd_L0_all	ctd_L0_all
BETA	DPD2	USER_1	MF_3	StreamDef13	{"conductivity":"StreamDef16"}	CONDWAT L1 demo	L1 - Conductivity	ion.processes.data.transforms.ctd.ctd_L1_conductivity	CTDL1ConductivityTransform
BETA	DPD3	USER_1	MF_3	StreamDef14	{"temperature":"StreamDef17"}	TEMPWAT L1 demo	L1 - Temperature	ion.processes.data.transforms.ctd.ctd_L1_temperature	CTDL1TemperatureTransform
BETA	DPD4	USER_1	MF_3	StreamDef15	{"pressure":"StreamDef18"}	PRESWAT L1 demo	L1 - Pressure (Depth)	ion.processes.data.transforms.ctd.ctd_L1_pressure	CTDL1PressureTransform
BETA	DPD5	USER_1	MF_3	StreamDef12	{"salinity":"StreamDef19"}	PRACSAL L2 demo	L2 - Practical Salinity	ion.processes.data.transforms.ctd.ctd_L2_salinity	SalinityTransform
BETA	DPD6	USER_1	MF_3	StreamDef12	{"density":"StreamDef20"}	DENSITY L2 demo	L2 - Density	ion.processes.data.transforms.ctd.ctd_L2_density	DensityTransform
PRESF	DPD21	USER_1	MF_3	StreamDef25	{"absolute_pressure":"StreamDef25"}	PRESF L0	PRESF L0 absolute_pressure from Tide Measurement	ion.processes.data.transforms.ctd.presf_L0_splitter	PresfL0Splitter
PRESF	DPD22	USER_1	MF_3	StreamDef25	{"seafloor_pressure":"StreamDef34"}	PRESF L1	PRESF L1 seafloor_pressure from Tide Measurement	ion.processes.data.transforms.ctd.presf_L1	PresfL1Transform
R2_DEMO	DPD15	USER_1	MF_3	StreamDef12	{"google_dt":"StreamDef21"}	GOOGLE_DT	Google datatable components	ion.processes.data.transforms.viz.google_dt	VizTransformGoogleDT
R2_DEMO	DPD16	USER_1	MF_3	StreamDef12	{"graph":"StreamDef22"}	MPL_IMAGES	Matplotlib graphs	ion.processes.data.transforms.viz.matplotlib_graphs	VizTransformMatplotlibGraphs
APE	DPD_LOG	USER_1	MF_3	StreamDef12	{}	Granule Logger	Logs receipt of granules	ape.component.logging_transform	LoggingTransform
PREST	DPD23	USER_1	MF_3	StreamDef49	{"absolute_pressure":"StreamDef49"}	PREST L0 	PREST L0 absolute_pressure	ion.processes.data.transforms.ctd.presf_L0_splitter	PresfL0Splitter
PREST	DPD24	USER_1	MF_3	StreamDef49	{"seafloor_pressure":"StreamDef89"}	PREST L1	PREST L1 seafloor_pressure	ion.processes.data.transforms.ctd.presf_L1	PresfL1Transform
CTDBP	DPD25	USER_1	MF_3	StreamDef35	{"L0_stream":"StreamDef94"}	CTDBP_L0	L0 - Conductivity/Temp/Pressure	ion.processes.data.transforms.ctdbp.ctdbp_L0	CTDBP_L0_all
CTDBP	DPD26	USER_1	MF_3	StreamDef94	{"L1_stream":"StreamDef95"}	CTDBP_L1	L1 - Conductivity/Temp/Pressure	ion.processes.data.transforms.ctdbp.ctdbp_L1	CTDBP_L1_Transform
CTDBP	DPD27	USER_1	MF_3	StreamDef95	{"salinity":"StreamDef96"}	PRACSAL L2 CTDBP	L2 - Practical Salinity from CTDBP Instrument	ion.processes.data.transforms.ctdbp.ctdbp_L2_salinity	CTDBP_SalinityTransform
CTDBP	DPD28	USER_1	MF_3	StreamDef95	{"density":"StreamDef97"}	DENSITY L2 CTDBP	L2 - Density from CTDBP Instrument	ion.processes.data.transforms.ctdbp.ctdbp_L2_density	CTDBP_DensityTransform
\.


--
-- Data for Name: dataprocesses; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY dataprocesses (scenario, id, owner_id, org_ids, data_process_definition_id, in_data_product_id, out_data_products, configuration, comment) FROM stdin;
R2_DEMO	DPROC1	USER_1	MF_3	DPD1	DPROD12	{"conductivity":"DPROD13","temperature":"DPROD14","pressure":"DPROD15"}		CTD_L0 demo
R2_DEMO	DPROC2	USER_1	MF_3	DPD2	DPROD13	{"conductivity":"DPROD16"}		CONDWAT demo
R2_DEMO	DPROC3	USER_1	MF_3	DPD3	DPROD14	{"temperature":"DPROD17"}		TEMPWAT demo
R2_DEMO	DPROC4	USER_1	MF_3	DPD4	DPROD15	{"pressure":"DPROD18"}		PRESWAT demo
R2_DEMO	DPROC5	USER_1	MF_3	DPD5	DPROD12	{"salinity":"DPROD19"}		PRACSAL demo
R2_DEMO	DPROC6	USER_1	MF_3	DPD6	DPROD12	{"density":"DPROD20"}		DENSITY demo
BETA	DPROC11	USER_1	MF_3	DPD1	DP_ID12	{"conductivity":"DPROD24","temperature":"DPROD25","pressure":"DPROD26"}		CTD_L0 demo SBE37
BETA	DPROC12	USER_1	MF_3	DPD2	DPROD24	{"conductivity":"DPROD27"}		CONDWAT demo SBE37
BETA	DPROC13	USER_1	MF_3	DPD3	DPROD25	{"temperature":"DPROD28"}		TEMPWAT demo SBE37
BETA	DPROC14	USER_1	MF_3	DPD4	DPROD26	{"pressure":"DPROD29"}		PRESWAT demo SBE37
BETA	DPROC15	USER_1	MF_3	DPD5	DP_ID12	{"salinity":"DPROD30"}		PRACSAL demo SBE37
BETA	DPROC16	USER_1	MF_3	DPD6	DP_ID12	{"density":"DPROD31"}		DENSITY demo SBE37
ALPHA_SYS	DPROC21	USER_1	MF_3	DPD1	DPROD42	{"conductivity":"DPROD43","temperature":"DPROD44","pressure":"DPROD45"}		CTD_L0 Alpha
ALPHA_SYS	DPROC22	USER_1	MF_3	DPD2	DPROD43	{"conductivity":"DPROD46"}		CONDWAT Alpha
ALPHA_SYS	DPROC23	USER_1	MF_3	DPD3	DPROD44	{"temperature":"DPROD47"}		TEMPWAT Alpha
ALPHA_SYS	DPROC24	USER_1	MF_3	DPD4	DPROD45	{"pressure":"DPROD48"}		PRESWAT Alpha
ALPHA_SYS	DPROC25	USER_1	MF_3	DPD5	DPROD42	{"salinity":"DPROD49"}		PRACSAL Alpha
ALPHA_SYS	DPROC26	USER_1	MF_3	DPD6	DPROD42	{"density":"DPROD50"}		DENSITY Alpha
PRESF	DPROC27	USER_1	MF_3	DPD21	DP_ID6	{"absolute_pressure":"DP_ID13"}		PRESF absolute pressure
PRESF	DPROC28	USER_1	MF_3	DPD22	DP_ID13	{"seafloor_pressure":"DP_ID14"}		PRESF seafloor pressure
BETA_SYS	DPROC31	USER_1	MF_3	DPD1	DPROD52	{"conductivity":"DPROD53","temperature":"DPROD54","pressure":"DPROD55"}		CTD_L0 Beta
BETA_SYS	DPROC32	USER_1	MF_3	DPD2	DPROD53	{"conductivity":"DPROD56"}		CONDWAT Beta
BETA_SYS	DPROC33	USER_1	MF_3	DPD3	DPROD54	{"temperature":"DPROD57"}		TEMPWAT Beta
BETA_SYS	DPROC34	USER_1	MF_3	DPD4	DPROD55	{"pressure":"DPROD58"}		PRESWAT Beta
BETA_SYS	DPROC35	USER_1	MF_3	DPD5	DPROD52	{"salinity":"DPROD59"}		PRACSAL Beta
BETA_SYS	DPROC36	USER_1	MF_3	DPD6	DPROD52	{"density":"DPROD60"}		DENSITY Beta
PREST	DPROC37	USER_1	MF_3	DPD23	DPROD67	{"absolute_pressure":"DPROD73"}		PREST absolute pressure
PREST	DPROC38	USER_1	MF_3	DPD24	DPROD73	{"seafloor_pressure":"DPROD74"}		PREST seafloor pressure
CTDBP	DPROC39	USER_1	MF_3	DPD25	DP_ID7	{"L0_stream":"DPROD77"}		CTDBP L0s
CTDBP	DPROC40	USER_1	MF_3	DPD26	DPROD77	{"L1_stream":"DPROD78"}	{"process": {"calibration_coeffs": {"temp_calibration_coeffs": { "TA0": 1.301118e-03, "TA1": 2.561486e-04, "TA2": 1.896537e-07, "TA3": 1.301189e-07, "TOFFSET": 0.000000e+00 }, "cond_calibration_coeffs":  { "G": -9.896568e-01, "H": 1.316599e-01,  "I": -2.213854e-04,  "J": 3.292199e-05, "CPCOR": -9.570000e-08,  "CTCOR": 3.250000e-06,  "CSLOPE": 1.000000e+00  },  "pres_calibration_coeffs": {  "PA0": 4.960417e-02,  "PA1": 4.883681e-04, "PA2": -5.687309e-12,  "PTCA0": 5.249802e+05,  "PTCA1": 7.595719e+00,  "PTCA2": -1.322776e-01,  "PTCB0": 2.503125e+01,  "PTCB1": 5.000000e-05,  "PTCB2": 0.000000e+00, "PTEMPA0": -6.431504e+01,  "PTEMPA1": 5.168177e+01,  "PTEMPA2": -2.847757e-01, "POFFSET": 0.000000e+00}}}}	CTDBP L1s
CTDBP	DPROC41	USER_1	MF_3	DPD27	DPROD78	{"salinity":"DPROD79"}		PRACSAL for CTDBP
CTDBP	DPROC42	USER_1	MF_3	DPD28	DPROD78	{"density":"DPROD80"}	{"process":{"lat" : 41.5, "lon" : -70.6}}	DENSITY for CTDBP
\.


--
-- Data for Name: dataproductlinks; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY dataproductlinks (scenario, id, data_product_id, input_resource_id, source_resource_id, resource_type, comment) FROM stdin;
R2_DEMO	LINK1	DPROD11	ID3	ID3	InstrumentDevice	CTD Sim 1 Raw
R2_DEMO	LINK2	DPROD12	ID3	ID3	InstrumentDevice	CTD Sim 1 Parsed
R2_DEMO	LINK3	DPROD13		ID3	InstrumentDevice	
R2_DEMO	LINK4	DPROD14		ID3	InstrumentDevice	
R2_DEMO	LINK5	DPROD15		ID3	InstrumentDevice	
R2_DEMO	LINK6	DPROD16		ID3	InstrumentDevice	
R2_DEMO	LINK7	DPROD17		ID3	InstrumentDevice	
R2_DEMO	LINK8	DPROD18		ID3	InstrumentDevice	
R2_DEMO	LINK9	DPROD19		ID3	InstrumentDevice	
R2_DEMO	LINK10	DPROD20		ID3	InstrumentDevice	
R2_DEMO	LINK11	DPROD21	ID4	ID4	InstrumentDevice	CTD Sim 2 Raw
R2_DEMO	LINK12	DPROD22	ID4	ID4	InstrumentDevice	CTD Sim 2 Parsed
R2_DEMO	LINK13	DPROD13		ID4	InstrumentDevice	
R2_DEMO	LINK14	DPROD14		ID4	InstrumentDevice	
R2_DEMO	LINK15	DPROD15		ID4	InstrumentDevice	
R2_DEMO	LINK16	DPROD16		ID4	InstrumentDevice	
R2_DEMO	LINK17	DPROD17		ID4	InstrumentDevice	
R2_DEMO	LINK18	DPROD18		ID4	InstrumentDevice	
R2_DEMO	LINK19	DPROD19		ID4	InstrumentDevice	
R2_DEMO	LINK20	DPROD20		ID4	InstrumentDevice	
R2_DEMO	LINK21	EEDP1	EEInstrumentDevice	EEInstrumentDevice	InstrumentDevice	CTD EER2 Parsed
R2_DEMO	LINK22	EEDP2	EEInstrumentDevice	EEInstrumentDevice	InstrumentDevice	CTD EER2 Raw
R2_DEMO	LINK23	EEDP3	EEInstrumentSite		InstrumentSite	CTD EER2 Parsed
disable	LINK24	EEDP4	EEInstrumentSite		InstrumentSite	CTD EER2 Raw
DEVS	LINK25	DP_ID5	ID5	ID5	InstrumentDevice	PARAD Parsed
DEVS	LINK26	DP_ID5_RAW	ID5	ID5	InstrumentDevice	PARAD Raw
BETA	LINK27	DP_PD3	PDEV3	PDEV3	PlatformDevice	not loading
DEVS	LINK28	DP_ID8	ID8	ID8	InstrumentDevice	TRHPH Parsed
DEVS	LINK29	DP_ID10	ID10	ID10	InstrumentDevice	VELPT Parsed
DEVS	LINK30	DP_ID11	ID11	ID11	InstrumentDevice	NUTNR Parsed
DEVS	LINK31	DP_ID8_RAW	ID8	ID8	InstrumentDevice	TRHPH Raw
DEVS	LINK32	DP_ID10_RAW	ID10	ID10	InstrumentDevice	VELPT Raw
DEVS	LINK33	DP_ID11_RAW	ID11	ID11	InstrumentDevice	NUTNR Raw
BETA	LINK34	DP_ID12_RAW	ID12	ID12	InstrumentDevice	SBE37SMP Raw
BETA	LINK35	DP_ID12	ID12	ID12	InstrumentDevice	SBE37SMP Parsed
ALPHA_SYS	LINK36	DPROD41	ID13	ID13	InstrumentDevice	CTD Sim Alpha Raw
ALPHA_SYS	LINK37	DPROD42	ID13	ID13	InstrumentDevice	CTD Sim Alpha Parsed
BETA_SYS	LINK38	DPROD51	ID14	ID14	InstrumentDevice	CTD Sim Beta Raw
BETA_SYS	LINK39	DPROD52	ID14	ID14	InstrumentDevice	CTD Sim Beta Parsed
IDK	LINK40	DPROD_IDK_RAW	IDK_DEVICE	IDK_DEVICE	InstrumentDevice	
IDK	LINK41	DPROD_IDK_PARSED	IDK_DEVICE	IDK_DEVICE	InstrumentDevice	
PRESF	LINK42	DP_ID6_RAW	ID6	ID6	InstrumentDevice	PRESF Raw
PRESF	LINK43	DP_ID6	ID6	ID6	InstrumentDevice	PRESF Parsed Tide Measurements
PRESF	LINK44	DPROD61	ID6	ID6	InstrumentDevice	PRESF Operating Status
PRESF	LINK45	DPROD62	ID6	ID6	InstrumentDevice	PRESF Calibration Coefficients
PRESF	LINK46	DPROD64	ID6	ID6	InstrumentDevice	PRESF Parsed Wave Burst
PRESF	LINK47	DPROD66	ID6	ID6	InstrumentDevice	PRESF Parsed Wave Statistics
PREST	LINK48	DP_ID9_RAW	ID9	ID9	InstrumentDevice	PREST Raw
PREST	LINK49	DPROD67	ID9	ID9	InstrumentDevice	PREST Real Time Data
PREST	LINK50	DPROD68	ID9	ID9	InstrumentDevice	PREST Reference Oscillator
PREST	LINK51	DPROD69	ID9	ID9	InstrumentDevice	PREST Configuration Data
PREST	LINK52	DPROD70	ID9	ID9	InstrumentDevice	PREST Device Status
PREST	LINK53	DPROD71	ID9	ID9	InstrumentDevice	PREST Event Counter
PREST	LINK54	DPROD72	ID9	ID9	InstrumentDevice	PREST Hardware Data
CTDBP	LINK55	DP_ID7	ID7	ID7	InstrumentDevice	CTDBP sb16+v2 Parsed
CTDBP	LINK56	DP_ID7_RAW	ID7	ID7	InstrumentDevice	CTDBP sb16+v2 Raw
CTDBP	LINK57	DPROD75	ID7	ID7	InstrumentDevice	CTDBP Status
CTDBP	LINK58	DPROD76	ID7	ID7	InstrumentDevice	CTDBP Calibration Coefficients
TMPSF	LINK59	DPROD81	ID15	ID15	InstrumentDevice	TMPSF sample data
TMPSF	LINK60	DPROD82	ID15	ID15	InstrumentDevice	TMPSF engineering data
TMPSF	LINK61	DPROD81_RAW	ID15	ID15	InstrumentDevice	TMPSF raw
VEL3D_B	LINK62	DPROD83	ID16	ID16	InstrumentDevice	vel3d sample data
VEL3D_B	LINK63	DPROD84	ID16	ID16	InstrumentDevice	vel3d engineering data
VEL3D_B	LINK64	DPROD83_RAW	ID16	ID16	InstrumentDevice	vel3d raw
LC_TEST	LINK65	DPROD85	ID17	ID17	InstrumentDevice	LC Test Simulator Data
NOSE	LINK66	DP_TEST_EXT	ED_NOSE	ID_TEST	ExternalDataset	link data product to external dataset
\.


--
-- Data for Name: dataproducts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY dataproducts (scenario, id, owner_id, lcstate, org_ids, stream_def_id, persist_metadata, persist_data, geo_constraint_id, coordinate_system_id, contact_ids, name, description, processing_level, ooi_short_name, ooi_product_name) FROM stdin;
R2_DEMO	DPROD11	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Raw	Raw stream from SBE37 simulator on Beta Demonstration Platform	Raw		Raw
R2_DEMO	DPROD12	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Parsed	Parsed Stream from SBE37 simulator on Beta Demonstration Platform	Parsed_Canonical		Parsed
R2_DEMO	DPROD13	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef13	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator CONDWAT L0	OOI Core L0 Conductivity Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L0	CONDWAT	Conductivity
R2_DEMO	DPROD14	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef14	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator TEMPWAT L0	OOI Core L0 Temperature Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L0	TEMPWAT	Temperature
R2_DEMO	DPROD15	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef15	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator PRESWAT L0	OOI Core L0 Pressure Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L0	PRESWAT	Pressure
R2_DEMO	DPROD16	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef16	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator CONDWAT L1	OOI Core L1 Conductivity Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L1	CONDWAT	Conductivity
R2_DEMO	DPROD17	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef17	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator TEMPWAT L1	OOI Core L1 Temperature Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L1	TEMPWAT	Temperature
R2_DEMO	DPROD18	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef18	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator PRESWAT L1	OOI Core L1 Pressure Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L1	PRESWAT	Pressure
R2_DEMO	DPROD19	USER_1	DEPLOYED_PRIVATE	MF_3	StreamDef19	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator PRACSAL L2	OOI Core L2 Calculated Practical Salinity from the SBE37SMP Simulator on Beta Demonstration Platform	L2	PRACSAL	Salinity
R2_DEMO	DPROD20	USER_1	INTEGRATED_DISCOVERABLE	MF_3	StreamDef20	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator DENSITY L2	OOI Core L2 Calculated Density from the SBE37SMP Simulator on Beta Demonstration Platform	L2	DENSITY	Density
R2_DEMO	DPROD21	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	CTD-1012-REC1 Raw Replacement	Raw stream from SBE37 simulator Replacement	Raw		
R2_DEMO	DPROD22	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	t	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	CTD-1012-REC1 Parsed Replacement	Parsed Stream from SBE37 simulator Replacement	Parsed_Canonical		
R2_DEMO	EEDP1	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	t	GEO2	SUBMERGED	J_ORCUTT,T_AMPE	CTD Parsed EER2	Parsed Stream from SBE37 simulator Replacement	Parsed_Canonical		
R2_DEMO	EEDP2	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO2	SUBMERGED	J_ORCUTT,T_AMPE	CTD Raw EER2	Raw Stream from SBE37 simulator Replacement	Raw		
R2_DEMO	EEDP3	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	f	GEO2	SUBMERGED	J_ORCUTT,T_AMPE	CTD subsite DP EER2	Parsed Stream from SBE37 simulator Replacement	Parsed_Canonical		
disable	EEDP4	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO2	SUBMERGED	J_ORCUTT,T_AMPE	CTD Raw subsite EER2	Raw Stream from SBE37 simulator Replacement	Raw		
R2_DEMO	DPROD23	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef22	t	t	GEO2	SUBMERGED	J_ORCUTT,T_AMPE	Matplotlib graphs	These graphs are generated on a scheduled timer event	Matplotlib_graph		
BETA	DP_PD3	USER_1	DEPLOYED_AVAILABLE	MF_3	SD_PLATFORM1	t	t	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	Platform Engineering Data	RSN Platform Engineering Data from Beta Demonstration Platform	Parsed_Canonical		
DEVS	DP_ID5	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef24	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PARAD parsed from device ID5	Stream from PARAD instrument at UW	Parsed_Canonical		
PRESF	DP_ID6_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF raw from device ID6	Raw PRESF Stream from seabird26plus instrument at Woods Hole	Raw		
PRESF	DP_ID6	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef25	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF Parsed Tide Measurements from device ID6	PRESF Stream from seabird26plus instrument at Woods Hole	Parsed_Canonical		
PRESF	DP_ID13	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef25	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF L0 absolute_pressure from Tide Measurements	PRESF L0 absolute_pressure from seabird26plus instrument at Woods Hole	L0		
PRESF	DP_ID14	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef34	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF L1 seafloor_pressure from Tide Measurements	PRESF  L1 seafloor_pressure from seabird26plus instrument at Woods Hole	L1		
DEVS	DP_ID5_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PARAD raw from device ID5	Raw Stream from PARAD instrument at UW	Raw		
DEVS	DP_ID8	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef26	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	TRHPH parsed from device ID8	Stream from TRHPH instrument at UW	Parsed_Canonical		
DEVS	DP_ID10	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef28	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	VELPT parsed from device ID10	Stream from VELPT instrument at UW	Parsed_Canonical		
DEVS	DP_ID11	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef29	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	NUTNR parsed from device ID11	Stream from NUTNR instrument at UCSD	Parsed_Canonical		
DEVS	DP_ID8_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	TRHPH raw from device ID6	Raw Stream from TRHPH instrument at UW	Raw		
PREST	DP_ID9_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST raw from device ID9	Raw Stream from PREST instrument at UW	Raw		
absolute_pressure	DP_ID10_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	VELPT raw from device ID8	Raw Stream from VELPT instrument at UW	Raw		
DEVS	DP_ID11_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	NUTNR raw from device ID9	Raw Stream from NUTNR instrument at UCSD	Raw		
BETA	DP_ID12_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef30	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Raw	Raw stream from SBE37SMP instrument at UCSD on Beta Demonstration Platform	Raw		
BETA	DP_ID12	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef31	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Parsed	Parsed Stream from SBE37SMP instrument at UCSD on Beta Demonstration Platform	Parsed_Canonical		
NOSE	DP_TEST_L0	USER_1	DEPLOYED_AVAILABLE	MF_TEST	StreamDef11	t	t	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	Test DP L0 CTD	Raw stream from SBE37 simulator on Beta Demonstration Platform	Raw		
NOSE	DT_TEST_L1	USER_1	DEPLOYED_AVAILABLE	MF_TEST	StreamDef16	t	f	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	Test DP L1 conductivity	OOI Core L1 Conductivity Data Product from the SBE37SMP Simulator on Beta Demonstration Platform	L1		
NOSE	DP_TEST_EXT	USER_1	DEPLOYED_AVAILABLE	MF_TEST	StreamDef106	t	t	GEO1	SUBMERGED	M_MANAGER,O_OWNERREP	Test DP for External Dataset	Test DP for External Dataset	L1		
BETA	DPROD24	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef13	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP CONDWAT L0	OOI Core L0 Conductivity Data Product from the SBE37SMP on Beta Demonstration Platform	L0		
BETA	DPROD25	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef14	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP TEMPWAT L0	OOI Core L0 Temperature Data Product from the SBE37SMP on Beta Demonstration Platform	L0		
BETA	DPROD26	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef15	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP PRESWAT L0	OOI Core L0 Pressure Data Product from the SBE37SMP on Beta Demonstration Platform	L0		
BETA	DPROD27	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef16	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP CONDWAT L1	OOI Core L1 Conductivity Data Product from the SBE37SMP on Beta Demonstration Platform	L1		
BETA	DPROD28	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef17	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP TEMPWAT L1	OOI Core L1 Temperature Data Product from the SBE37SMP on Beta Demonstration Platform	L1		
BETA	DPROD29	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef18	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP PRESWAT L1	OOI Core L1 Pressure Data Product from the SBE37SMP on Beta Demonstration Platform	L1		
BETA	DPROD30	USER_1	DEPLOYED_PRIVATE	MF_3	StreamDef19	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP PRACSAL L2	OOI Core L2 Calculated Practical Salinity from the SBE37SMP on Beta Demonstration Platform	L2		
BETA	DPROD31	USER_1	INTEGRATED_DISCOVERABLE	MF_3	StreamDef20	t	t	GEO3	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP DENSITY L2	OOI Core L2 Calculated Density from the SBE37SMP on Beta Demonstration Platform	L2		
ALPHA_SYS	DPROD41	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha Raw	Raw stream from SBE37 simulator on Alpha System	Raw		
ALPHA_SYS	DPROD42	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha Parsed	Parsed Stream from SBE37 simulator on Alpha System	Parsed_Canonical		
ALPHA_SYS	DPROD43	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef13	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha CONDWAT L0	OOI Core L0 Conductivity Data Product from the SBE37SMP Simulator on Alpha System	L0		
ALPHA_SYS	DPROD44	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef14	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha TEMPWAT L0	OOI Core L0 Temperature Data Product from the SBE37SMP Simulator on Alpha System	L0		
ALPHA_SYS	DPROD45	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef15	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha PRESWAT L0	OOI Core L0 Pressure Data Product from the SBE37SMP Simulator on Alpha System	L0		
ALPHA_SYS	DPROD46	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef16	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha CONDWAT L1	OOI Core L1 Conductivity Data Product from the SBE37SMP Simulator on Alpha System	L1		
ALPHA_SYS	DPROD47	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef17	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha TEMPWAT L1	OOI Core L1 Temperature Data Product from the SBE37SMP Simulator on Alpha System	L1		
ALPHA_SYS	DPROD48	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef18	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha PRESWAT L1	OOI Core L1 Pressure Data Product from the SBE37SMP Simulator on Alpha System	L1		
ALPHA_SYS	DPROD49	USER_1	DEPLOYED_PRIVATE	MF_3	StreamDef19	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha PRACSAL L2	OOI Core L2 Calculated Practical Salinity from the SBE37SMP Simulator on Alpha System	L2		
ALPHA_SYS	DPROD50	USER_1	INTEGRATED_DISCOVERABLE	MF_3	StreamDef20	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Alpha DENSITY L2	OOI Core L2 Calculated Density from the SBE37SMP Simulator on Alpha System	L2		
BETA_SYS	DPROD51	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef11	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta Raw	Raw stream from SBE37 simulator on Beta System	Raw		
BETA_SYS	DPROD52	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef12	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta Parsed	Parsed Stream from SBE37 simulator on Beta System	Parsed_Canonical		
BETA_SYS	DPROD53	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef13	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta CONDWAT L0	OOI Core L0 Conductivity Data Product from the SBE37SMP Simulator on Beta System	L0		
BETA_SYS	DPROD54	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef14	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta TEMPWAT L0	OOI Core L0 Temperature Data Product from the SBE37SMP Simulator on Beta System	L0		
BETA_SYS	DPROD55	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef15	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta PRESWAT L0	OOI Core L0 Pressure Data Product from the SBE37SMP Simulator on Beta System	L0		
BETA_SYS	DPROD56	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef16	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta CONDWAT L1	OOI Core L1 Conductivity Data Product from the SBE37SMP Simulator on Beta System	L1		
BETA_SYS	DPROD57	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef17	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta TEMPWAT L1	OOI Core L1 Temperature Data Product from the SBE37SMP Simulator on Beta System	L1		
BETA_SYS	DPROD58	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef18	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta PRESWAT L1	OOI Core L1 Pressure Data Product from the SBE37SMP Simulator on Beta System	L1		
BETA_SYS	DPROD59	USER_1	DEPLOYED_PRIVATE	MF_3	StreamDef19	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta PRACSAL L2	OOI Core L2 Calculated Practical Salinity from the SBE37SMP Simulator on Beta System	L2		
BETA_SYS	DPROD60	USER_1	INTEGRATED_DISCOVERABLE	MF_3	StreamDef20	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	SBE37SMP Simulator Beta DENSITY L2	OOI Core L2 Calculated Density from the SBE37SMP Simulator on Beta System	L2		
IDK	DPROD_IDK_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	SD_IDK_RAW	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	IDK Device Output Raw	Raw stream from driver under development	Raw		
IDK	DPROD_IDK_PARSED	USER_1	DEPLOYED_AVAILABLE	MF_3	UNKNOWN	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	IDK Device Output Parsed	Parsed Stream from driver under development	Parsed_Canonical		
PRESF	DPROD61	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef32	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF Operating Status	PRESF Operating Status from seabird26plus instrument at Woods Hole	Parsed_Canonical		
PRESF	DPROD62	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef33	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF Calibration Coefficients	PRESF Calibration Coefficients from seabird26plus instrument at Woods Hole	Parsed_Canonical		
PRESF	DPROD64	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef87	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF Parsed Wave Burst Measurements from device ID6	PRESF Stream from seabird26plus instrument at Woods Hole	Parsed_Canonical		
PRESF	DPROD66	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef88	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	PRESF Parsed Wave Burst Computed Statistics	PRESF  computed wave statistics from seabird26plus instrument at Woods Hole	Parsed_Canonical		
PREST	DPROD67	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef49	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Real Time Data	PREST Real Time data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD68	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef50	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Reference Oscillator	PREST Reference Oscillator data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD69	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef51	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Configuration Data	PREST Configuration data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD70	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef52	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Device Status	PREST Device Status data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD71	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef53	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Event Counter	PREST Event Counter data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD72	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef54	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST Hardware Data	PREST Hardware Data from SBE 54 Tsunami Pressure Sensor instrument at RSN	Parsed_Canonical		
PREST	DPROD73	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef49	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST L0 absolute_pressure from Real Time Data	PREST L0 (absolute_pressure) from SBE 54 Tsunami Pressure Sensor instrument at RSN	L0		
PREST	DPROD74	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef89	t	t	GEO_UW	SUBMERGED	M_MANAGER,O_OWNERREP	PREST L1 Seafloor Pressure	SFLPRES_L1 (Seafloor Pressure)  from SBE 54 Tsunami Pressure Sensor instrument at RSN\n	L1		
CTDBP	DP_ID7	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef35	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP parsed sample from device ID7	CTD Stream from seabird16plusV2 instrument at Woods Hole	Parsed_Canonical		
CTDBP	DP_ID7_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP raw from device ID7	Raw CTD Stream from seabird16plusV2 instrument at Woods Hole	Raw		
CTDBP	DPROD75	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef36	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP status from device ID7	CTD Status from seabird16plusV2 instrument at Woods Hole	Parsed_Canonical		
CTDBP	DPROD76	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef37	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP calibration coefficients from device ID7	CTD Calibration Coefficients from seabird16plusV2 instrument at Woods Hole	Parsed_Canonical		
CTDBP	DPROD77	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef94	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP cdef L0 (CONDWAT, TEMPWAT, PRESWAT)	OOI Core L0 Data Product from the CTDBP for CONDWAT, TEMPWAT, & PRESWAT	L0		
CTDBP	DPROD78	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef95	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP cdef L1 (CONDWAT, TEMPWAT, PRESWAT)	OOI Core L1 Conductivity Data Product from the CTDBP for CONDWAT, TEMPWAT, & PRESWAT	L1		
CTDBP	DPROD79	USER_1	DEPLOYED_PRIVATE	MF_3	StreamDef96	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP cdef L2 PRACSAL	OOI Core L2 Calculated Practical Salinity from the CTDBP on Beta Demonstration Platform	L2		
CTDBP	DPROD80	USER_1	INTEGRATED_DISCOVERABLE	MF_3	StreamDef97	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	CTDBP cdef L2 DENSITY	OOI Core L2 Calculated Density from the CTDBP on Beta Demonstration Platform	L2		
TMPSF	DPROD81	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef103	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	TMPSF sample from ID15	TMPSF sample data from device	Parsed_Canonical		
TMPSF	DPROD82	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef104	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	TMPSF eng from ID15	TMPSF engineering data from device	Parsed_Canonical		
TMPSF	DPROD81_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	TMPSF raw from device ID15	Raw TMPSF Stream from device	Raw		
VEL3D_B	DPROD83	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef47	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	vel3d sample from ID16	VEL3D sample data from device	Parsed_Canonical		
VEL3D_B	DPROD84	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef48	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	vel3d eng from ID16	VEL3D engineering data from device	Parsed_Canonical		
VEL3D_B	DPROD83_RAW	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef23	t	t	GEO_WHOI2	SUBMERGED	M_MANAGER,O_OWNERREP	vel3d raw from device ID16	Raw VEL3D Stream from device	Raw		
LC_TEST	DPROD85	USER_1	DEPLOYED_AVAILABLE	MF_3	StreamDef105	t	t	GEO2	SUBMERGED	M_MANAGER,O_OWNERREP	LC TEST CTD Parsed	Parsed Data Product	Parsed_Canonical		
\.


--
-- Data for Name: deployments; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY deployments (scenario, confluence, id, owner_id, org_ids, site_id, device_id, activate, name, description, constraint_ids, coordinate_system, context_type) FROM stdin;
R2_DEMO		DEP1	USER_1	MF_3	LOGINS3	ID3	t	dep1	deployment of first device			CabledNodeDeploymentContext
BETA		DEP2	USER_1	MF_3	LOGINS4	ID12	t	dep2	Demo Deployment of SBE37SMP Instrument			CabledNodeDeploymentContext
BETA		DEP3	USER_1	MF_3	LP3	PDEV3	t	dep3	deployment of platform device 1			CabledNodeDeploymentContext
R2_DEMO		DEP4	USER_1	MF_3	LP4	PDEV4	f	dep4	deployment of platform device 2			CabledNodeDeploymentContext
R2_DEMO	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	Deploy1	USER_1	MF_3	D1PlatformSite1	D1PlatformDevice1	f	deploy1	test deployment 1			CabledNodeDeploymentContext
R2_DEMO	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	Deploy2	USER_1	MF_3	D2InstrumentSite1	D2InstrumentDevice3	f	deploy2	test deployment 2			CabledNodeDeploymentContext
R2_DEMO	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	Deploy3	USER_1	MF_3	D3InstrumentSite1	D3InstrumentDevice4	f	deploy3	test deployment 3			CabledNodeDeploymentContext
R2_DEMO		EEDeploy1	USER_1	MF_3	EEInstrumentSite	EEInstrumentDevice	t	ee_deployment	test deployment for EE test R2			CabledNodeDeploymentContext
R2_DEMO		DEP5	USER_1	MF_3	LOGINS5	ID4	t	dep5	deployment of second device			CabledNodeDeploymentContext
ALPHA_SYS		DEP6	USER_1	MF_3	LOGINS6	ID13	t	dep6	deployment of simulator on Alpha System			CabledNodeDeploymentContext
BETA_SYS		DEP7	USER_1	MF_3	LOGINS7	ID14	t	dep7	deployment of simulator on Beta System			CabledNodeDeploymentContext
IDK		IDK_DEP	IDK_USER	IDK_ORG	IDK_SITE	IDK_DEVICE	t	idk deployment	Deployment for IDK			CabledNodeDeploymentContext
PRESF		DEP8	USER_1	MF_3	LOGINS8	ID6	t	dep8	Demo Deployment of PRESF Instrument			CabledNodeDeploymentContext
PREST		DEP9	USER_1	MF_3	LOGINS9	ID9	t	dep9	Demo Deployment of PREST Instrument			CabledNodeDeploymentContext
CTDBP		DEP10	USER_1	MF_3	LOGINS10	ID7	t	dep10	Demo Deployment of CTDBP Instrument			CabledNodeDeploymentContext
TMPSF		DEP11	USER_1	MF_3	LOGINS11	ID15	t	dep11	Demo deployment of TMPSF			CabledNodeDeploymentContext
VEL3D_B		DEP12	USER_1	MF_3	LOGINS12	ID16	t	dep12	Demo deployment of VEL3D_B			CabledNodeDeploymentContext
\.


--
-- Data for Name: externaldataproviders; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY externaldataproviders (scenario, id, owner_id, lcstate, org_ids, contact_id, name, description) FROM stdin;
NOSE	EDP_NOSE					Test Data Provider	
\.


--
-- Data for Name: externaldatasetagentinstances; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY externaldatasetagentinstances (scenario, confluence, id, owner_id, org_ids, name, description, agent, dataset, streamdef, agent_config, driver_config, handler_module, handler_class, parser_module, parser_class) FROM stdin;
NOSE		EDAI_NOSE_CTD			Test External CTD Agent Instance		EDA_NOSE_CTD	ED_NOSE_CTD	StreamDef106	key1: value1	key2: value2, key3: value3	ion.agents.data.handlers.hypm_data_handler	HYPMDataHandler	ion.agents.data.handlers.hypm_data_handler	HYPM_01_WFP_CTDParser
NOSE		EDAI_NOSE_ACM			Test External ACM Dataset Agent Instance		EDA_NOSE_ACM	ED_NOSE_ACM	StreamDef106	key1: value1	key2: value2, key3: value3	ion.agents.data.handlers.hypm_data_handler	HYPMDataHandler	ion.agents.data.handlers.hypm_data_handler	HYPM_01_WFP_ACMParser
\.


--
-- Data for Name: externaldatasetagents; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY externaldatasetagents (scenario, id, owner_id, lcstate, org_ids, dataset_id, name, description, agent_version, handler_module, handler_class, dataset_model) FROM stdin;
NOSE	EDA_NOSE_CTD				ED_NOSE_CTD	Test CTD Dataset Agent			ion.agents.data.external_dataset_agent	ExternalDatasetAgent	EDM_NOSE_CTD
NOSE	EDA_NOSE_ACM				ED_NOSE_ACM	Test ACM Dataset Agent			ion.agents.data.external_dataset_agent	ExternalDatasetAgent	EDM_NOSE_ACM
\.


--
-- Data for Name: externaldatasetmodels; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY externaldatasetmodels (scenario, id, owner_id, lcstate, org_ids, name, description, dataset_type) FROM stdin;
NOSE	EDM_NOSE_CTD				Test External CTD Dataset Model		nose_ctd_stream
NOSE	EDM_NOSE_ACM				Test External ACM Dataset Model		nose_acm_stream
\.


--
-- Data for Name: externaldatasets; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY externaldatasets (scenario, id, owner_id, lcstate, org_ids, contact_id, name, description, data_sampling, parameters, model) FROM stdin;
NOSE	ED_NOSE_CTD					Test External CTD Dataset		NONE	base_url: test_data, list_pattern: C*.HEX	EDM_NOSE_CTD
NOSE	ED_NOSE_ACM					Test External ACM Dataset		NONE	base_url: test_data, list_pattern: C*.HEX	EDM_NOSE_ACM
\.


--
-- Data for Name: grts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY grts (instrument_array, instrument_class, reference_designator, data_products, units, flagged, grt_min, grt_max) FROM stdin;
CE	DOSTA	CE01ISSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PHWATER	unitless		7.29999999999999982	8.5
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTTEMP			\N	\N
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	ADCPT	CE01ISSM-MF004-05-ADCPTM999	ECHOINT			\N	\N
CE	ADCPT	CE01ISSM-MF004-05-ADCPTM999	VELPROF	m/s		0	10
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ZPLSC	CE01ISSM-MF005-02-ZPLSCC999	SONBSCA	dB		0	\N
CE	VEL3D	CE01ISSM-MF005-03-VEL3DD999	VELPTTU	m/s		0	10
CE	PRESF	CE01ISSM-MF005-04-PRESFA999	SFLPRES	Pa		0	58842000
CE	CAMDS	CE01ISSM-MF005-05-CAMDSA999	CAMSTIL	NA		\N	\N
CE	DOSTA	CE01ISSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE01ISSM-RI002-02-VELPTA999	VELPTMN	m/s		0	10
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE01ISSM-RI003-04-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE01ISSM-RI003-05-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE01ISSM-RI003-05-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	VELPT	CE01ISSM-SB001-01-VELPTA999	VELPTMN	m/s		0	10
CE	DOFST	CE01ISSP-SP001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	PCO2WAT	uM/ppm		100	600
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTTEMP			\N	\N
CE	VEL3D	CE01ISSP-SP001-05-VEL3D0999	VELPTTU	m/s		0	10
CE	NUTNR	CE01ISSP-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
CE	SPKIR	CE01ISSP-SP001-07-SPKIR0999	OPTATTS			\N	\N
CE	SPKIR	CE01ISSP-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	CONDWAT	S/m		0	66000
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	PRACSAL	unitless		0	42
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	PRESWAT	Pa		0	58842000
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE01ISSP-SP001-10-PARAD0999	OPTPARW	micromol photons		0	19999
CE	ADCPT	CE02SHBP-LJ01D-05-ADCPTB104	ECHOINT			\N	\N
CE	ADCPT	CE02SHBP-LJ01D-05-ADCPTB104	VELPROF	m/s		0	10
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	CONDWAT	S/m		0	66000
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	PRACSAL	unitless		0	42
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	PRESWAT	Pa		0	58842000
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	TEMPWAT	degrees C		-2	40
CE	DOSTA	CE02SHBP-LJ01D-06-DOSTAD106	DOCONCS	uMol/l		0	9.59999999999999964
CE	VEL3D	CE02SHBP-LJ01D-07-VEL3DC108	VELPTTU	m/s		0	10
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTCREF			\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTCSIG			\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTTEMP			\N	\N
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	PCO2WAT	uM/ppm		100	600
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PHWATER	pH units		7.29999999999999982	8.5
CE	HYDBB	CE02SHBP-LJ01D-11-HYDBBA106	HYDACPR	micropascals		0	\N
CE	HYDBB	CE02SHBP-LJ01D-11-HYDBBA106	HYDFREQ	KHz		0	\N
CE	CAMDS	CE02SHBP-LJ01D-12-CAMDSB107	CAMSTIL	NA		\N	\N
CE	ZPLSC	CE02SHBP-MJ01C-07-ZPLSCB101	SONBSCA	dB		0	\N
CE	DOSTA	CE02SHSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE02SHSM-RI002-02-VELPTA999	VELPTMN	m/s		0	10
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ADCPT	CE02SHSM-RI003-01-ADCPTA999	ECHOINT			\N	\N
CE	ADCPT	CE02SHSM-RI003-01-ADCPTA999	VELPROF	m/s		0	10
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE02SHSM-RI003-03-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE02SHSM-RI003-04-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE02SHSM-RI003-04-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	METBK	CE02SHSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CE	METBK	CE02SHSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CE	METBK	CE02SHSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CE	METBK	CE02SHSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CE	METBK	CE02SHSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CE	METBK	CE02SHSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CE	METBK	CE02SHSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CE	METBK	CE02SHSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CE	METBK	CE02SHSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	MOISTUR	percent		0	100
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	RELHUMI	percent		0	100
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
CE	VELPT	CE02SHSM-SB001-05-VELPTA999	VELPTMN	m/s		0	10
CE	WAVSS	CE02SHSM-SB001-06-WAVSSA999	WAVSTAT			\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	CONDWAT	S/m		0	66000
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	PRACSAL	unitless		0	42
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	PRESWAT	Pa		0	58842000
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	TEMPWAT	degrees C		-2	40
CE	DOFST	CE02SHSP-SP001-01-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CE	VEL3D	CE02SHSP-SP001-02-VEL3D0999	VELPTTU	m/s		0	10
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	PCO2WAT	uM/ppm		100	600
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE02SHSP-SP001-05-NUTNR0999	NITROPT	_M		0.5	2000
CE	SPKIR	CE02SHSP-SP001-06-SPKIR0999	OPTATTS			\N	\N
CE	SPKIR	CE02SHSP-SP001-06-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	PARAD	CE02SHSP-SP001-08-PARAD0999	OPTPARW	micromol photons		0	19999
CE	ADCPS	CE04OSBP-LJ01C-05-ADCPSI103	ECHOINT			\N	\N
CE	ADCPS	CE04OSBP-LJ01C-05-ADCPSI103	VELPROF	m/s		0	10
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	CONDWAT	S/m		0	66000
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	PRACSAL	unitless		0	42
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	PRESWAT	Pa		0	58842000
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	TEMPWAT	degrees C		-2	40
CE	DOSTA	CE04OSBP-LJ01C-06-DOSTAD108	DOCONCS	uMol/l		0	9.59999999999999964
CE	VEL3D	CE04OSBP-LJ01C-07-VEL3DC107	VELPTTU	m/s		0	10
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTCREF			\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTCSIG			\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTTEMP			\N	\N
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	PCO2WAT	uM/ppm		100	600
CE	HYDBB	CE04OSBP-LJ01C-10-HYDBBA105	HYDACPR	micropascals		0	\N
CE	HYDBB	CE04OSBP-LJ01C-10-HYDBBA105	HYDFREQ	KHz		0	\N
CE	CAMDS	CE04OSBP-LJ01C-11-CAMDSB106	CAMSTIL	NA		\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	CONDWAT	S/m		0	66000
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	PRACSAL	unitless		0	42
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	PRESWAT	Pa		0	58842000
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	TEMPWAT	degrees C		-2	40
CE	VEL3D	CE04OSHY-DP01B-02-VEL3DA105	VELPTTU	m/s		0	10
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	CDOMFLO	ppm		0	0.375
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	CHLAFLO	ug/L		0	50
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	FLUBSCT	1/m		0.00100000000000000002	10
CE	DOFST	CE04OSHY-DP01B-06-DOFSTA105	DOCONCF	uMol/l		0	9.59999999999999964
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PHWATER	pH units		7.29999999999999982	8.5
CE	ZPLSC	CE04OSHY-PC01B-08-ZPLSCB102	SONBSCA	dB		0	\N
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	PCO2WAT	uM/ppm		100	600
CE	VEL3D	CE04OSHY-SF01B-02-VEL3DA106	VELPTTU	m/s		0	10
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	CDOMFLO	ppm		0	0.375
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	CHLAFLO	ug/L		0	50
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	FLUBSCT	1/m		0.00100000000000000002	10
CE	NUTNR	CE04OSHY-SF01B-04-NUTNRA102	NITROPT	_M		0.5	2000
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	PCO2WAT	uM/ppm		100	600
CE	PARAD	CE04OSHY-SF01B-06-PARADA102	OPTPARW	micromol photons		0	19999
CE	SPKIR	CE04OSHY-SF01B-07-SPKIRA102	OPTATTS			\N	\N
CE	SPKIR	CE04OSHY-SF01B-07-SPKIRA102	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	CONDWAT	S/m		0	66000
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	PRACSAL	unitless		0	42
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	PRESWAT	Pa		0	58842000
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	TEMPWAT	degrees C		-2	40
CE	DOFST	CE04OSHY-SF01B-08-DOFSTA107	DOCONCF	uMol/l		0	9.59999999999999964
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTCREF			\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTCSIG			\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTTEMP			\N	\N
CE	DOSTA	CE04OSSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE04OSSM-RI002-02-VELPTB999	VELPTMN	m/s		0	10
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ADCPT	CE04OSSM-RI003-01-ADCPTC999	ECHOINT			\N	\N
CE	ADCPT	CE04OSSM-RI003-01-ADCPTC999	VELPROF	m/s		0	10
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE04OSSM-RI003-03-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE04OSSM-RI003-04-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE04OSSM-RI003-04-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	METBK	CE04OSSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CE	METBK	CE04OSSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CE	METBK	CE04OSSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CE	METBK	CE04OSSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CE	METBK	CE04OSSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CE	METBK	CE04OSSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CE	METBK	CE04OSSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CE	METBK	CE04OSSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CE	METBK	CE04OSSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	MOISTUR	percent		0	100
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	RELHUMI	percent		0	100
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
CE	VELPT	CE04OSSM-SB001-05-VELPTA999	VELPTMN	m/s		0	10
CE	WAVSS	CE04OSSM-SB001-06-WAVSSA999	WAVSTAT			\N	\N
CE	PARAD	CE05MOAS-GL001-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL001-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL001-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL001-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE05MOAS-GL002-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL002-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL002-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL002-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE05MOAS-GL003-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL003-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL003-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL003-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE05MOAS-GL004-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL004-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL004-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL004-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE05MOAS-GL005-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL005-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL005-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL005-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE05MOAS-GL006-01-PARADM999	OPTPARW	micromol photons		0	19999
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	CHLAFLO	ug/L		0	50
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CE	ADCPA	CE05MOAS-GL006-03-ADCPAM999	ECHOINT			\N	\N
CE	ADCPA	CE05MOAS-GL006-03-ADCPAM999	VELPROF	m/s		0	10
CE	DOSTA	CE05MOAS-GL006-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	CONDWAT	S/m		0	66000
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	DENSITY	kg/m^3		1000	1100
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	PRACSAL	unitless		0	42
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	PRESWAT	Pa		0	58842000
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	TEMPWAT	degrees C		-2	40
CE	DOSTA	CE06ISSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTTEMP			\N	\N
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	ADCPT	CE06ISSM-MF004-05-ADCPTM999	ECHOINT			\N	\N
CE	ADCPT	CE06ISSM-MF004-05-ADCPTM999	VELPROF	m/s		0	10
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ZPLSC	CE06ISSM-MF005-02-ZPLSCC999	SONBSCA	dB		0	\N
CE	VEL3D	CE06ISSM-MF005-03-VEL3DD999	VELPTTU	m/s		0	10
CE	PRESF	CE06ISSM-MF005-04-PRESFA999	SFLPRES	Pa		0	58842000
CE	CAMDS	CE06ISSM-MF005-05-CAMDSA999	CAMSTIL	NA		\N	\N
CE	DOSTA	CE06ISSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE06ISSM-RI002-02-VELPTA999	VELPTMN	m/s		0	10
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE06ISSM-RI003-04-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE06ISSM-RI003-05-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE06ISSM-RI003-05-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	VELPT	CE06ISSM-SB001-01-VELPTA999	VELPTMN	m/s		0	10
CE	DOFST	CE06ISSP-SP001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	PCO2WAT	uM/ppm		100	600
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTTEMP			\N	\N
CE	VEL3D	CE06ISSP-SP001-05-VEL3D0999	VELPTTU			\N	\N
CE	NUTNR	CE06ISSP-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
CE	SPKIR	CE06ISSP-SP001-07-SPKIR0999	OPTATTS			\N	\N
CE	SPKIR	CE06ISSP-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	CONDWAT	S/m		0	66000
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	PRACSAL	unitless		0	42
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	PRESWAT	Pa		0	58842000
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE06ISSP-SP001-10-PARAD0999	OPTPARW	micromol photons		0	19999
CE	DOSTA	CE07SHSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTTEMP			\N	\N
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	PRESF	CE07SHSM-MF005-01-PRESFB999	SFLPRES	Pa		0	58842000
CE	CAMDS	CE07SHSM-MF005-02-CAMDSA999	CAMSTIL	NA		\N	\N
CE	ZPLSC	CE07SHSM-MF005-03-ZPLSCC999	SONBSCA	dB		0	\N
CE	ADCPT	CE07SHSM-MF005-04-ADCPTC999	ECHOINT			\N	\N
CE	ADCPT	CE07SHSM-MF005-04-ADCPTC999	VELPROF	m/s		0	10
CE	VEL3D	CE07SHSM-MF005-05-VEL3DD999	VELPTTU	m/s		0	10
CE	DOSTA	CE07SHSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE07SHSM-RI002-02-VELPTA999	VELPTMN	m/s		0	10
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ADCPT	CE07SHSM-RI003-01-ADCPTA999	ECHOINT			\N	\N
CE	ADCPT	CE07SHSM-RI003-01-ADCPTA999	VELPROF	m/s		0	10
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE07SHSM-RI003-03-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE07SHSM-RI003-04-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE07SHSM-RI003-04-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	METBK	CE07SHSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CE	METBK	CE07SHSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CE	METBK	CE07SHSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CE	METBK	CE07SHSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CE	METBK	CE07SHSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CE	METBK	CE07SHSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CE	METBK	CE07SHSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CE	METBK	CE07SHSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CE	METBK	CE07SHSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	MOISTUR	percent		0	100
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	RELHUMI	percent		0	100
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
CE	VELPT	CE07SHSM-SB001-05-VELPTA999	VELPTMN	m/s		0	10
CE	WAVSS	CE07SHSM-SB001-06-WAVSSA999	WAVSTAT			\N	\N
CE	DOFST	CE07SHSP-SP001-01-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CE	VEL3D	CE07SHSP-SP001-02-VEL3D0999	VELPTTU	m/s		0	10
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	PCO2WAT	uM/ppm		100	600
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE07SHSP-SP001-05-NUTNR0999	NITROPT	_M		0.5	2000
CE	SPKIR	CE07SHSP-SP001-06-SPKIR0999	OPTATTS			\N	\N
CE	SPKIR	CE07SHSP-SP001-06-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	CONDWAT	S/m		0	66000
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	PRACSAL	unitless		0	42
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	PRESWAT	Pa		0	58842000
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	TEMPWAT	degrees C		-2	40
CE	PARAD	CE07SHSP-SP001-09-PARAD0999	OPTPARW	micromol photons		0	19999
CE	VEL3D	CE09OSPM-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CE	DOFST	CE09OSPM-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	PARAD	CE09OSPM-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CE	DOSTA	CE09OSSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTTEMP			\N	\N
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	PCO2WAT	uM/ppm		100	600
CE	ADCPS	CE09OSSM-MF004-04-ADCPSJ999	ECHOINT			\N	\N
CE	ADCPS	CE09OSSM-MF004-04-ADCPSJ999	VELPROF	m/s		0	10
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	CONDWAT	S/m		0	66000
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	PRACSAL	unitless		0	42
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	TEMPWAT	degrees C		-2	40
CE	PRESF	CE09OSSM-MF005-02-PRESFC999	SFLPRES	Pa		0	58842000
CE	CAMDS	CE09OSSM-MF005-03-CAMDSA999	CAMSTIL	NA		\N	\N
CE	VEL3D	CE09OSSM-MF005-04-VEL3DD999	VELPTTU	m/s		0	10
CE	DOSTA	CE09OSSM-RI002-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CE	VELPT	CE09OSSM-RI002-02-VELPTB999	VELPTMN	m/s		0	10
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	CONDWAT	S/m		0	66000
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	DENSITY	kg/m^3		1000	1100
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	PRACSAL	unitless		0	42
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	PRESWAT	Pa		0	58842000
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	TEMPWAT	degrees C		-2	40
CE	ADCPT	CE09OSSM-RI003-01-ADCPTC999	ECHOINT			\N	\N
CE	ADCPT	CE09OSSM-RI003-01-ADCPTC999	VELPROF	m/s		0	10
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTCREF			\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTCSIG			\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTTEMP			\N	\N
CE	NUTNR	CE09OSSM-RI003-03-NUTNRB999	NITROPT	_M		0.5	2000
CE	SPKIR	CE09OSSM-RI003-04-SPKIRB999	OPTATTS			\N	\N
CE	SPKIR	CE09OSSM-RI003-04-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CE	METBK	CE09OSSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CE	METBK	CE09OSSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CE	METBK	CE09OSSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CE	METBK	CE09OSSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CE	METBK	CE09OSSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CE	METBK	CE09OSSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CE	METBK	CE09OSSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CE	METBK	CE09OSSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CE	METBK	CE09OSSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	MOISTUR	percent		0	100
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	RELHUMI	percent		0	100
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
CE	VELPT	CE09OSSM-SB001-05-VELPTA999	VELPTMN	m/s		0	10
CE	WAVSS	CE09OSSM-SB001-06-WAVSSA999	WAVSTAT			\N	\N
CP	ADCPT	CP01CNSM-MF004-01-ADCPTF999	ECHOINT			\N	\N
CP	ADCPT	CP01CNSM-MF004-01-ADCPTF999	VELPROF	m/s		0	10
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTTEMP			\N	\N
CP	DOSTA	CP01CNSM-MF004-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	VELPT	CP01CNSM-MF004-04-VELPTA999	VELPTMN	m/s		0	10
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	PCO2WAT	uM/ppm		100	600
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	CONDWAT	S/m		0	66000
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	PRACSAL	unitless		0	42
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	TEMPWAT	degrees C		-2	40
CP	ZPLSC	CP01CNSM-MF005-03-ZPLSCC999	SONBSCA	dB		0	\N
CP	PRESF	CP01CNSM-MF005-04-PRESFB999	SFLPRES	Pa		0	58842000
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTTEMP			\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	CONDWAT	S/m		0	66000
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	PRACSAL	unitless		0	42
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	TEMPWAT	degrees C		-2	40
CP	VELPT	CP01CNSM-RI002-04-VELPTA999	VELPTMN	m/s		0	10
CP	NUTNR	CP01CNSM-RI003-01-NUTNRB999	NITROPT	_M		0.5	2000
CP	DOSTA	CP01CNSM-RI003-02-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CP	SPKIR	CP01CNSM-RI003-04-SPKIRB999	OPTATTS			\N	\N
CP	SPKIR	CP01CNSM-RI003-04-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	METBK	CP01CNSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CP	METBK	CP01CNSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CP	METBK	CP01CNSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CP	METBK	CP01CNSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CP	METBK	CP01CNSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CP	METBK	CP01CNSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CP	METBK	CP01CNSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CP	METBK	CP01CNSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CP	METBK	CP01CNSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CP	METBK	CP01CNSM-SB001-02-METBKA999	BARPRES	Pa		\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	CONDSRF	S/m		0	66000
CP	METBK	CP01CNSM-SB001-02-METBKA999	LONGIRR	W/m2		200	500
CP	METBK	CP01CNSM-SB001-02-METBKA999	PRECIPM	mm		0	304.800000000000011
CP	METBK	CP01CNSM-SB001-02-METBKA999	RELHUMI	percent		0	100
CP	METBK	CP01CNSM-SB001-02-METBKA999	SHRTIRR	W/m2		0	1000
CP	METBK	CP01CNSM-SB001-02-METBKA999	SPECHUM	percent		0	100
CP	METBK	CP01CNSM-SB001-02-METBKA999	TEMPAIR	degrees C		-50	50
CP	METBK	CP01CNSM-SB001-02-METBKA999	TEMPSRF	degrees C		-2	40
CP	METBK	CP01CNSM-SB001-02-METBKA999	WINDAVG	m/s		0	103.269999999999996
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CP	WAVSS	CP01CNSM-SB001-04-WAVSSA999	WAVSTAT			\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	MOISTUR	percent		0	100
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	MOTFLUX	degree (from north or vertical)		0	360
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	TMPATUR	degrees C		-50	50
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	WINDTUR	m/s		0	103.269999999999996
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTTEMP			\N	\N
CP	NUTNR	CP01CNSP-SP001-03-NUTNR0999	NITROPT	_M		0.5	2000
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	PCO2WAT	uM/ppm		100	600
CP	VEL3D	CP01CNSP-SP001-05-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP01CNSP-SP001-06-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	SPKIR	CP01CNSP-SP001-07-SPKIR0999	OPTATTS			\N	\N
CP	SPKIR	CP01CNSP-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP01CNSP-SP001-10-PARAD0999	OPTPARW	micromol photons		0	19999
CP	ADCPT	CP02PMCI-RI001-01-ADCPTG999	ECHOINT			\N	\N
CP	ADCPT	CP02PMCI-RI001-01-ADCPTG999	VELPROF	m/s		0	10
CP	VEL3D	CP02PMCI-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP02PMCI-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP02PMCI-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CP	ADCPT	CP02PMCO-RI001-01-ADCPTG999	ECHOINT			\N	\N
CP	ADCPT	CP02PMCO-RI001-01-ADCPTG999	VELPROF	m/s		0	10
CP	VEL3D	CP02PMCO-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP02PMCO-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP02PMCO-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CP	ADCPT	CP02PMUI-RI001-01-ADCPTG999	ECHOINT			\N	\N
CP	ADCPT	CP02PMUI-RI001-01-ADCPTG999	VELPROF	m/s		0	10
CP	VEL3D	CP02PMUI-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP02PMUI-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP02PMUI-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CP	ADCPS	CP02PMUO-RI001-01-ADCPSL999	ECHOINT			\N	\N
CP	ADCPS	CP02PMUO-RI001-01-ADCPSL999	VELPROF	m/s		0	10
CP	VEL3D	CP02PMUO-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP02PMUO-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP02PMUO-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CP	DOSTA	CP03ISSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	VELPT	CP03ISSM-MF004-03-VELPTA999	VELPTMN	m/s		0	10
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	CONDWAT	S/m		0	66000
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	PRACSAL	unitless		0	42
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	TEMPWAT	degrees C		-2	40
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	PCO2WAT	uM/ppm		100	600
CP	PRESF	CP03ISSM-MF005-02-PRESFB999	SFLPRES	Pa		0	58842000
CP	ADCPT	CP03ISSM-MF005-03-ADCPTF999	ECHOINT			\N	\N
CP	ADCPT	CP03ISSM-MF005-03-ADCPTF999	VELPROF	m/s		0	10
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTTEMP			\N	\N
CP	ZPLSC	CP03ISSM-MF005-05-ZPLSCC999	SONBSCA	dB		0	\N
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTTEMP			\N	\N
CP	SPKIR	CP03ISSM-RI002-03-SPKIRB999	OPTATTS			\N	\N
CP	SPKIR	CP03ISSM-RI002-03-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CP	DOSTA	CP03ISSM-RI002-04-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	NUTNR	CP03ISSM-RI003-01-NUTNRB999	NITROPT	_M		0.5	2000
CP	VELPT	CP03ISSM-RI003-03-VELPTA999	VELPTMN	m/s		0	10
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	CONDWAT	S/m		0	66000
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	PRACSAL	unitless		0	42
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	METBK	CP03ISSM-SB001-01-METBKA999	BARPRES	Pa		\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	CONDSRF	S/m		0	66000
CP	METBK	CP03ISSM-SB001-01-METBKA999	LONGIRR	W/m2		200	500
CP	METBK	CP03ISSM-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
CP	METBK	CP03ISSM-SB001-01-METBKA999	RELHUMI	percent		0	100
CP	METBK	CP03ISSM-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
CP	METBK	CP03ISSM-SB001-01-METBKA999	SPECHUM	percent		0	100
CP	METBK	CP03ISSM-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
CP	METBK	CP03ISSM-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
CP	METBK	CP03ISSM-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	MOISTUR	percent		0	100
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	MOTFLUX	degree (from north or vertical)		0	360
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	TMPATUR	degrees C		-50	50
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	WINDTUR	m/s		0	103.269999999999996
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTTEMP			\N	\N
CP	NUTNR	CP03ISSP-SP001-03-NUTNR0999	NITROPT	_M		0.5	2000
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	PCO2WAT	uM/ppm		100	600
CP	VEL3D	CP03ISSP-SP001-05-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP03ISSP-SP001-06-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	SPKIR	CP03ISSP-SP001-07-SPKIR0999	OPTATTS			\N	\N
CP	SPKIR	CP03ISSP-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP03ISSP-SP001-10-PARAD0999	OPTPARW	micromol photons		0	19999
CP	VEL3D	CP04OSPM-WF001-01-VEL3D0999	VELPTTU	m/s		0	10
CP	DOFST	CP04OSPM-WF001-02-DOFST0999	DOCONCF	uMol/l		0	9.59999999999999964
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	CONDWAT	S/m		0	66000
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	DENSITY	kg/m^3		1000	1100
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	PRACSAL	unitless		0	42
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	PRESWAT	Pa		0	58842000
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	PARAD	CP04OSPM-WF001-05-PARAD0999	OPTPARW	micromol photons		0	19999
CP	DOSTA	CP04OSSM-MF004-01-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	VELPT	CP04OSSM-MF004-03-VELPTB999	VELPTMN	m/s		0	10
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	CONDWAT	S/m		0	66000
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	PRACSAL	unitless		0	42
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	TEMPWAT	degrees C		-2	40
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	PCO2WAT	uM/ppm		100	600
CP	PRESF	CP04OSSM-MF005-02-PRESFC999	SFLPRES	Pa		0	58842000
CP	ADCPS	CP04OSSM-MF005-03-ADCPSJ999	ECHOINT			\N	\N
CP	ADCPS	CP04OSSM-MF005-03-ADCPSJ999	VELPROF	m/s		0	10
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTTEMP			\N	\N
CP	ZPLSC	CP04OSSM-MF005-05-ZPLSCC999	SONBSCA	dB		0	\N
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	ABSTHRM	1/m		0.00100000000000000002	10
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PH434SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PH578SI	1/m		0.00100000000000000002	10
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PHWATER	pH units		7.29999999999999982	8.5
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTCREF			\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTCSIG			\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTTEMP			\N	\N
CP	SPKIR	CP04OSSM-RI002-03-SPKIRB999	OPTATTS			\N	\N
CP	SPKIR	CP04OSSM-RI002-03-SPKIRB999	SPECTIR	_W*cm^-2*nm^-1		0	300
CP	DOSTA	CP04OSSM-RI002-04-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
CP	NUTNR	CP04OSSM-RI003-01-NUTNRB999	NITROPT	_M		0.5	2000
CP	VELPT	CP04OSSM-RI003-03-VELPTB999	VELPTMN	m/s		0	10
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	CONDWAT	S/m		0	66000
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	DENSITY	kg/m^3		1000	1100
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	PRACSAL	unitless		0	42
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	PRESWAT	Pa		0	58842000
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	TEMPWAT	degrees C		-2	40
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	CHLAFLO	ug/L		0	50
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	FLUBSCT	1/m		0.00100000000000000002	10
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	MOISTUR	percent		0	100
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	MOTFLUX	degree (from north or vertical)		0	360
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	TMPATUR	degrees C		-50	50
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	WINDTUR	m/s		0	103.269999999999996
CP	METBK	CP04OSSM-SB001-02-METBKA999	BARPRES	Pa		\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	CONDSRF	S/m		0	66000
CP	METBK	CP04OSSM-SB001-02-METBKA999	LONGIRR	W/m2		200	500
CP	METBK	CP04OSSM-SB001-02-METBKA999	PRECIPM	mm		0	304.800000000000011
CP	METBK	CP04OSSM-SB001-02-METBKA999	RELHUMI	percent		0	100
CP	METBK	CP04OSSM-SB001-02-METBKA999	SHRTIRR	W/m2		0	1000
CP	METBK	CP04OSSM-SB001-02-METBKA999	SPECHUM	percent		0	100
CP	METBK	CP04OSSM-SB001-02-METBKA999	TEMPAIR	degrees C		-50	50
CP	METBK	CP04OSSM-SB001-02-METBKA999	TEMPSRF	degrees C		-2	40
CP	METBK	CP04OSSM-SB001-02-METBKA999	WINDAVG	m/s		0	103.269999999999996
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PCO2SSW			\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PRESAIR			\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	XCO2ATM			\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	XCO2SSW			\N	\N
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	FLUBSCT	1/m		0.00100000000000000002	10
CP	DOSTA	CP05MOAS-AV001-02-DOSTAN999	DOCONCS	uMol/l		0	9.59999999999999964
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	CONDWAT	S/m		0	66000
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	DENSITY	kg/m^3		1000	1100
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	PRACSAL	unitless		0	42
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	PRESWAT	Pa		0	58842000
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	TEMPWAT	degrees C		-2	40
CP	NUTNR	CP05MOAS-AV001-04-NUTNRN999	NITROPT	_M		0.5	2000
CP	ADCPA	CP05MOAS-AV001-05-ADCPAN999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-AV001-05-ADCPAN999	VELPROF	m/s		0	10
CP	PARAD	CP05MOAS-AV001-06-PARADN999	OPTPARW	micromol photons		0	19999
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	FLUBSCT	1/m		0.00100000000000000002	10
CP	DOSTA	CP05MOAS-AV002-02-DOSTAN999	DOCONCS	uMol/l		0	9.59999999999999964
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	CONDWAT	S/m		0	66000
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	DENSITY	kg/m^3		1000	1100
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	PRACSAL	unitless		0	42
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	PRESWAT	Pa		0	58842000
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	TEMPWAT	degrees C		-2	40
CP	NUTNR	CP05MOAS-AV002-04-NUTNRN999	NITROPT	_M		0.5	2000
CP	ADCPA	CP05MOAS-AV002-05-ADCPAN999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-AV002-05-ADCPAN999	VELPROF	m/s		0	10
CP	PARAD	CP05MOAS-AV002-06-PARADN999	OPTPARW	micromol photons		0	19999
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	FLUBSCT	1/m		0.00100000000000000002	10
CP	DOSTA	CP05MOAS-AV003-02-DOSTAN999	DOCONCS	uMol/l		0	9.59999999999999964
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	CONDWAT	S/m		0	66000
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	DENSITY	kg/m^3		1000	1100
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	PRACSAL	unitless		0	42
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	PRESWAT	Pa		0	58842000
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	TEMPWAT	degrees C		-2	40
CP	NUTNR	CP05MOAS-AV003-04-NUTNRN999	NITROPT	_M		0.5	2000
CP	ADCPA	CP05MOAS-AV003-05-ADCPAN999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-AV003-05-ADCPAN999	VELPROF	m/s		0	10
CP	PARAD	CP05MOAS-AV003-06-PARADN999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL001-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL001-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL001-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL001-05-PARADM999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL002-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL002-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL002-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL002-05-PARADM999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL003-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL003-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL003-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL003-05-PARADM999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL004-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL004-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL004-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL004-05-PARADM999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL005-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL005-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL005-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL005-05-PARADM999	OPTPARW	micromol photons		0	19999
CP	ADCPA	CP05MOAS-GL006-01-ADCPAM999	ECHOINT			\N	\N
CP	ADCPA	CP05MOAS-GL006-01-ADCPAM999	VELPROF	m/s		0	10
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	CDOMFLO	ppm		0	0.375
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	CHLAFLO	ug/L		0	50
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	FLUBSCT	1/m		0.00100000000000000002	10
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	CONDWAT	S/m		0	66000
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	DENSITY	kg/m^3		1000	1100
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	PRACSAL	unitless		0	42
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	PRESWAT	Pa		0	58842000
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	TEMPWAT	degrees C		-2	40
CP	DOSTA	CP05MOAS-GL006-04-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
CP	PARAD	CP05MOAS-GL006-05-PARADM999	OPTPARW	Pa		0	58842000
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	CONDWAT	S/m		0	66000
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	DENSITY	kg/m^3		1000	1100
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	PRACSAL	unitless		0	42
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	PRESWAT	Pa		0	58842000
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	TEMPWAT	degrees C		-2	40
GA	ADCPS	GA01SUMO-RI002-03-ADCPSN999	ECHOINT			\N	\N
GA	ADCPS	GA01SUMO-RI002-03-ADCPSN999	VELPROF	m/s		0	10
GA	FLORD	GA01SUMO-RI002-04-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA01SUMO-RI002-04-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	VELPT	GA01SUMO-RI002-05-VELPTB999	VELPTMN	m/s		0	10
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	CONDWAT	S/m		0	66000
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	PRACSAL	unitless		0	42
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	TEMPWAT	degrees C		-2	40
GA	METBK	GA01SUMO-SB001-01-METBKA999	BARPRES	Pa		\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	CONDSRF	S/m		0	66000
GA	METBK	GA01SUMO-SB001-01-METBKA999	LONGIRR	W/m2		200	500
GA	METBK	GA01SUMO-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
GA	METBK	GA01SUMO-SB001-01-METBKA999	RELHUMI	percent		0	100
GA	METBK	GA01SUMO-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
GA	METBK	GA01SUMO-SB001-01-METBKA999	SPECHUM	percent		0	100
GA	METBK	GA01SUMO-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
GA	METBK	GA01SUMO-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
GA	METBK	GA01SUMO-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
GA	METBK	GA01SUMO-SB001-02-METBKA999	BARPRES	Pa		\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	CONDSRF	S/m		0	66000
GA	METBK	GA01SUMO-SB001-02-METBKA999	LONGIRR	W/m2		200	500
GA	METBK	GA01SUMO-SB001-02-METBKA999	PRECIPM	mm		0	304.800000000000011
GA	METBK	GA01SUMO-SB001-02-METBKA999	RELHUMI	percent		0	100
GA	METBK	GA01SUMO-SB001-02-METBKA999	SHRTIRR	W/m2		0	1000
GA	METBK	GA01SUMO-SB001-02-METBKA999	SPECHUM	percent		0	100
GA	METBK	GA01SUMO-SB001-02-METBKA999	TEMPAIR	degrees C		-50	50
GA	METBK	GA01SUMO-SB001-02-METBKA999	TEMPSRF	degrees C		-2	40
GA	METBK	GA01SUMO-SB001-02-METBKA999	WINDAVG	m/s		0	103.269999999999996
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PCO2SSW			\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PRESAIR			\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	XCO2ATM			\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	XCO2SSW			\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	MOISTUR	percent		0	100
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	RELHUMI	percent		0	100
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
GA	WAVSS	GA01SUMO-SB001-05-WAVSSA999	WAVSTAT			\N	\N
GA	ZPLSG	GA02HYPM-MP003-01-ZPLSGA999	SONBSCA	dB		0	\N
GA	FLORD	GA02HYPM-SP001-01-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA02HYPM-SP001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	PCO2WAT	uM/ppm		100	600
GA	DOSTA	GA02HYPM-SP001-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	CONDWAT	S/m		0	66000
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	PRACSAL	unitless		0	42
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	PRESWAT	Pa		0	58842000
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTCREF			\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTCSIG			\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTTEMP			\N	\N
GA	NUTNR	GA02HYPM-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
GA	SPKIR	GA02HYPM-SP001-07-SPKIR0999	OPTATTS			\N	\N
GA	SPKIR	GA02HYPM-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
GA	FLORD	GA02HYPM-WF002-01-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA02HYPM-WF002-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	DOSTA	GA02HYPM-WF002-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	CONDWAT	S/m		0	66000
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	PRACSAL	unitless		0	42
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	PRESWAT	Pa		0	58842000
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GA	VEL3D	GA02HYPM-WF002-05-VEL3D0999	VELPTTU	m/s		0	10
GA	FLORD	GA02HYPM-WF004-01-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA02HYPM-WF004-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	DOSTA	GA02HYPM-WF004-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	CONDWAT	S/m		0	66000
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	PRACSAL	unitless		0	42
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	PRESWAT	Pa		0	58842000
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GA	VEL3D	GA02HYPM-WF004-05-VEL3D0999	VELPTTU	m/s		0	10
GA	FLORD	GA03FLMA-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA03FLMA-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GA	DOSTA	GA03FLMA-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GA	ADCPS	GA03FLMA-RI001-04-ADCPSL999	ECHOINT			\N	\N
GA	ADCPS	GA03FLMA-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	FLORD	GA03FLMB-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GA	FLORD	GA03FLMB-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GA	DOSTA	GA03FLMB-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GA	ADCPS	GA03FLMB-RI001-04-ADCPSL999	ECHOINT			\N	\N
GA	ADCPS	GA03FLMB-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GA	FLORD	GA05MOAS-GL001-01-FLORDM999	CHLAFLO	ug/L		0	50
GA	FLORD	GA05MOAS-GL001-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GA	DOSTA	GA05MOAS-GL001-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	CONDWAT	S/m		0	66000
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	PRACSAL	unitless		0	42
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	PRESWAT	Pa		0	58842000
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GA	FLORD	GA05MOAS-GL002-01-FLORDM999	CHLAFLO	ug/L		0	50
GA	FLORD	GA05MOAS-GL002-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GA	DOSTA	GA05MOAS-GL002-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	CONDWAT	S/m		0	66000
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	PRACSAL	unitless		0	42
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	PRESWAT	Pa		0	58842000
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GA	FLORD	GA05MOAS-GL003-01-FLORDM999	CHLAFLO	ug/L		0	50
GA	FLORD	GA05MOAS-GL003-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GA	DOSTA	GA05MOAS-GL003-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	CONDWAT	S/m		0	66000
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	PRACSAL	unitless		0	42
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	PRESWAT	Pa		0	58842000
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	CONDWAT	S/m		0	66000
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	DENSITY	kg/m^3		1000	1100
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	PRACSAL	unitless		0	42
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	PRESWAT	Pa		0	58842000
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	TEMPWAT	degrees C		-2	40
GI	ADCPS	GI01SUMO-RI002-03-ADCPSN999	ECHOINT			\N	\N
GI	ADCPS	GI01SUMO-RI002-03-ADCPSN999	VELPROF	m/s		0	10
GI	FLORD	GI01SUMO-RI002-04-FLORD0999	CHLAFLO	ug/L		0	50
GI	FLORD	GI01SUMO-RI002-04-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GI	VELPT	GI01SUMO-RI002-05-VELPTB999	VELPTMN	m/s		0	10
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	CONDWAT	S/m		0	66000
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	PRACSAL	unitless		0	42
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	TEMPWAT	degrees C		-2	40
GI	METBK	GI01SUMO-SB001-01-METBKA999	BARPRES	Pa		\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	CONDSRF	S/m		0	66000
GI	METBK	GI01SUMO-SB001-01-METBKA999	LONGIRR	W/m2		200	500
GI	METBK	GI01SUMO-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
GI	METBK	GI01SUMO-SB001-01-METBKA999	RELHUMI	percent		0	100
GI	METBK	GI01SUMO-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
GI	METBK	GI01SUMO-SB001-01-METBKA999	SPECHUM	percent		0	100
GI	METBK	GI01SUMO-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
GI	METBK	GI01SUMO-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
GI	METBK	GI01SUMO-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
GI	METBK	GI01SUMO-SB001-02-METBKA999	BARPRES	Pa		\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	CONDSRF	S/m		0	66000
GI	METBK	GI01SUMO-SB001-02-METBKA999	LONGIRR	W/m2		200	500
GI	METBK	GI01SUMO-SB001-02-METBKA999	PRECIPM	mm		0	304.800000000000011
GI	METBK	GI01SUMO-SB001-02-METBKA999	RELHUMI	percent		0	100
GI	METBK	GI01SUMO-SB001-02-METBKA999	SHRTIRR	W/m2		0	1000
GI	METBK	GI01SUMO-SB001-02-METBKA999	SPECHUM	percent		0	100
GI	METBK	GI01SUMO-SB001-02-METBKA999	TEMPAIR	degrees C		-50	50
GI	METBK	GI01SUMO-SB001-02-METBKA999	TEMPSRF	degrees C		-2	40
GI	METBK	GI01SUMO-SB001-02-METBKA999	WINDAVG	m/s		0	103.269999999999996
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PCO2SSW			\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PRESAIR			\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	XCO2ATM			\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	XCO2SSW			\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	MOISTUR	percent		0	100
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	RELHUMI	percent		0	100
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
GI	WAVSS	GI01SUMO-SB001-05-WAVSSA999	WAVSTAT			\N	\N
GI	ZPLSG	GI02HYPM-MP003-01-ZPLSGA999	SONBSCA	dB		0	\N
GI	FLORD	GI02HYPM-SP001-01-FLORD0999	CHLAFLO	ug/L		0	50
GI	FLORD	GI02HYPM-SP001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	PCO2WAT	uM/ppm		100	600
GI	DOSTA	GI02HYPM-SP001-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	CONDWAT	S/m		0	66000
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	PRACSAL	unitless		0	42
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	PRESWAT	Pa		0	58842000
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTCREF			\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTCSIG			\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTTEMP			\N	\N
GI	NUTNR	GI02HYPM-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
GI	SPKIR	GI02HYPM-SP001-07-SPKIR0999	OPTATTS			\N	\N
GI	SPKIR	GI02HYPM-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
GI	FLORD	GI02HYPM-WF002-01-FLORD0999	CHLAFLO	ug/L		0	50
GI	FLORD	GI02HYPM-WF002-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GI	DOSTA	GI02HYPM-WF002-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	CONDWAT	S/m		0	66000
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	PRACSAL	unitless		0	42
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	PRESWAT	Pa		0	58842000
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GI	VEL3D	GI02HYPM-WF002-05-VEL3D0999	VELPTTU	m/s		0	10
GI	FLORD	GI03FLMA-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GI	FLORD	GI03FLMA-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GI	DOSTA	GI03FLMA-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GI	ADCPS	GI03FLMA-RI001-04-ADCPSL999	ECHOINT			\N	\N
GI	ADCPS	GI03FLMA-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	FLORD	GI03FLMB-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GI	FLORD	GI03FLMB-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GI	DOSTA	GI03FLMB-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GI	ADCPS	GI03FLMB-RI001-04-ADCPSL999	ECHOINT			\N	\N
GI	ADCPS	GI03FLMB-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GI	FLORD	GI05MOAS-GL001-01-FLORDM999	CHLAFLO	ug/L		0	50
GI	FLORD	GI05MOAS-GL001-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GI	DOSTA	GI05MOAS-GL001-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	CONDWAT	S/m		0	66000
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	PRACSAL	unitless		0	42
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	PRESWAT	Pa		0	58842000
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GI	FLORD	GI05MOAS-GL002-01-FLORDM999	CHLAFLO	ug/L		0	50
GI	FLORD	GI05MOAS-GL002-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GI	DOSTA	GI05MOAS-GL002-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	CONDWAT	S/m		0	66000
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	PRACSAL	unitless		0	42
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	PRESWAT	Pa		0	58842000
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GI	FLORD	GI05MOAS-GL003-01-FLORDM999	CHLAFLO	ug/L		0	50
GI	FLORD	GI05MOAS-GL003-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GI	DOSTA	GI05MOAS-GL003-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	CONDWAT	S/m		0	66000
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	PRACSAL	unitless		0	42
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	PRESWAT	Pa		0	58842000
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GP	ZPLSG	GP02HYPM-MP003-01-ZPLSGA999	SONBSCA	dB		0	\N
GP	FLORD	GP02HYPM-SP001-01-FLORD0999	CHLAFLO	ug/L		0	50
GP	FLORD	GP02HYPM-SP001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	PCO2WAT	uM/ppm		100	600
GP	DOSTA	GP02HYPM-SP001-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	CONDWAT	S/m		0	66000
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRACSAL	unitless		0	42
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRESWAT	Pa		0	58842000
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTCREF			\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTCSIG			\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTTEMP			\N	\N
GP	NUTNR	GP02HYPM-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
GP	SPKIR	GP02HYPM-SP001-07-SPKIR0999	OPTATTS			\N	\N
GP	SPKIR	GP02HYPM-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
GP	FLORD	GP02HYPM-WF002-01-FLORD0999	CHLAFLO	ug/L		0	50
GP	FLORD	GP02HYPM-WF002-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GP	DOSTA	GP02HYPM-WF002-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	CONDWAT	S/m		0	66000
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRACSAL	unitless		0	42
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRESWAT	Pa		0	58842000
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GP	VEL3D	GP02HYPM-WF002-05-VEL3D0999	VELPTTU	m/s		0	10
GP	FLORD	GP02HYPM-WF004-01-FLORD0999	CHLAFLO	ug/L		0	50
GP	FLORD	GP02HYPM-WF004-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GP	DOSTA	GP02HYPM-WF004-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	CONDWAT	S/m		0	66000
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRACSAL	unitless		0	42
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRESWAT	Pa		0	58842000
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GP	VEL3D	GP02HYPM-WF004-05-VEL3D0999	VELPTTU	m/s		0	10
GP	FLORD	GP03FLMA-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GP	FLORD	GP03FLMA-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GP	DOSTA	GP03FLMA-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GP	ADCPS	GP03FLMA-RI001-04-ADCPSL999	ECHOINT			\N	\N
GP	ADCPS	GP03FLMA-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	FLORD	GP03FLMB-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GP	FLORD	GP03FLMB-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GP	DOSTA	GP03FLMB-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GP	ADCPS	GP03FLMB-RI001-04-ADCPSL999	ECHOINT			\N	\N
GP	ADCPS	GP03FLMB-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GP	FLORD	GP05MOAS-GL001-01-FLORDM999	CHLAFLO	ug/L		0	50
GP	FLORD	GP05MOAS-GL001-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GP	DOSTA	GP05MOAS-GL001-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	CONDWAT	S/m		0	66000
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRACSAL	unitless		0	42
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRESWAT	Pa		0	58842000
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GP	FLORD	GP05MOAS-GL002-01-FLORDM999	CHLAFLO	ug/L		0	50
GP	FLORD	GP05MOAS-GL002-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GP	DOSTA	GP05MOAS-GL002-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	CONDWAT	S/m		0	66000
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRACSAL	unitless		0	42
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRESWAT	Pa		0	58842000
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GP	FLORD	GP05MOAS-GL003-01-FLORDM999	CHLAFLO	ug/L		0	50
GP	FLORD	GP05MOAS-GL003-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GP	DOSTA	GP05MOAS-GL003-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	CONDWAT	S/m		0	66000
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRACSAL	unitless		0	42
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRESWAT	Pa		0	58842000
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	CONDWAT	S/m		0	66000
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	DENSITY	kg/m^3		1000	1100
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	PRACSAL	unitless		0	42
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	PRESWAT	Pa		0	58842000
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	TEMPWAT	degrees C		-2	40
GS	ADCPS	GS01SUMO-RI002-03-ADCPSN999	ECHOINT			\N	\N
GS	ADCPS	GS01SUMO-RI002-03-ADCPSN999	VELPROF	m/s		0	10
GS	FLORD	GS01SUMO-RI002-04-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS01SUMO-RI002-04-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	VELPT	GS01SUMO-RI002-05-VELPTB999	VELPTMN	m/s		0	10
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	ABSTHRM	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PH434SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PH578SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PHWATER	pH units		7.29999999999999982	8.5
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	CONDWAT	S/m		0	66000
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	PRACSAL	unitless		0	42
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	TEMPWAT	degrees C		-2	40
GS	METBK	GS01SUMO-SB001-01-METBKA999	BARPRES	Pa		\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	CONDSRF	S/m		0	66000
GS	METBK	GS01SUMO-SB001-01-METBKA999	LONGIRR	W/m2		200	500
GS	METBK	GS01SUMO-SB001-01-METBKA999	PRECIPM	mm		0	304.800000000000011
GS	METBK	GS01SUMO-SB001-01-METBKA999	RELHUMI	percent		0	100
GS	METBK	GS01SUMO-SB001-01-METBKA999	SHRTIRR	W/m2		0	1000
GS	METBK	GS01SUMO-SB001-01-METBKA999	SPECHUM	percent		0	100
GS	METBK	GS01SUMO-SB001-01-METBKA999	TEMPAIR	degrees C		-50	50
GS	METBK	GS01SUMO-SB001-01-METBKA999	TEMPSRF	degrees C		-2	40
GS	METBK	GS01SUMO-SB001-01-METBKA999	WINDAVG	m/s		0	103.269999999999996
GS	METBK	GS01SUMO-SB001-02-METBKA999	BARPRES	Pa		\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	CONDSRF	S/m		0	66000
GS	METBK	GS01SUMO-SB001-02-METBKA999	LONGIRR	W/m2		200	500
GS	METBK	GS01SUMO-SB001-02-METBKA999	PRECIPM	mm		0	304.800000000000011
GS	METBK	GS01SUMO-SB001-02-METBKA999	RELHUMI	percent		0	100
GS	METBK	GS01SUMO-SB001-02-METBKA999	SHRTIRR	W/m2		0	1000
GS	METBK	GS01SUMO-SB001-02-METBKA999	SPECHUM	percent		0	100
GS	METBK	GS01SUMO-SB001-02-METBKA999	TEMPAIR	degrees C		-50	50
GS	METBK	GS01SUMO-SB001-02-METBKA999	TEMPSRF	degrees C		-2	40
GS	METBK	GS01SUMO-SB001-02-METBKA999	WINDAVG	m/s		0	103.269999999999996
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	CO2FLUX	uatm/ppm		-1	1
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PCO2ATM	uatm/ppm		180	500
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PCO2SSW			\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PRESAIR			\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	XCO2ATM			\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	XCO2SSW			\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXHOT	J m^(-2) s^(-1)		-19999	19999
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXMOM	kg m^(-1) s^(-2)		-19999	19999
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXWET	kg m^(-1) s^(-1)		-19999	19999
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	MOISTUR	percent		0	100
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	MOTFLUX	degree (from north or vertical)		0	360
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	RELHUMI	percent		0	100
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	TMPATUR	degrees C		-50	50
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	WINDTUR	m/s		0	103.269999999999996
GS	WAVSS	GS01SUMO-SB001-05-WAVSSA999	WAVSTAT			\N	\N
GS	ZPLSG	GS02HYPM-MP003-01-ZPLSGA999	SONBSCA	dB		0	\N
GS	FLORD	GS02HYPM-SP001-01-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS02HYPM-SP001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2THRM	cm^2/mole		0.000100000000000000005	100000
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	PCO2WAT	uM/ppm		100	600
GS	DOSTA	GS02HYPM-SP001-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	CONDWAT	S/m		0	66000
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	PRACSAL	unitless		0	42
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	PRESWAT	Pa		0	58842000
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTABSN	1/m		0.00100000000000000002	10
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTATTN	1/m		0.00100000000000000002	10
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTCREF			\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTCSIG			\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTTEMP			\N	\N
GS	NUTNR	GS02HYPM-SP001-06-NUTNR0999	NITROPT	_M		0.5	2000
GS	SPKIR	GS02HYPM-SP001-07-SPKIR0999	OPTATTS			\N	\N
GS	SPKIR	GS02HYPM-SP001-07-SPKIR0999	SPECTIR	_W*cm^-2*nm^-1		0	300
GS	FLORD	GS02HYPM-WF002-01-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS02HYPM-WF002-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	DOSTA	GS02HYPM-WF002-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	CONDWAT	S/m		0	66000
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	PRACSAL	unitless		0	42
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	PRESWAT	Pa		0	58842000
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GS	VEL3D	GS02HYPM-WF002-05-VEL3D0999	VELPTTU	m/s		0	10
GS	FLORD	GS02HYPM-WF004-01-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS02HYPM-WF004-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	DOSTA	GS02HYPM-WF004-03-DOSTA0999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	CONDWAT	S/m		0	66000
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	DENSITY	kg/m^3		1000	1100
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	PRACSAL	unitless		0	42
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	PRESWAT	Pa		0	58842000
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	TEMPWAT	degrees C		-2	40
GS	VEL3D	GS02HYPM-WF004-05-VEL3D0999	VELPTTU	m/s		0	10
GS	FLORD	GS03FLMA-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS03FLMA-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GS	DOSTA	GS03FLMA-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GS	ADCPS	GS03FLMA-RI001-04-ADCPSL999	ECHOINT			\N	\N
GS	ADCPS	GS03FLMA-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	FLORD	GS03FLMB-RI001-01-FLORD0999	CHLAFLO	ug/L		0	50
GS	FLORD	GS03FLMB-RI001-01-FLORD0999	FLUBSCT	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	ABSTHRM	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PH434SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PH578SI	1/m		0.00100000000000000002	10
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PHWATER	pH units		7.29999999999999982	8.5
GS	DOSTA	GS03FLMB-RI001-03-DOSTAD999	DOCONCS	uMol/l		0	9.59999999999999964
GS	ADCPS	GS03FLMB-RI001-04-ADCPSL999	ECHOINT			\N	\N
GS	ADCPS	GS03FLMB-RI001-04-ADCPSL999	VELPROF	m/s		0	10
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	CONDWAT	S/m		0	66000
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	DENSITY	kg/m^3		1000	1100
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	PRACSAL	unitless		0	42
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	PRESWAT	Pa		0	58842000
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	TEMPWAT	degrees C		-2	40
GS	FLORD	GS05MOAS-GL001-01-FLORDM999	CHLAFLO	ug/L		0	50
GS	FLORD	GS05MOAS-GL001-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GS	DOSTA	GS05MOAS-GL001-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	CONDWAT	S/m		0	66000
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	PRACSAL	unitless		0	42
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	PRESWAT	Pa		0	58842000
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GS	FLORD	GS05MOAS-GL002-01-FLORDM999	CHLAFLO	ug/L		0	50
GS	FLORD	GS05MOAS-GL002-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GS	DOSTA	GS05MOAS-GL002-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	CONDWAT	S/m		0	66000
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	PRACSAL	unitless		0	42
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	PRESWAT	Pa		0	58842000
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	TEMPWAT	degrees C		-2	40
GS	FLORD	GS05MOAS-GL003-01-FLORDM999	CHLAFLO	ug/L		0	50
GS	FLORD	GS05MOAS-GL003-01-FLORDM999	FLUBSCT	1/m		0.00100000000000000002	10
GS	DOSTA	GS05MOAS-GL003-02-DOSTAM999	DOCONCS	uMol/l		0	9.59999999999999964
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	CONDWAT	S/m		0	66000
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	DENSITY	kg/m^3		1000	1100
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	PRACSAL	unitless		0	42
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	PRESWAT	Pa		0	58842000
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	TEMPWAT	degrees C		-2	40
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	CONDWAT	S/m		0	66000
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	PRACSAL	unitless		0	42
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	PRESWAT	Pa		0	58842000
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	TEMPWAT	degrees C		-2	40
RS	VEL3D	RS01SBVM-DP01A-02-VEL3DA103	VELPTTU	m/s		0	10
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	CDOMFLO	ppm		0	0.375
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	CHLAFLO	ug/L		0	50
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	FLUBSCT	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTCREF			\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTCSIG			\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTTEMP			\N	\N
RS	DOSTA	RS01SBVM-DP01A-06-DOSTAA104	DOCONCS	uMol/l		0	9.59999999999999964
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IES_HEF	Jm-2		0	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IES_WPP			\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESAHWV	m/s		0	10
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESHEAT	micro volt/cm		0	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESPRES	Pa		0	58842000
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESRATT	milliseconds		0	100
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	CONDWAT	S/m		0	66000
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	PRACSAL	unitless		0	42
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	PRESWAT	Pa		0	58842000
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	TEMPWAT	degrees C		-2	40
RS	DOSTA	RS01SBVM-LJ01A-06-DOSTAA101	DOCONCS	uMol/l		0	9.59999999999999964
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTCREF			\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTCSIG			\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTTEMP			\N	\N
RS	HYDBB	RS01SBVM-LJ01A-09-HYDBBA102	HYDACPR	micropascal		0	\N
RS	HYDBB	RS01SBVM-LJ01A-09-HYDBBA102	HYDFREQ	KHz		0	\N
RS	ADCPT	RS01SBVM-LJ01A-10-ADCPTA101	ECHOINT			\N	\N
RS	ADCPT	RS01SBVM-LJ01A-10-ADCPTA101	VELPROF	m/s		0	10
RS	VADCP	RS01SBVM-PC01A-05-VADCPA101	ECHOINT			\N	\N
RS	VADCP	RS01SBVM-PC01A-05-VADCPA101	VELTURB	m/s		0	10
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	CONDWAT	S/m		0	66000
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	PRACSAL	unitless		0	42
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	PRESWAT	Pa		0	58842000
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	TEMPWAT	degrees C		-2	40
RS	DOSTA	RS01SBVM-PC01A-06-DOSTAA103	DOCONCS	uMol/l		0	9.59999999999999964
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	ABSTHRM	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PH434SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PH578SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PHWATER	pH units		7.29999999999999982	8.5
RS	HYDBB	RS01SBVM-PC01A-09-HYDBBA103	HYDACPR	micropascal		0	\N
RS	HYDBB	RS01SBVM-PC01A-09-HYDBBA103	HYDFREQ	KHz		0	\N
RS	FLORD	RS01SBVM-PC01A-10-FLORDA103	CHLAFLO	ug/L		0	50
RS	FLORD	RS01SBVM-PC01A-10-FLORDA103	FLUBSCT	1/m		0.00100000000000000002	10
RS	CAMDS	RS01SBVM-PC01A-12-CAMDSA102	CAMSTIL	NA		\N	\N
RS	ADCPT	RS01SBVM-PC01A-13-ADCPTA102	ECHOINT			\N	\N
RS	ADCPT	RS01SBVM-PC01A-13-ADCPTA102	VELPROF	m/s		0	10
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2THRM	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	PCO2WAT	uM/ppm		100	600
RS	PARAD	RS01SBVM-SF01A-06-PARADA101	OPTPARW	micromol photons		0	19999
RS	SPKIR	RS01SBVM-SF01A-07-SPKIRA101	OPTATTS			\N	\N
RS	SPKIR	RS01SBVM-SF01A-07-SPKIRA101	SPECTIR	_W*cm^-2*nm^-1		0	300
RS	VEL3D	RS01SBVM-SF01A-08-VEL3DA102	VELPTTU	m/s		0	10
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	CONDWAT	S/m		0	66000
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	PRACSAL	unitless		0	42
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	PRESWAT	Pa		0	58842000
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	TEMPWAT	degrees C		-2	40
RS	DOFST	RS01SBVM-SF01A-09-DOFSTA102	DOCONCF	uMol/l		0	9.59999999999999964
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	CDOMFLO	ppm		0	0.375
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	CHLAFLO	ug/L		0	50
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	FLUBSCT	1/m		0.00100000000000000002	10
RS	NUTNR	RS01SBVM-SF01A-11-NUTNRA101	NITROPT	_M		0.5	2000
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	ABSTHRM	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PH434SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PH578SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PHWATER	pH units		7.29999999999999982	8.5
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTCREF			\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTCSIG			\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTTEMP			\N	\N
RS	HYDLF	RS01SLBS-MJ01A-05-HYDLFA101	HYDACPR	micropascal		0	\N
RS	OBSBB	RS01SLBS-MJ01A-05-OBSBBA101	GRNDACC	m/s^2		0	1000
RS	OBSBB	RS01SLBS-MJ01A-05-OBSBBA101	GRNDVEL	m/s		0	1000
RS	VEL3D	RS01SLBS-MJ01A-06-VEL3DA101	VELPTTU	m/s		0	10
RS	PREST	RS01SLBS-MJ01A-07-PRESTA101	SFLPRES	Pa		0	58842000
RS	HYDLF	RS01SUM1-LJ01B-05-HYDLFA104	HYDACPR	micropascal		0	\N
RS	OBSSP	RS01SUM1-LJ01B-06-OBSSPA102	SGRDVEL	bv		0	1000
RS	OBSSP	RS01SUM1-LJ01B-07-OBSSPA101	SGRDVEL	m/s		0	1000
RS	OBSSP	RS01SUM1-LJ01B-08-OBSSPA103	SGRDVEL	m/s		0	1000
RS	VEL3D	RS01SUM1-LJ01B-09-VEL3DA104	VELPTTU	m/s		0	10
RS	PREST	RS01SUM1-LJ01B-10-PRESTA102	SFLPRES	Pa		0	58842000
RS	FLOBN	RS01SUM2-MJ01B-00-FLOBNA101	BENTHFL	m/S^2/s		0	5
RS	OSMOI	RS01SUM2-MJ01B-00-OSMOIA101	PHSSAMP	NA		\N	\N
RS	ADCPS	RS01SUM2-MJ01B-05-ADCPSA101	ECHOINT			\N	\N
RS	ADCPS	RS01SUM2-MJ01B-05-ADCPSA101	VELPROF	m/s		0	10
RS	MASSP	RS01SUM2-MJ01B-07-MASSPA101	MASSPEC	Mass:charge		\N	\N
RS	CAMDS	RS01SUM2-MJ01B-08-CAMDSA103	CAMSTIL	NA		\N	\N
RS	CAMHD	RS03ASHS-ID03A-02-CAMHDA301	HDVIDEO	NA		\N	\N
RS	OSMOI	RS03ASHS-MJ03B-00-OSMOIA301	PHSSAMP	NA		\N	\N
RS	TMPSF	RS03ASHS-MJ03B-05-TMPSFA301	TEMPSFL	C		-2	500
RS	OBSSP	RS03ASHS-MJ03B-06-OBSSPA305	SGRDVEL	m/s		0	1000
RS	OBSSP	RS03ASHS-MJ03B-08-OBSSPA303	SGRDVEL	m/s		0	1000
RS	HYDLF	RS03AXBS-MJ03A-05-HYDLFA301	HYDACPR	micropascal		0	\N
RS	OBSBB	RS03AXBS-MJ03A-05-OBSBBA301	GRNDACC	m/s^2		0	1000
RS	OBSBB	RS03AXBS-MJ03A-05-OBSBBA301	GRNDVEL	m/s		0	1000
RS	VEL3D	RS03AXBS-MJ03A-06-VEL3DA301	VELPTTU	m/s		0	10
RS	PREST	RS03AXBS-MJ03A-07-PRESTA301	SFLPRES	Pa		0	58842000
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	CONDWAT	S/m		0	66000
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	PRACSAL	unitless		0	42
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	PRESWAT	Pa		0	58842000
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	TEMPWAT	degrees C		-2	40
RS	VEL3D	RS03AXVM-DP03A-02-VEL3DA303	VELPTTU	m/s		0	10
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	CDOMFLO	ppm		0	0.375
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	CHLAFLO	ug/L		0	50
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	FLUBSCT	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTCREF			\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTCSIG			\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTTEMP			\N	\N
RS	DOSTA	RS03AXVM-DP03A-06-DOSTAA304	DOCONCS	uMol/l		0	9.59999999999999964
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IES_HEF	Jm-2		\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IES_WPP			\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESAHWV	m/s		0	10
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESHEAT	micro volt/cm		\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESPRES	Pa		0	58842000
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESRATT	milliseconds		0	100
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	CONDWAT	S/m		0	66000
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	PRACSAL	unitless		0	42
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	PRESWAT	Pa		0	58842000
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	TEMPWAT	degrees C		-2	40
RS	DOSTA	RS03AXVM-LJ03A-06-DOSTAA301	DOCONCS	uMol/l		0	9.59999999999999964
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTCREF			\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTCSIG			\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTTEMP			\N	\N
RS	HYDBB	RS03AXVM-LJ03A-09-HYDBBA302	HYDACPR	micropascal		0	\N
RS	HYDBB	RS03AXVM-LJ03A-09-HYDBBA302	HYDFREQ	KHz		0	\N
RS	ADCPT	RS03AXVM-LJ03A-10-ADCPTA301	ECHOINT			\N	\N
RS	ADCPT	RS03AXVM-LJ03A-10-ADCPTA301	VELPROF	m/s		0	10
RS	VADCP	RS03AXVM-PC03A-05-VADCPA301	ECHOINT			\N	\N
RS	VADCP	RS03AXVM-PC03A-05-VADCPA301	VELTURB	m/s		0	10
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	CONDWAT	S/m		0	66000
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	PRACSAL	unitless		0	42
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	PRESWAT	Pa		0	58842000
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	TEMPWAT	degrees C		-2	40
RS	DOSTA	RS03AXVM-PC03A-06-DOSTAA303	DOCONCS	uMol/l		0	9.59999999999999964
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	ABSTHRM	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PH434SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PH578SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PHWATER	pH units		7.29999999999999982	8.5
RS	HYDBB	RS03AXVM-PC03A-09-HYDBBA303	HYDACPR	micropascal		0	\N
RS	HYDBB	RS03AXVM-PC03A-09-HYDBBA303	HYDFREQ	KHz		0	\N
RS	ADCPT	RS03AXVM-PC03A-10-ADCPTA302	ECHOINT			\N	\N
RS	ADCPT	RS03AXVM-PC03A-10-ADCPTA302	VELPROF	m/s		0	10
RS	FLORD	RS03AXVM-PC03A-10-FLORDA303	CHLAFLO	ug/L		0	50
RS	FLORD	RS03AXVM-PC03A-10-FLORDA303	FLUBSCT	1/m		0.00100000000000000002	10
RS	CAMDS	RS03AXVM-PC03A-12-CAMDSA302	CAMSTIL	NA		\N	\N
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2ABS1	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2ABS2	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2THRM	cm^2/mole		0.000100000000000000005	100000
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	PCO2WAT	uM/ppm		100	600
RS	PARAD	RS03AXVM-SF03A-06-PARADA301	OPTPARW	micromol photons		0	19999
RS	SPKIR	RS03AXVM-SF03A-07-SPKIRA301	OPTATTS			\N	\N
RS	SPKIR	RS03AXVM-SF03A-07-SPKIRA301	SPECTIR	_W*cm^-2*nm^-1		0	300
RS	VEL3D	RS03AXVM-SF03A-08-VEL3DA302	VELPTTU	m/s		0	10
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	CONDWAT	S/m		0	66000
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	DENSITY	kg/m^3		1000	1100
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	PRACSAL	unitless		0	42
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	PRESWAT	Pa		0	58842000
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	TEMPWAT	degrees C		-2	40
RS	DOFST	RS03AXVM-SF03A-09-DOFSTA302	DOCONCF	uMol/l		0	9.59999999999999964
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	CDOMFLO	ppm		0	0.375
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	CHLAFLO	ug/L		0	50
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	FLUBSCT	1/m		0.00100000000000000002	10
RS	NUTNR	RS03AXVM-SF03A-11-NUTNRA301	NITROPT	_M		0.5	2000
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	ABSTHRM	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PH434SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PH578SI	1/m		0.00100000000000000002	10
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PHWATER	pH units		7.29999999999999982	8.5
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTABSN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTATTN	1/m		0.00100000000000000002	10
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTCREF			\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTCSIG			\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTTEMP			\N	\N
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTPRES	nanoPascal		0	0.0588419999999999985
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTSFLU	NA		\N	\N
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTTILT	degree		0	360
RS	HYDLF	RS03CCAL-MJ03F-06-HYDLFA305	HYDACPR	micropascal		0	\N
RS	OBSBB	RS03CCAL-MJ03F-06-OBSBBA302	GRNDACC	m/s^2		0	1000
RS	OBSBB	RS03CCAL-MJ03F-06-OBSBBA302	GRNDVEL	m/s		0	1000
RS	HYDLF	RS03ECAL-MJ03E-05-HYDLFA304	HYDACPR	micropascal		0	\N
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTPRES	nanoPascal		0	0.0588419999999999985
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTSFLU	NA		\N	\N
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTTILT	degree		0	360
RS	OBSSP	RS03ECAL-MJ03E-07-OBSSPA304	SGRDVEL	m/s		0	1000
RS	OBSSP	RS03ECAL-MJ03E-08-OBSSPA301	SGRDVEL	m/s		0	1000
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHHC	V; Moles/kg		0	1
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHHS	V; Moles/kg		0	1
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHPH	V; pH units		4	9
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHTE	V; degrees C		-2	500
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHCC	_M		0	210
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHEH	mV		0	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR1			\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR2			\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR3			\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHTE	degree C		-2	500
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVC			\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVO			\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVS			\N	\N
RS	OBSSP	RS03INT2-MJ03D-05-OBSSPA302	SGRDVEL	m/s		0	1000
RS	VEL3D	RS03INT2-MJ03D-06-VEL3DA304	VELPTTU	m/s		0	10
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTPRES	nanoPascal		0	0.0588419999999999985
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTSFLU	NA		\N	\N
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTTILT	degree		0	360
RS	CAMDS	RS03INT2-MJ03D-08-CAMDSA303	CAMSTIL	NA		\N	\N
RS	MASSP	RS03INT2-MJ03D-09-MASSPA301	MASSPEC	mass:charge		\N	\N
RS	PPSDN	RS03INT2-MJ03D-10-PPSDNA301	DNASAMP	NA		\N	\N
RS	RASFL	RS03INT2-MJ03D-10-RASFLA301	PHSSAMP	NA		\N	\N
RS	RASFL	RS03INT2-MJ03D-10-RASFLA301	TEMPVNT	degree C		-2	500
\.


--
-- Data for Name: instrumentagentinstances; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY instrumentagentinstances (scenario, id, owner_id, org_ids, instrument_agent_id, instrument_device_id, name, description, comms_device_address, comms_device_port, comms_server_address, comms_server_port, comms_server_cmd_port, alerts, startup_config, comment) FROM stdin;
R2_DEMO_X	IAI3	USER_1	MF_3	IA2	ID3	CTD Simulator 1 Demo Agent Instance		sbe37-simulator.oceanobservatories.org	4001	localhost	8890	9000			
R2_DEMO	IAI3	USER_1	MF_3	IA2	ID3	CTD Simulator 1 Demo Agent Instance		sbe37-simulator.oceanobservatories.org	4008	localhost	8890	9000	A_TEMP, A_LATE		
ALPHA_SYS	IA14	USER_1	MF_3	IA2	ID13	CTD Simulator Alpha Agent Instance		sbe37-simulator.oceanobservatories.org	4001	rsn-port-agent-test.oceanobservatories.org	13000	12000	A_LATE		
BETA_SYS	IAI5	USER_1	MF_3	IA2	ID14	CTD Simulator Beta Agent Instance		sbe37-simulator.oceanobservatories.org	4001	rsn-port-agent-test.oceanobservatories.org	13002	12002	A_LATE		
R2_DEMO	IAI4	USER_1	MF_3	IA2	ID4	CTD Simulator 2 Demo Agent Instance		sbe37-simulator.oceanobservatories.org	4002	localhost	8888	9001			
R2_DEMO	IAI5	USER_1	MF_3	IA2	EEInstrumentDevice	CTD Agent Instance for end to end R2 test		sbe37-simulator.oceanobservatories.org	4001	localhost	8886	9002			
DEVS	IAI6	USER_1	MF_3	IA3	ID5	PARAD 	PAR-SER-600m	10.180.80.179	2101	rsn-port-agent-test.oceanobservatories.org	13009	12009			
PRESF	IAI7	USER_1	MF_3	IA4	ID6	PRESF 	SeaBird 26plus Pressure Sensor	10.180.80.185	2101	rsn-port-agent-test.oceanobservatories.org	13005	12005	A_LATE		
CTDBP	IAI8	USER_1	MF_3	IA5	ID7	CTDBP	SBE16plusV2 CTD	ciports1-4.whoi.edu	2104	rsn-port-agent-test.oceanobservatories.org	13007	12007	A_LATE		
DEVS	IAI9	USER_1	MF_3	IA6	ID8	TRHPH	Temperature and Resistivity Probe	10.180.80.172	2101	rsn-port-agent-test.oceanobservatories.org	13008	12008			
PREST	IAI10	USER_1	MF_3	IA7	ID9	PREST	SBE 54 Tsunami Pressure Sensor	10.180.80.170	2101	rsn-port-agent-test.oceanobservatories.org	13012	12012	A_LATE		scheduler.configuration_data: {},scheduler.status_data: {},scheduler.acquire_status: {},scheduler.hardware_data: {},scheduler.event_counter: {},scheduler.clock_sync: {},parameters.enablealerts: 1,parameters.enablealerts.batterytype: 1,parameters.enablealerts.batterytype.sampleperiod: 15
DEVS	IAI11	USER_1	MF_3	IA8	ID10	VELPT	Aquadopp Current Meters	ciports1-4.whoi.edu	2103	rsn-port-agent-test.oceanobservatories.org	13010	12010			
DEVS	IAI12	USER_1	MF_3	IA9	ID11	NUTNR	Satlantic ISUS V3 Nitrate Sensor	69.196.56.182	4002	rsn-port-agent-test.oceanobservatories.org	13011	12011			
BETA	IAI13	USER_1	MF_3	IA2	ID12	SBE37SMP Agent Instance		69.196.56.182	4001	rsn-port-agent-test.oceanobservatories.org	13013	12013	A_LATE		
IDK	IDK_AGENT_INSTANCE	IDK_USER	IDK_ORG	UNKNOWN	IDK_DEVICE	IDK Agent Instance		UNKNOWN	UNKNOWN	localhost	UNKNOWN	UNKNOWN			
NOSE	IAI1N		MF_TEST	IA1N	ID_TEST	Test InstrumentAgentInstance	For preload nosetest		11		22	33	NOSE_ALARM, NOSE_ALARM2	PARAMETERS.TXWAVESTATS: False, PARAMETERS.TXREALTIME: True, PARAMETERS.TXWAVEBURST: false, SCHEDULER.ACQUIRE_STATUS: {}, SCHEDULER.CLOCK_SYNC: 48.2, SCHEDULER.VERSION.number: 3.0	
TMPSF	IAI14	USER_1	MF_3	IA11	ID15	TMPSF Agent Instance	TMPSF Instrument Agent Instance	10.180.80.169	2101	rsn-port-agent-test.oceanobservatories.org	13014	12014			
VEL3D_B	IAI15	USER_1	MF_3	IA12	ID16	vel3d_b Agent Instance	VEL3D Instrument Agent Instance	ciports5-8.whoi.edu	2108	rsn-port-agent-test.oceanobservatories.org	13015	12015			
LC_TEST	IAI16	USER_1	MF_3	IA13	ID17	LC Test Simulator Demo Agent Instance		sbe37-simulator.oceanobservatories.org	4003	localhost	8889	9002			
\.


--
-- Data for Name: instrumentagents; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY instrumentagents (scenario, id, owner_id, lcstate, org_ids, instrument_model_ids, name, description, agent_version, driver_uri, driver_module, driver_class, stream_configurations) FROM stdin;
BETA	IA2	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	SBE37SMP Instrument Agent	Seabird 37 CTD Instrument Agent	0.1	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe37smb_ooicore-0.1.1-py2.7.egg			SC1,SC2
DEVS	IA3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM4	PARAD Instrument Agent		0.1		mi.instrument.satlantic.par_ser_600m.ooicore.driver	InstrumentDriver	SC1,SC3
PRESF	IA4	USER_1	DEPLOYED_AVAILABLE	MF_3	IM5	PRESF Instrument Agent	SBE 26plus	0.7	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe26plus_ooicore-0.0.7-py2.7.egg			SC1,SC4,SC10,SC11,SC65,SC66
CTDBP	IA5	USER_1	DEPLOYED_AVAILABLE	MF_3	IM6	CTDBP Instrument Agent	CTD for SBE16plusV2 Strain Gauge, no external instruments	0.5	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe16plus_v2_ooicore-0.0.5-py2.7.egg	mi.instrument.seabird.sbe16plus_v2.ooicore.driver	InstrumentDriver	SC1,SC13,SC14,SC15
PREST	IA7	USER_1	DEPLOYED_AVAILABLE	MF_3	IM8	PREST Instrument Agent	SBE 54 Tsunami Pressure Sensor	0.4	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe54tps_ooicore-0.0.4-py2.7.egg	mi.instrument.seabird.sbe54tps.ooicore.driver	InstrumentDriver	SC1,SC27,SC28,SC29,SC30,SC31,SC32
DEVS	IA8	USER_1	DEPLOYED_AVAILABLE	MF_3	IM9	VELPT Instrument Agent	Aquadopp Current Meters	0.1		mi.instrument.nortek.aquadopp.ooicore.driver	InstrumentDriver	SC1,SC7
DEVS	IA6	USER_1	DEPLOYED_AVAILABLE	MF_3	IM7	TRHPH Instrument Agent	Temperature and Resistivity Probe	0.1		mi.instrument.uw.bars.ooicore.driver	ooicoreInstrumentDriver	SC1,SC5
DEVS	IA9	USER_1	DEPLOYED_AVAILABLE	MF_3	IM10	NUTNR Instrument Agent	Satlantic ISUS V3 Nitrate Sensor	0.1		mi.instrument.satlantic.isusv3.ooicore.driver	InstrumentDriver	SC1,SC8
XXX	IDK_AGENT	IDK_USER	DEPLOYED_AVAILABLE	IDK_ORG	IDK_MODEL	IDK Agent	Placeholder definition for IDK definition of instrument driver	0.1		UNKNOWN	InstrumentDriver	IDK_SC_RAW,IDK_SC_PARSED
xxx	xxx	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	SBE37SMP Instrument Omelette	Seabird 37 CTD Instrument Agent	0.2	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe37smb_ooicore-0.0.2-py2.7.egg	mi.instrument.seabird.sbe37smb.ooicore.driver	SBE37Driver	SC1,SC2
NOSE	IA1N	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	Test instrumentAgent	For nose tests	0.5	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe37smb_ooicore-0.0.5-py2.7.egg			SC1,SC2
TMPSF	IA11	USER_1	DEPLOYED_AVAILABLE	MF_3	IM11	TMPSF agent	TMPSF	0.2	http://sddevrepo.oceanobservatories.org/releases/rbr_xr_420_thermistor_24_ooicore-0.0.2-py2.7.egg			SC1,SC81,SC82
VEL3D_B	IA12	USER_1	DEPLOYED_AVAILABLE	MF_3	IM12	VEL3D_B agent	VEL3D	0.1	WAITING FOR STEVE			SC1,SC25,SC26
LC_TEST	IA13	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	SBE37SMP Instrument Agent	Seabird 37 CTD Instrument Agent	0.1	http://sddevrepo.oceanobservatories.org/releases/seabird_sbe37smb_ooicore-0.1.0-py2.7.egg			SC83
\.


--
-- Data for Name: instrumentdevices; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY instrumentdevices (scenario, id, confluence, owner_id, lcstate, org_ids, instrument_model_id, platform_device_id, contact_ids, name, description, serial_number, firmware_version, hardware_version, controllable, monitorable, message_controllable, reference_urls) FROM stdin;
R2_DEMO	ID3		USER_1	DEVELOPED_AVAILABLE	MF_3	IM2	PDEV3	M_MANAGER,O_OWNERREP	CTD Simulator 1 Demo	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	
ALPHA_SYS	ID13		USER_1	DEVELOPED_AVAILABLE	MF_3	IM2	PDEV3	M_MANAGER,O_OWNERREP	CTD Simulator for Alpha	Simulator providing CTD data in the Alpha System	10003	0-00	0-00	TRUE	TRUE	TRUE	
BETA_SYS	ID14		USER_1	DEVELOPED_AVAILABLE	MF_3	IM2	PDEV3	M_MANAGER,O_OWNERREP	CTD Simulator for Beta	Simulator providing CTD data in the Beta System	10003	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	ID4		USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	PDEV4	M_MANAGER,O_OWNERREP	CTD Simulator 2 Demo	Simulator 2 replacement for 1 providing CTD data in the R2 Demonstration	10004	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	D1InstrumentDevice1	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	D1PlatformDevice1	T_AMPE,J_ORCUTT	CTD Simulator 1 for deployment1	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	D1InstrumentDevice2	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	D1PlatformDevice1	T_AMPE,J_ORCUTT	CTD Simulator 2 for deployment1	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	D2InstrumentDevice3	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2		T_AMPE,J_ORCUTT	CTD Simulator for deployment 2	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	D3InstrumentDevice4	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2		T_AMPE,J_ORCUTT	CTD Simulator for deployment 3	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	
R2_DEMO	MANUAL					IM2		T_AMPE,J_ORCUTT	Seabird CTD for Demo	Seabird Conductivity-Temperature-Depth instrument used for demonstration	tbd	tbd	tbd	TRUE	TRUE	TRUE	
R2_DEMO	EEInstrumentDevice	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	EEPlatformDevice1	T_AMPE,J_ORCUTT	CTD Simulator end to end R2 testing	Simulator 1 providing CTD data in the R2 Demonstration	10003	0-00	0-00	TRUE	TRUE	TRUE	http://www.yahoo.com
DEVS	ID5		USER_1	DEPLOYED_AVAILABLE	MF_3	IM4		M_MANAGER,O_OWNERREP	PARAD	PAR-SER-600M	10003	0-00	0-00	TRUE	TRUE	TRUE	
PRESF	ID6		USER_1	DEVELOPED_AVAILABLE	MF_3	IM5		M_MANAGER,O_OWNERREP	PRESF	SeaBird 26plus 	10003	0-00	0-00	TRUE	TRUE	TRUE	
CTDBP	ID7		USER_1	DEVELOPED_AVAILABLE	MF_3	IM6		M_MANAGER,O_OWNERREP	CTDBP	SBE 16plusV2	10003	0-00	0-00	TRUE	TRUE	TRUE	
DEVS	ID8		USER_1	DEPLOYED_AVAILABLE	MF_3	IM7		M_MANAGER,O_OWNERREP	TRHPH	Temperature and Resistivity Probe	10003	0-00	0-00	TRUE	TRUE	TRUE	
PREST	ID9		USER_1	DEVELOPED_AVAILABLE	MF_3	IM8		M_MANAGER,O_OWNERREP	PREST	SBE 54 Tsunami Pressure Sensor	10003	0-00	0-00	TRUE	TRUE	TRUE	
DEVS	ID10		USER_1	DEPLOYED_AVAILABLE	MF_3	IM9		M_MANAGER,O_OWNERREP	VELPT	Aquadopp Current Meters	10003	0-00	0-00	TRUE	TRUE	TRUE	
DEVS	ID11		USER_1	DEPLOYED_AVAILABLE	MF_3	IM10		M_MANAGER,O_OWNERREP	NUTNR	Satlantic ISUS V3 Nitrate Sensor	10003	0-00	0-00	TRUE	TRUE	TRUE	
BETA	ID12		USER_1	DEVELOPED_AVAILABLE	MF_3	IM2	PDEV3	M_MANAGER,O_OWNERREP	SBE37SMP	SeaBird 37 SMP CTD for R2 Beta Testing	10003	0-00	0-00	TRUE	TRUE	TRUE	
NOSE	ID_TEST		USER_1	DEPLOYED_AVAILABLE	MF_TEST	IM2	PDEV3	TEST_USER,O_OWNERREP	Unit Test SMB37	SeaBird 37 SMP CTD for code unit tests	10003	0-00	0-00	TRUE	TRUE	TRUE	
IDK	IDK_DEVICE		IDK_USER	DEPLOYED_AVAILABLE	IDK_ORG	IDK_MODEL	IDK_PD	IDK_USER1,IDK_USER2	IDK Test Device	Device currently under IDK testing and driver development	10003	0-00	0-00	TRUE	TRUE	TRUE	
TMPSF	ID15		USER_1	DEVELOPED_AVAILABLE	MF_3	IM11		M_MANAGER,O_OWNERREP	TMPSF	Sample TMPSF device	10003	0-00	0-00	TRUE	TRUE	TRUE	
VEL3D_B	ID16		USER_1	DEVELOPED_AVAILABLE	MF_3	IM12		M_MANAGER,O_OWNERREP	TMPSF	Sample VEL3D_B device	10003	0-00	0-00	TRUE	TRUE	TRUE	
LC_TEST	ID17		USER_1	DEPLOYED_AVAILABLE	MF_3	IM2	PDEV4	M_MANAGER,O_OWNERREP	LC Test Simulator	LC TEST Simulator	10004	0-00	0-00	TRUE	TRUE	TRUE	
\.


--
-- Data for Name: instrumentmodels; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY instrumentmodels (scenario, id, owner_id, org_ids, name, description, reference_urls, instrument_family, instrument_classes_supported, primary_interface, baud_rate_default, manufacturer, manufacturer_url, mixed_sampling_mode, internal_data_storage, integrated_inductive_modem_available, internal_battery, clock_max_drift, operational_depth_maximum, survival_depth_maximum, hotel_current, electrical_notes, power_source, clock_notes, power_supply_voltage_minimum, power_supply_voltage_maximum, weight, voltage, wattage, height, length, width, required_on_time) FROM stdin;
BETA	IM2	USER_1	MF_3	SBE 37-SMP MicroCAT CTD Model Demo	A Sea-bird conductivity and temperature (pressure optional) recorder (CTD) model designed for moorings or other long duration, fixed-site deployments.	http://www.seabird.com/pdf_documents/manuals/37SMP_RS232_016.pdf,http://www.seabird.com/products/spec_sheets/37smpdata.htm	CTD	["CTDBP"]	RS232	9600	Sea-bird Electronics, Inc.	http://www.seabird.com	t	t	t	t	0	0	0	None	None	None	None									TRUE
DEVS	IM3	USER_1	MF_3	SBE 38 Model Incremental	Different model testing incremental preload	http://www.seabird.com/pdf_documents/manuals/37SMP_RS232_016.pdf,http://www.seabird.com/products/spec_sheets/37smpdata.htm	CTD	["CTDBP"]	RS232	9600	Sea-bird Electronics, Inc.	http://www.seabird.com	t	t	t	t	0	0	0	None	None	None	None									TRUE
DEVS	IM4	USER_1	MF_3	PAR-SER-600M	Passively Measures Photosynthetically Active Radiation (400-700 nm)		Optical Properties	["PARAD"]	RS232	9600	Satlantic	http://www.satlantic.com/	t	t	t	t	0	0	0	None	None	None	None									TRUE
PRESF	IM5	USER_1	MF_3	SeaBird 26plus 	Seafloor Pressure instrument for Coastal Arrays			["PRESF"]	RS232	9600	Sea-bird Electronics, Inc.	http://www.seabird.com	t	t	t	t	0	0	0	None	None	None	None									TRUE
CTDBP	IM6	USER_1	MF_3	SBE 16plusV2	A Sea-bird conductivity and temperature (pressure optional) recorder (CTD) model designed for moorings or other long duration, fixed-site deployments.		CTD	["CTDBP"]	RS232	9600	Sea-bird Electronics, Inc.	http://www.seabird.com	t	t	t	t	0	0	0	None	None	None	None									TRUE
DEVS	IM7	USER_1	MF_3	Temperature and Resistivity Probe	Measures temperature and resistivity in high temperature vent fluids as proxy for chloride concentration (with options for Eh and Hydrogen)		Seafloor Properties	["TRHPH"]	RS232	9600	Marv Lilley Lab	http://www.ocean.washington.edu/home/Marvin+Lilley	t	t	t	t	0	0	0	None	None	None	None									TRUE
PREST	IM8	USER_1	MF_3	SBE 54 Tsunami Pressure Sensor	Measures ambient seafloor pressure using internal Paroscientific Digiquartz® transducer		PRS	["PREST"]	RS232	9600	Sea-bird Electronics, Inc.	http://www.seabird.com	t	t	t	t	0	0	0	None	None	None	None									TRUE
DEVS	IM9	USER_1	MF_3	Aquadopp Current Meters	Single Point Mean Velocity Meter		CTD	["VELPT"]	RS232	9600	Nortek		t	t	t	t	0	0	0	None	None	None	None									TRUE
DEVS	IM10	USER_1	MF_3	Satlantic ISUS V3 Nitrate Sensor	nitrate sensor		CTD	["NUTNR"]	RS232	9600	Satlantic	http://www.satlantic.com/	t	t	t	t	0	0	0	None	None	None	None									TRUE
IDK	IDK_MODEL	IDK_USER	IDK_ORG	IDK Development Device	Model of device used by IDK		CTD	["CTDBP"]	RS232	9600	Internal Dispute Kangaroos	http://confluence.oceanobservatories.org	t	t	t	t	0	0	0	None	None	None	None									TRUE
TMPSF	IM11	USER_1	MF_3	RBR XR-420	XR-420 Custom Thermistor String (24 thermistors)		TMPSF	["TMPSF"]	RS232	9600	RBR Global	http://www.rbr-global.com/	t	t	t	t	0	0	0	None	None	None	None									TRUE
VEL3D_B	IM12	USER_1	MF_3	MAVS-4	Velocity Point 3D Turbulence		VEL3D	["VEL3D"]	RS232	9600	Nobska	http://www.nobska.net	t	t	t	t	0	0	0	None	None	None	None									
\.


--
-- Data for Name: instrumentsites; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY instrumentsites (scenario, id, confluence, owner_id, org_ids, parent_site_id, instrument_model_ids, name, description, constraint_ids, coordinate_system) FROM stdin;
R2_DEMO	LOGINS3		USER_1	MF_3	LP3	IM2	Instrument site 1 Demonstration	First simulator of CTD site	GEO1,TEMP1	SUBMERGED
BETA	LOGINS4		USER_1	MF_3	LP3	IM2	Instrument site 2 Demonstration	SBE37SMP CTD Instrument site	GEO1,TEMP1	SUBMERGED
R2_DEMO	D1PlatformSite1Instrument1	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	MF_3	D1PlatformSite1	IM2	Instrument site 1 for test deployment 1	Second simulator of CTD site	GEO1,TEMP1	SUBMERGED
R2_DEMO	D1PlatformSite1Instrument2	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	MF_3	D1PlatformSite1	IM2	Instrument site 2 for test deployment 1	Second simulator of CTD site	GEO1,TEMP1	SUBMERGED
R2_DEMO	D2InstrumentSite1	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	MF_3		IM2	Instrument site for test deployment 2	Second simulator of CTD site	GEO1,TEMP1	SUBMERGED
R2_DEMO	D3InstrumentSite1	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	MF_3		IM2	Instrument site for test deployment 3	Second simulator of CTD site	GEO1,TEMP1	SUBMERGED
R2_DEMO	EEInstrumentSite	https://confluence.oceanobservatories.org/display/CIDev/Preload+Data+for+Deployments+1-3	USER_1	MF_3	EEPlatformSite	IM2	Instrument site for R2 end to end tests	Second simulator of CTD site	GEO1,TEMP1	SUBMERGED
R2_DEMO	LOGINS5		USER_1	MF_3	LP3	IM2	Instrument site 5 Demo	Site for SBE37SMP CTD	GEO1,TEMP1	SUBMERGED
NOSE	IS_TEST		USER_1	MF_TEST	LP3	IM2	Test Instrument Site	First simulator of CTD site	GEO1,TEMP1	SUBMERGED
ALPHA_SYS	LOGINS6		USER_1	MF_3	LP3	IM2	Instrument site for Simulator on Alpha System	ALPHA simulator CTD Instrument site	GEO1,TEMP1	SUBMERGED
BETA_SYS	LOGINS7		USER_1	MF_3	LP3	IM2	Instrument site for Simulator on Beta System	BETA simulator CTD Instrument site	GEO1,TEMP1	SUBMERGED
IDK	IDK_SITE		IDK_USER	IDK_ORG	IDK_PS	IDK_MODEL	Instrument site for IDK	Instrument site for IDK	GEO_IDK,TEMP_IDK	SUBMERGED1
PRESF	LOGINS8		USER_1	MF_3	LP3	IM5	Instrument site for PRESF	PRESF Instrument site	GEO_WHOI2,TEMP1	SUBMERGED
PREST	LOGINS9		USER_1	MF_3	LP3	IM8	Instrument site for PREST	PREST Instrument site	GEO_UW,TEMP1	SUBMERGED
CTDBP	LOGINS10		USER_1	MF_3	LP3	IM6	Instrument site for CTDBP	CTDBP Instrument site	GEO_WHOI2,TEMP1	SUBMERGED
TMPSF	LOGINS11		USER_1	MF_3	LP3	IM11	Instrument site for TMPSF	TMPSF instrument site	GEO_WHOI2,TEMP1	SUBMERGED
VEL3D_B	LOGINS12		USER_1	MF_3	LP3	IM12	Instrument site for VEL3D_B	vel3d instrument site	GEO_WHOI2,TEMP1	SUBMERGED
\.


--
-- Data for Name: parametercontexts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY parametercontexts (scenario, confluence, name, id, parameter_type, value_encoding, code_set, uom, fill_value, parameter_function_id, pmap, lookup_value, qc_functions, data_product) FROM stdin;
BASE		conductivity	1	quantity	float32		S m-1	-9999	\N			{"PFID17":"GA03FLMA-RI001-15-CTDMOH999"}	CONDWAT_L1
BASE		pressure	2	quantity	float32		dbar	-9999	\N			{"PFID17":"GP02HYPM-SP001-04-CTDPF0999"}	PRESWAT_L1
BASE		salinity	3	quantity	float32		1	-9999	\N			{"PFID17":"GP03FLMB-RI001-10-CTDMOG999"}	PRACSAL_L2
CW_TEST		salinity	4	quantity	float32		g kg-1	-9999	\N				
BASE		density	5	quantity	float32		kg m-3	-9999	\N			{"PFID17":"GA05MOAS-GL001-04-CTDGVM999"}	DENSITY_L2
BASE		temp	6	quantity	float32		deg_C	-9999	\N			["TEMPWAT", "reference_designator"]	TEMPWAT_L1
BASE		time	7	quantity	float64		seconds since 1900-01-01	-9999	\N				
BASE		lat	8	quantity	float32		degree_north	-9999	\N				
BASE		lon	9	quantity	float32		degree_east	-9999	\N				
BASE		port_timestamp	10	quantity	float64		seconds since 1900-01-01	-9999	\N				
BASE		driver_timestamp	11	quantity	float64		seconds since 1900-01-01	-9999	\N				
BASE		internal_timestamp	12	quantity	float64		seconds since 1900-01-01	-9999	\N				
BASE		serial_num	13	array<quantity>	int32		1	-9999	\N				
BASE		counts	14	quantity	uint64		counts	0	\N				
BASE	PARAD	checksum	15	quantity	int32		1	-9999	\N				
BASE		preferred_timestamp	16	category<int8:str>	int8	{0:"port_timestamp", 1:"driver_timestamp", 2:"internal_timestamp", 3:"time", -99:"empty"}	1	-99	\N				
BASE		quality_flag	17	array<>					\N				
BASE		viz_timestamp	18	quantity	float64		seconds since 1900-01-01	-9999	\N				
BASE		viz_product_type	19	array<>					\N				
BASE		image_obj	20	array<>					\N				
BASE		image_name	21	array<>					\N				
BASE		content_type	22	array<>					\N				
BASE		google_dt_components	23	record<>					\N				
BASE		mpl_graph	24	record<>					\N				
BASE		dummy	25	quantity	int64			0	\N				
BASE		raw	26	array<quantity>	opaque		1		\N				
BASE		input_voltage	27	quantity	float64		volts	-1	\N				
BASE	PARAD	elapsed_time	28	quantity	float64		s	-1	\N				
BASE		pressure_temp	29	quantity	float32		deg_C	-9999	\N				
TEST		sample_param	30	quantity	uint16		shouldnt work 	-1	\N				
KAREN_IN_PROGRESS		condwat_glblrng_qc	31	boolean	int8		1	-9	\N				CONDWAT_GLBLRNG_QC
KAREN_IN_PROGRESS		condwat_loclrng_qc	32	boolean	int8		1	-9	\N				CONDWAT_LOCLRNG_QC
KAREN_IN_PROGRESS		condwat_spketst_qc	33	boolean	int8		1	-9	\N				CONDWAT_SPKETST_QC
KAREN_IN_PROGRESS		condwat_stuckvl_qc	34	boolean	int8		1	-9	\N				CONDWAT_STUCKVL_QC
KAREN_IN_PROGRESS		condwat_sptl_gradtst_qc	35	boolean	int8		1	-9	\N				CONDWAT_SPTL_GRADTST_QC
KAREN_IN_PROGRESS		condwat_tmpl_gradtst_qc	36	boolean	int8		1	-9	\N				CONDWAT_TMPL_GRADTST_QC
KAREN_IN_PROGRESS		preswat_glblrng_qc	37	boolean	int8		1	-9	\N				PRESWAT_GLBLRNG_QC
KAREN_IN_PROGRESS		preswat_loclrng_qc	38	boolean	int8		1	-9	\N				PRESWAT_LOCLRNG_QC
KAREN_IN_PROGRESS		preswat_spketst_qc	39	boolean	int8		1	-9	\N				PRESWAT_SPKETST_QC
KAREN_IN_PROGRESS		preswat_stuckvl_qc	40	boolean	int8		1	-9	\N				PRESWAT_STUCKVL_QC
KAREN_IN_PROGRESS		preswat_sptl_gradtst_qc	41	boolean	int8		1	-9	\N				PRESWAT_SPTL_GRADTST_QC
KAREN_IN_PROGRESS		preswat_tmpl_gradtst_qc	42	boolean	int8		1	-9	\N				PRESWAT_TMPL_GRADTST_QC
KAREN_IN_PROGRESS		tempwat_glblrng_qc	43	boolean	int8		1	-9	\N				TEMPWAT_GLBLRNG_QC
KAREN_IN_PROGRESS		tempwat_loclrng_qc	44	boolean	int8		1	-9	\N				TEMPWAT_LOCLRNG_QC
KAREN_IN_PROGRESS		tempwat_spketst_qc	45	boolean	int8		1	-9	\N				TEMPWAT_SPKETST_QC
KAREN_IN_PROGRESS		tempwat_stuckvl_qc	46	boolean	int8		1	-9	\N				TEMPWAT_STUCKVL_QC
KAREN_IN_PROGRESS		tempwat_sptl_gradtst_qc	47	boolean	int8		1	-9	\N				TEMPWAT_SPTL_GRADTST_QC
KAREN_IN_PROGRESS		tempwat_tmpl_gradtst_qc	48	boolean	int8		1	-9	\N				TEMPWAT_TMPL_GRADTST_QC
KAREN_IN_PROGRESS		pracsal_glblrng_qc	49	boolean	int8		1	-9	\N				PRACSAL_GLBLRNG_QC
KAREN_IN_PROGRESS		pracsal_loclrng_qc	50	boolean	int8		1	-9	\N				PRACSAL_LOCLRNG_QC
KAREN_IN_PROGRESS		pracsal_spketst_qc	51	boolean	int8		1	-9	\N				PRACSAL_SPKETST_QC
KAREN_IN_PROGRESS		pracsal_stuckvl_qc	52	boolean	int8		1	-9	\N				PRACSAL_STUCKVL_QC
KAREN_IN_PROGRESS		pracsal_sptl_gradtst_qc	53	boolean	int8		1	-9	\N				PRACSAL_SPTL_GRADTST_QC
KAREN_IN_PROGRESS		pracsal_tmpl_gradtst_qc	54	boolean	int8		1	-9	\N				PRACSAL_TMPL_GRADTST_QC
KAREN_IN_PROGRESS		density_glblrng_qc	55	boolean	int8		1	-9	\N				DENSITY_GLBLRNG_QC
KAREN_IN_PROGRESS		density_loclrng_qc	56	boolean	int8		1	-9	\N				DENSITY_LOCLRNG_QC
KAREN_IN_PROGRESS		density_spketst_qc	57	boolean	int8		1	-9	\N				DENSITY_SPKETST_QC
KAREN_IN_PROGRESS		density_stuckvl_qc	58	boolean	int8		1	-9	\N				DENSITY_STUCKVL_QC
KAREN_IN_PROGRESS		density_sptl_gradtst_qc	59	boolean	int8		1	-9	\N				DENSITY_SPTL_GRADTST_QC
KAREN_IN_PROGRESS		density_tmpl_gradtst_qc	60	boolean	int8		1	-9	\N				DENSITY_TMPL_GRADTST_QC
BETA		sample_number	73	quantity	int32		count	-9999	\N				
BETA		sample_type	74	array<quantity>	str		1	empty	\N				
BF_DEMO		InstTime	75	array<quantity>	str		1	empty	\N				
BF_DEMO		timestamp	77	array<quantity>	str		1	empty	\N				
BF_DEMO		error	78	quantity	int32		C	-9999	\N				
BF_DEMO		analog1	79	quantity	int32		C	-9999	\N				
BF_DEMO		battery_voltage	80	quantity	int32		C	-9999	\N				
BF_DEMO		sound_speed_analog2	81	quantity	int32		C	-9999	\N				
BF_DEMO		heading	82	quantity	int32		degrees	-9999	\N				
BF_DEMO		pitch	83	quantity	int32		degrees	-9999	\N				
BF_DEMO		roll	84	quantity	int32		degrees	-9999	\N				
BF_DEMO		status	85	array<quantity>	int8			-9999	\N				
BF_DEMO		temperature	86	quantity	int32		deg_C	-9999	\N				
BF_DEMO		velocity_beam1	87	quantity	int32		C	-9999	\N				
BF_DEMO		velocity_beam2	88	quantity	int32		C	-9999	\N				
BF_DEMO		velocity_beam3	89	quantity	int32		C	-9999	\N				
BF_DEMO		amplitude_beam1	90	quantity	int32		counts	-9999	\N				
BF_DEMO		amplitude_beam2	91	quantity	int32		counts	-9999	\N				
BF_DEMO		amplitude_beam3	92	quantity	int32		counts	-9999	\N				
BETA	PRESF	date_time_string	93	array<quantity>	str		1	empty	\N				
BETA	PRESF	absolute_pressure	94	quantity	float32		psi	-9999	\N				SFLPRES_L0
BETA	PRESF	seawater_temperature	742	quantity	float32		deg_C	-9999	\N				
BETA	PRESF	seafloor_pressure	95	quantity	float32		dbar	-9999	\N			{"PFID17":"CP03ISSM-MF005-02-PRESFB999"}	SFLPRES_L1
BETA	PRESF	ptemp_frequency	96	quantity	float32		Hz	-9999	\N				
BETA	PRESF	n_avg_band	97	quantity	int16		1	-9999	\N				
BETA	PRESF	ass_total_variance	98	quantity	float32		m^2	-9999	\N				
BETA	PRESF	ass_total_energy	99	quantity	float32		J m-1	-9999	\N				
BETA	PRESF	ass_sig_wave_period	100	quantity	float32		s	-9999	\N				
BETA	PRESF	ass_sig_wave_height	101	quantity	float32		m	-9999	\N				
BETA	PRESF	tss_wave_integration_time	102	quantity	int16		s	-9999	\N				
BETA	PRESF	tss_number_of_waves	103	quantity	int16		1	-9999	\N				
BETA	PRESF	tss_total_variance	104	quantity	float32		m^2	-9999	\N				
BETA	PRESF	tss_total_energy	105	quantity	float32		J m-2	-9999	\N				
BETA	PRESF	tss_avg_wave_height	106	quantity	float32		m	-9999	\N				
BETA	PRESF	tss_avg_wave_period	107	quantity	float32		s	-9999	\N				
BETA	PRESF	tss_max_wave_height	108	quantity	float32		m	-9999	\N				
BETA	PRESF	tss_sig_wave_height	109	quantity	float32		m	-9999	\N				
BETA	PRESF	tss_sig_wave_period	110	quantity	float32		s	-9999	\N				
BETA	PRESF	tss_10_wave_height	111	quantity	float32		m	-9999	\N				
BETA	PRESF	tss_1_wave_height	112	quantity	float32		m	-9999	\N				
BETA	PRESF	firmware_version	113	array<quantity>	str		1	empty	\N				
BETA	PRESF	serial_number	114	quantity	int32		1	-9999	\N				
BETA	PRESF	user_info	115	array<quantity>	str		1	empty	\N				
BETA	PRESF	quartz_pressure_sensor_serial_number	116	quantity	int32		1	-9999	\N				
BETA	PRESF	pressure_sensor_range	117	range<quantity>	int16		psi	none	\N				
BETA	PRESF	external_temperature_sensor	118	boolean	int8		1	-9	\N				
BETA	PRESF	external_conductivity_sensor	119	boolean	int8		1	-9	\N				
BETA	PRESF	operational_current	120	quantity	float32		mA	-9999	\N				
BETA	PRESF	battery_voltage_main	121	quantity	float32		V	-9999	\N				
BETA	PRESF	battery_voltage_lithium	122	quantity	float32		V	-9999	\N				
BETA	PRESF	last_sample_absolute_press	123	quantity	float32		psi	-9999	\N				
BETA	PRESF	last_sample_temp	124	quantity	float32		deg_C	-9999	\N				
BETA	PRESF	last_sample_saln	125	quantity	float32		1	-9999	\N				
BETA	PRESF	tide_measurement_interval	126	quantity	int16		min	-9999	\N				
BETA	PRESF	tide_measurement_duration	127	quantity	int16		s	-9999	\N				
BETA	PRESF	wave_samples_between_tide_measurements	128	quantity	int16		1	-9999	\N				
BETA	PRESF	wave_samples_per_burst	129	quantity	int16		1	-9999	\N				
BETA	PRESF	wave_samples_scans_per_second	130	quantity	float32		1	-9999	\N				
BETA	PRESF	wave_samples_duration	131	quantity	float32		s	-9999	\N				
BETA	PRESF	logging_start_time	132	array<quantity>	str		1	empty	\N				
BETA	PRESF	logging_stop_time	133	array<quantity>	str		1	empty	\N				
BETA	PRESF	tide_samples_per_day	134	quantity	int16		count	-9999	\N				
BETA	PRESF	wave_bursts_per_day	135	quantity	int16		count	-9999	\N				
BETA	PRESF	memory_endurance	136	quantity	float32		days	-9999	\N				
BETA	PRESF	nominal_alkaline_battery_endurance	137	quantity	float32		days	-9999	\N				
BETA	PRESF	total_recorded_tide_measurements	138	quantity	int32		count	-9999	\N				
BETA	PRESF	total_recorded_wave_bursts	139	quantity	int32		count	-9999	\N				
BETA	PRESF	tide_measurements_since_last_start	140	quantity	int32		count	-9999	\N				
BETA	PRESF	wave_bursts_since_last_start	141	quantity	int32		count	-9999	\N				
BETA	PRESF	tx_tide_samples	142	boolean	int8		1	-9	\N				
BETA	PRESF	tx_wave_bursts	143	boolean	int8		1	-9	\N				
BETA	PRESF	tx_wave_stats	144	boolean	int8		1	-9	\N				
BETA	PRESF	num_wave_samples_per_burst_for_wave_statistics	145	quantity	int16		count	-9999	\N				
BETA	PRESF	use_measured_temp_and_cond_for_density_calc	146	boolean	int8		1	-9	\N				
BETA	PRESF	avg_water_temp_above_pressure_sensor	147	quantity	float32		deg_C	-9999	\N				
BETA	PRESF	avg_salinity_above_pressure_sensor	148	quantity	float32		1	-9999	\N				
BETA	PRESF	pressure_sensor_height_from_bottom	149	quantity	float32		m	-9999	\N				
BETA	PRESF	num_spectral_estimates_for_each_frequency_band	150	quantity	int16		count	-9999	\N				
BETA	PRESF	min_allowable_attenuation 	151	quantity	float32		1	-9999	\N				
BETA	PRESF	min_period_in_auto_spectrum 	152	quantity	float32		s	-9999	\N				
BETA	PRESF	max_period_in_auto_spectrum 	153	quantity	float32		s	-9999	\N				
BETA	PRESF	hanning_window_cutoff 	154	quantity	float32		1	-9999	\N				
BETA	PRESF	show_progress_messages 	155	boolean	int8		1	-9	\N				
BETA	PRESF	device_status	156	array<quantity>	str		1	empty	\N				
BETA	PRESF	logging_status	157	boolean	int8		1	-9	\N				
BETA	PRESF	calibration_date_pressure	158	array<quantity>	str		1	empty	\N				
BETA	PRESF	press_coeff_pu0	159	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_py1	160	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_py2	161	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_py3	162	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pc1	163	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pc2	164	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pc3	165	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pd1	166	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pd2	167	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pt1	168	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pt2	169	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pt3	170	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_pt4	171	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_m	172	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_b	173	quantity	float32		1	-9999	\N				
BETA	PRESF	press_coeff_poffset	174	quantity	float32		psi	-9999	\N				
BETA	PRESF	calibration_date_temperature	175	array<quantity>	str		1	empty	\N				
BETA	PRESF	temp_coeff_ta0	176	quantity	float32		1	-9999	\N				
BETA	PRESF	temp_coeff_ta1	177	quantity	float32		1	-9999	\N				
BETA	PRESF	temp_coeff_ta2	178	quantity	float32		1	-9999	\N				
BETA	PRESF	temp_coeff_ta3	179	quantity	float32		1	-9999	\N				
BETA	PRESF	calibration_date_conductivity	180	array<quantity>	str		1	empty	\N				
BETA	PRESF	cond_coeff_cg	181	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_ch	182	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_ci	183	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_cj	184	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_ctcor	185	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_cpcor	186	quantity	float32		1	-9999	\N				
BETA	PRESF	cond_coeff_cslope	187	quantity	float32		1	-9999	\N				
SP_TEST	PARAD	par	188	quantity	int64		counts	-9999	\N				OPTPARW_L0
SP_TEST	PARAD	par_coeff_imc	189	quantity	float32		1	-9999	\N				
SP_TEST	PARAD	par_coeff_a1	190	quantity	float32		umol photons m-2 s-1 count-1	-9999	\N				
SP_TEST	PARAD	par_coeff_a0	191	quantity	float32		count	-9999	\N				
SP_TEST	PARAD	par	192	quantity	float32		umol photons m-2 s-1	-9999	\N			{"PFID17":"RS03AXVM-SF03A-06-PARADA301"}	OPTPARW_L1
BETA	CTDBP	temperature	193	quantity	int32		counts	-9999	\N				TEMPWAT_L0
BETA	CTDBP	conductivity	194	quantity	int32		counts	-9999	\N				CONDWAT_L0
BETA	CTDBP	pressure	195	quantity	int32		counts	-9999	\N				PRESWAT_L0
BETA	CTDBP	pressure_temp	196	quantity	int32		counts	-9999	\N				
BETA	CTDBP-NO	oxygen	197	quantity	int32		counts	-9999	\N				DOCONCS_L0
BETA	CTDBP	ctd_time	198	quantity	int32		seconds since 2000-01-01	-9999	\N				
BETA	CTDBP	pump_current	199	quantity	float32		mA	-9999	\N				
BETA	CTDBP-NO	ext_v01_current	200	quantity	float32		mA	-9999	\N				
BETA	CTDBP	serial_current	201	quantity	float32		mA	-9999	\N				
BETA	CTDBP	logging_status	202	category<int8:str>	int8	{0:"not logging", 1:"logging", 2:"waiting to start at ...", 3:"unknown",-99:"empty"}	1	-99	\N				
BETA	CTDBP	num_samples	203	quantity	int32		counts	-9999	\N				
BETA	CTDBP	mem_free	204	quantity	int32		bytes	-9999	\N				
BETA	CTDBP	sample_interval 	205	quantity	int16		s	-9999	\N				
BETA	CTDBP	measurements_per_sample 	206	quantity	int8		counts	-99	\N				
BETA	CTDBP	pump_mode	207	category<int8:str>	int8	{0:"no pump", 1:"run pump for 0.5 sec before sample", 2:"run pump during sample",-99:"empty"}	1	-99	\N				
BETA	CTDBP	delay_before_sampling 	208	quantity	float32		s	-9999	\N				
BETA	CTDBP	delay_after_sampling	209	quantity	float32		s	-9999	\N				
BETA	CTDBP	tx_real_time 	210	boolean	int8		1	-9	\N				
BETA	CTDBP	battery_cutoff 	211	quantity	float32		V	-9999	\N				
BETA	CTDBP	pressure_sensor_type	212	category<int8:str>	int8	{0:"none", 1:"strain gauge", 2:"quartz with temp comp",-99:"empty"}	1	-99	\N				
BETA	CTDBP	sbe38 	213	boolean	int8		1	-9	\N				
BETA	CTDBP	sbe50 	214	boolean	int8		1	-9	\N				
BETA	CTDBP	wetlabs 	215	boolean	int8		1	-9	\N				
BETA	CTDBP	optode 	216	boolean	int8		1	-9	\N				
BETA	CTDBP	gas_tension_device 	217	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_0 	218	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_1 	219	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_2 	220	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_3 	221	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_4 	222	boolean	int8		1	-9	\N				
BETA	CTDBP	ext_volt_5 	223	boolean	int8		1	-9	\N				
BETA	CTDBP	echo_characters 	224	boolean	int8		1	-9	\N				
BETA	CTDBP	output_format 	225	category<int8:str>	int8	{0:"raw Hex", 1:"converted Hex", 2:"raw decimal", 3:"converted decimal", 5:"converted XML VVIC",-99:"empty"}	1	-99	\N				
BETA	CTDBP	output_salinity 	226	boolean	int8		1	-9	\N				
BETA	CTDBP	output_sound_velocity 	227	boolean	int8		1	-9	\N				
BETA	CTDBP	serial_sync_mode 	228	boolean	int8		1	-9	\N				
BETA	CTDBP	temp_coeff_offset	229	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_serial_number	230	quantity	int32		1	-9999	\N				
BETA	CTDBP	press_coeff_pa0	231	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_pa1	232	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_pa2	233	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptempa0	234	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptempa1	235	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptempa2	236	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptca0	237	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptca1	238	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptca2	239	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptcb0	240	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptcb1	241	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_ptcb2	242	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt0_slope	243	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt0_offset	244	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt1_slope	245	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt1_offset	246	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt2_slope	247	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt2_offset	248	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt3_slope	249	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt3_offset	250	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt4_slope	251	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt4_offset	252	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt5_slope	253	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_volt5_offset	254	quantity	float32		1	-9999	\N				
BETA	CTDBP	ext_freq_sf	255	quantity	float32		1	-9999	\N				
BETA	CTDBP	press_coeff_pslope	256	quantity	float32		1	-9999	\N				
BETA	CTDBP	temp_sensor_serial_number	257	quantity	int32		1	-9999	\N				
BETA	CTDBP	cond_sensor_serial_number	258	quantity	int32		1	-9999	\N				
BETA	CTDBP	command_set_version	259	array<quantity>	str		1	-9999	\N				
BETA	CTDBP	paros_integration	260	quantity	float32		s	-9999	\N				
BETA	CTDBP	assembly_number	261	array<quantity>	str		1	empty	\N				
BETA	CTDBP	output_sigmat	262	boolean	int8		1	-9	\N				
BETA	CTDBP	num_events	263	quantity	int32		counts	-9999	\N				
BETA	CTDBP	samples_free	264	quantity	int32		counts	-9999	\N				
BETA	CTDBP	sample_length	265	quantity	int32		bytes	-9999	\N				
BETA	CTDBP	headers	266	quantity	int32		counts	-9999	\N				
BETA	CTDBP	output_executed_tag	267	boolean	int8		1	-9	\N				
BETA	PREST	set_timeout	268	quantity	int32		ms	-9999	\N				
BETA	PREST	set_timeout_max	269	quantity	int32		ms	-9999	\N				
BETA	PREST	set_timeout_icd	270	quantity	int32		ms	-9999	\N				
BETA	PREST	reference_oscillator_freq	271	quantity	float32		Hz	-9999	\N				
BETA	PREST	pcb_thermistor_value	272	quantity	int32		counts	-9999	\N				
BETA	PREST	reference_error	273	quantity	float32		ppm	-9999	\N				
BETA	PREST	device_type	274	array<quantity>	str		1	empty	\N				
BETA	PREST	calibration_date_acq_crystal	275	array<quantity>	str		1	empty	\N				
BETA	PREST	acq_crystal_coeff_fra0	276	quantity	float32		1	-9999	\N				
BETA	PREST	acq_crystal_coeff_fra1	277	quantity	float32		1	-9999	\N				
BETA	PREST	acq_crystal_coeff_fra2	278	quantity	float32		1	-9999	\N				
BETA	PREST	acq_crystal_coeff_fra3	279	quantity	float32		1	-9999	\N				
BETA	PREST	pressure_sensor_serial_number	280	quantity	int32		1	-9999	\N				
BETA	PREST	pressure_sensor_range	281	range<quantity>	int32		psi	none	\N				
BETA	PREST	battery_type	282	category<int8:str>	int8	{0:"Lithium", 1:"Alkaline",-99:"empty"}	1	-99	\N				
BETA	PREST	baud_rate	283	quantity	int32		Bd	-9999	\N				
BETA	PREST	enable_alerts	284	boolean	int8		1	-99	\N				
BETA	PREST	upload_type	285	category<int8:str>	int8	{0:"Upload in ASCII Text", 1:"Upload in binary",-99:"empty"}	1	-99	\N				
BETA	PREST	sample_period 	286	quantity	int32		s	-9999	\N				
BETA	PREST	version	287	array<quantity>	str		1	empty	\N				
BETA	PREST	event_count	288	quantity	int32		count	-9999	\N				
BETA	PREST	bytes_used	289	quantity	int32		1	-9999	\N				
BETA	PREST	bytes_free 	290	quantity	int32		1	-9999	\N				
BETA	PREST	manufacturer	291	array<quantity>	str		1	empty	\N				
BETA	PREST	firmware_date	293	array<quantity>	str		1	empty	\N				
BETA	PREST	hardware_version	294	array<quantity>	str		1	empty	\N				
BETA	PREST	pcb_serial_number	295	array<quantity>	str		1	empty	\N				
BETA	PREST	pcb_type	296	array<quantity>	str		1	empty	\N				
BETA	PREST	manufacture_date 	297	array<quantity>	str		1	empty	\N				
BETA	PREST	number_events	298	quantity	int32		1	-9999	\N				
BETA	PREST	power_on_reset	299	quantity	int32		1	-9999	\N				
BETA	PREST	power_fail_reset	300	quantity	int32		1	-9999	\N				
BETA	PREST	watchdog_reset	301	quantity	int32		1	-9999	\N				
BETA	PREST	serial_byte_error	302	quantity	int32		1	-9999	\N				
BETA	PREST	command_buffer_overflow	303	quantity	int32		1	-9999	\N				
BETA	PREST	serial_receive_overflow	304	quantity	int32		1	-9999	\N				
BETA	PREST	low_battery	305	quantity	int32		1	-9999	\N				
BETA	PREST	out_of_memory	306	quantity	int32		1	-9999	\N				
BETA	PREST	signal_error	307	quantity	int32		1	-9999	\N				
BETA	PREST	error_10	308	quantity	int32		1	-9999	\N				
BETA	PREST	error_12	309	quantity	int32		1	-9999	\N				
CW_TEST	NUTNR-B	frame_header	310	array<quantity>	 str		1	empty	\N				
CW_TEST	NUTNR-B	frame_type	311	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	serial_number	312	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	date_of_sample	313	quantity	int16		1	-9999	\N				
CW_TEST	NUTNR-B	time_of_sample	314	quantity	float64		h	-9999	\N				
CW_TEST	NUTNR-B	nitrate_concentration	315	quantity	float32		uMol L-1	-9999	\N				
CW_TEST	NUTNR-B	aux_fitting_1	316	quantity	float32		1	-9999	\N				
CW_TEST	NUTNR-B	aux_fitting_2	317	quantity	float32		1	-9999	\N				
CW_TEST	NUTNR-B	aux_fitting_3	318	quantity	float32		1	-9999	\N				
CW_TEST	NUTNR-B	rms_error	319	quantity	float32		uMol L-1	-9999	\N				
CW_TEST	NUTNR-B	temp_interior	320	quantity	float32		deg_C	-9999	\N				
CW_TEST	NUTNR-B	temp_spectrometer	321	quantity	float32		deg_C	-9999	\N				
CW_TEST	NUTNR-B	temp_lamp	322	quantity	float32		deg_C	-9999	\N				
CW_TEST	NUTNR-B	lamp_time	323	quantity	float32		s	-9999	\N				
CW_TEST	NUTNR-B	humidity	324	quantity	float32		percent	-9999	\N				
CW_TEST	NUTNR-B	voltage_lamp	325	quantity	float32		V	-9999	\N				
CW_TEST	NUTNR-B	voltage_analog	326	quantity	float32		V	-9999	\N				
CW_TEST	NUTNR-B	voltage_main	327	quantity	float32		V	-9999	\N				
CW_TEST	NUTNR-B	ref_channel_average	328	quantity	float32		counts	-9999	\N				
CW_TEST	NUTNR-B	ref_channel_variance	329	quantity	float32		1	-9999	\N				
CW_TEST	NUTNR-B	sea_water_dark	330	quantity	float32		counts	-9999	\N				
CW_TEST	NUTNR-B	spec_channel_average	331	quantity	float32		counts	-9999	\N				
CW_TEST	NUTNR-B	spectral_channels	332	array<quantity>	uint16		counts	65535	\N				
CW_TEST	NUTNR-B	checksum 	333	quantity	uint8 		1	0	\N				
CW_TEST	NUTNR-B	startup_time	334	quantity	int32		seconds since 1970-01-01	-9999	\N				
CW_TEST	NUTNR-B	persistor_cf_card	335	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	persistor_bios	336	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	persistor_picodos_version	337	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	persistor_picodos_bytes_used	338	quantity	int32		bytes	-9999	\N				
CW_TEST	NUTNR-B	cf_card_size	339	quantity	int32		bytes	-9999	\N				
CW_TEST	NUTNR-B	cf_card_free	340	quantity	int32		bytes	-9999	\N				
CW_TEST	NUTNR-B	previous_shutdown_code	343	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	operating_mode	345	array<quantity>	str		1	empty	\N				
CW_TEST	NUTNR-B	use_shutter_darks	346	boolean	int8		1	-9	\N				
CW_TEST	NUTNR-B	lamp_time	347	quantity	int32		s	-9999	\N				
CW_TEST	NUTNR-B	spec_on_time	348	quantity	int32		seconds since 1970-01-01	-9999	\N				
CW_TEST	NUTNR-B	spec_powered_time	349	quantity	int32		seconds since 1970-01-01	-9999	\N				
CW_TEST	NUTNR-B	lamp_on_time	350	quantity	int32		seconds since 1970-01-01	-9999	\N				
CW_TEST	NUTNR-B	lamp_powered_time	351	quantity	int32		seconds since 1970-01-01	-9999	\N				
CW_TEST	NUTNR-B	data_log_file	352	array<quantity>	str		1	empty	\N				
CW_TEST	PCO2W-B	unique_id	353	quantity	uint8 		1	0	\N				
CW_TEST	PCO2W-B	record_length	354	quantity	uint8 		1	0	\N				
CW_TEST	PCO2W-B	record_type	355	quantity	uint8 		1	0	\N				
CW_TEST	PCO2W-B	record_time	356	quantity	int32		seconds since 1904-01-01	-9999	\N				
CW_TEST	PCO2W-B	light_measurements	357	array<quantity>	int16		counts	-9999	\N				
CW_TEST	PCO2W-B	voltage_battery	358	quantity	int16		counts	-9999	\N				
CW_TEST	PCO2W-B	thermistor_raw	359	quantity	int16		counts	-9999	\N				
CW_TEST	PCO2W-B	pump_on	360	boolean	int8 		1	-9	\N				
CW_TEST	PCO2W-B	valve_on	361	boolean	int8 		1	-9	\N				
CW_TEST	PCO2W-B	external_power_on	362	boolean	int8 		1	-9	\N				
CW_TEST	PCO2W-B	debug_led	363	boolean	int8 		1	-9	\N				
CW_TEST	PCO2W-B	debug_echo 	364	boolean	int8 		1	-9	\N				
CW_TEST	PCO2W-B	elapsed_time_config	365	quantity	 int32		s	-9999	\N				
CW_TEST	PCO2W-B	clock_active	366	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	recording_active	367	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	record_end_on_time	368	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	record_memory_full	369	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	record_end_on_error	370	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	data_download_ok	371	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	flash_memory_open	372	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	battery_error_fatal	373	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	battery_low_measurement	374	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	battery_low_blank	375	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	battery_low_external	376	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	external_device_fault	377	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	flash_erased	378	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	power_on_invalid 	379	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	launch_time	380	quantity	 int32		seconds since 1904-01-01	-9999	\N				
CW_TEST	PCO2W-B	start_time_offset	381	quantity	int32		s 	-9999	\N				
CW_TEST	PCO2W-B	recording_time	382	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	pmi_sample_schedule	383	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	sami_sample_schedule	384	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot1_follows_sami_sample	385	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot1_independent_schedule	386	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot2_follows_sami_sample	387	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot2_independent_schedule	388	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot3_follows_sami_sample	389	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	slot3_independent_schedule	390	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	timer_interval_sami	391	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	driver_id_sami	392	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	parameter_pointer_sami	393	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	timer_interval_device1	394	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	driver_id_device1	395	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	parameter_pointer_device1	396	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	timer_interval_device2	397	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	driver_id_device2	398	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	parameter_pointer_device2	399	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	timer_interval_device3	400	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	driver_id_device3	401	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	parameter_pointer_device3	402	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	timer_interval_prestart	403	quantity	int32		s	-9999	\N				
CW_TEST	PCO2W-B	driver_id_prestart	404	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	parameter_pointer_prestart	405	quantity	int8		1	-9	\N				
CW_TEST	PCO2W-B	use_baud_rate_9600	406	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	send_record_type_early	407	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	send_live_records	408	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	extend_global_config	409	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	pump_pulse	410	quantity	uint8 		s	0	\N				
CW_TEST	PCO2W-B	pump_on_to_measure	411	quantity	uint8 		s	0	\N				
CW_TEST	PCO2W-B	samples_per_measure	412	quantity	uint8 		counts	0	\N				
CW_TEST	PCO2W-B	cycles_between_blanks	413	quantity	uint8 		counts	0	\N				
CW_TEST	PCO2W-B	num_reagent_cycles	414	quantity	uint8 		counts	0	\N				
CW_TEST	PCO2W-B	num_blank_cycles	415	quantity	uint8 		counts	0	\N				
CW_TEST	PCO2W-B	flush_pump_interval	416	quantity	uint8 		s	0	\N				
CW_TEST	PCO2W-B	blank_flush_on_start	417	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	pump_pulse_post_measure	418	boolean	int8		1	-9	\N				
CW_TEST	PCO2W-B	num_extra_pump_cycles	419	quantity	uint8 		counts	0	\N				
CW_TEST	PCO2W-B	cycle_interval 	420	quantity	uint8 		s	0	\N				
SP_TEST	TRHPH	resistivity_5	421	quantity	float32		V	-9999	\N				TRHPHR1
SP_TEST	TRHPH	resistivity_x1	422	quantity	float32		V	-9999	\N				TRHPHR2
SP_TEST	TRHPH	resistivity_x5	423	quantity	float32		V	-9999	\N				TRHPHR3
SP_TEST	TRHPH	hydrogen_5	424	quantity	float32		V	-9999	\N				
SP_TEST	TRHPH	hydrogen_x1	425	quantity	float32		V	-9999	\N				
SP_TEST	TRHPH	hydrogen_x5	426	quantity	float32		V	-9999	\N				
SP_TEST	TRHPH	eh_sensor	427	quantity	float32		V	-9999	\N				TRHPHEH
SP_TEST	TRHPH	ref_temp_volts	428	quantity	float32		V	-9999	\N				TRHPHVS
SP_TEST	TRHPH	ref_temp_degc	429	quantity	float32		deg_C	-9999	\N				
SP_TEST	TRHPH	resistivity_temp_volts	430	quantity	float32		V	-9999	\N				TRHPHVC
SP_TEST	TRHPH	resistivity_temp_degc	431	quantity	float32		deg_C	-9999	\N				
TMPSF	TRHPH	battery_voltage	432	quantity	float32		V	-9999	\N				
CW_TEST	VELPT	error_code	433	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	analog1	434	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	sound_speed_analog2	435	quantity	float32		m s-1	-9999	\N				
CW_TEST	VELPT	heading	436	quantity	float32		degrees	-9999	\N				
CW_TEST	VELPT	roll	438	quantity	float32		degrees	-9999	\N				
CW_TEST	VELPT	pitch	437	quantity	float32		degrees	-9999	\N				
CW_TEST	VELPT	status	439	quantity	int8		1	-99	\N				
CW_TEST	VELPT	temperature	440	quantity	float32		deg_C	-9999	\N				
CW_TEST	VELPT	velocity_beam1	441	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VELPT	velocity_beam2	442	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VELPT	velocity_beam3	443	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VELPT	amplitude_beam1	444	quantity	int16		counts	-9999	\N				
CW_TEST	VELPT	amplitude_beam2	445	quantity	int16		counts	-9999	\N				
CW_TEST	VELPT	amplitude_beam3	446	quantity	int16		counts	-9999	\N				
CW_TEST	VELPT	records_to_follow	447	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	cell_number_diagnostics	448	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	noise_amplitude_beam1	449	quantity	int8		counts	-99	\N				
CW_TEST	VELPT	noise_amplitude_beam2	450	quantity	int8		counts	-99	\N				
CW_TEST	VELPT	noise_amplitude_beam3	451	quantity	int8		counts	-99	\N				
CW_TEST	VELPT	noise_amplitude_beam4	452	quantity	int8		counts	-99	\N				
CW_TEST	VELPT	processing_magnitude_beam1	453	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	processing_magnitude_beam2	454	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	processing_magnitude_beam3	455	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	processing_magnitude_beam4	456	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	distance_beam1	457	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	distance_beam2	458	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	distance_beam3	459	quantity	int16		1	-9999	\N				
CW_TEST	VELPT	distance_beam4	460	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	instrmt_type_serial_number	461	array<quantity>	str		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	recorder_installed	462	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	compass_installed	463	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	board_frequency	464	quantity	int16		kHz	-9999	\N				
CW_TEST	Nortek Generic Data Structures	pic_version	465	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	hardware_revision	466	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	recorder_size	467	quantity	int16		bytes	-9999	\N				
CW_TEST	Nortek Generic Data Structures	velocity_range	468	category<int8:str>	int8	{0:"normal",1:"high",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	pressure_sensor	470	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	magnetometer_sensor	471	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	tilt_sensor	472	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	tilt_sensor_mounting	473	category<int8:str>	int8	{0:"normal",1:"high",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	head_frequency	474	quantity	int16		kHz	-9999	\N				
CW_TEST	Nortek Generic Data Structures	head_type	475	array<quantity>	str		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	head_serial_number	476	array<quantity>	str		empty	empty	\N				
CW_TEST	Nortek Generic Data Structures	system_data	477	array<quantity>	str		empty	empty	\N				
CW_TEST	Nortek Generic Data Structures	number_beams	478	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	transmit_pulse_length	479	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	blanking_distance	480	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	receive_length	481	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	time_between_pings	482	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	time_between_bursts	483	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_pings	484	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	average_interval	485	quantity	int16		s	-9999	\N				
CW_TEST	Nortek Generic Data Structures	profile_type	487	category<int8:str>	int8	{0:"single",1:"continuous",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	mode_type	488	category<int8:str>	int8	{0:"burst",1:"continuous",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	power_level_tcm1	489	quantity	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	power_level_tcm2	490	quantity	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	sync_out_position	491	category<int8:str>	int8	{0:"middle of sample",1:"end of sample",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	sample_on_sync	492	category<int8:str>	int8	{0:"disabled",1:"enabled, rising edge",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	start_on_sync	493	category<int8:str>	int8	{0:"disabled",1:"enabled, rising edge",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	power_level_pcr1	494	quantity	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	power_level_pcr2	495	quantity	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	compass_update_rate	496	quantity	int16		Hz	-9999	\N				
CW_TEST	Nortek Generic Data Structures	coordinate_system	497	category<int8:str>	int8	{0:"ENU",1:"XYZ",2:"BEAM",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	number_cells	498	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	cell_size	499	quantity	int16		m	-9999	\N				
CW_TEST	Nortek Generic Data Structures	measurement_interval	500	quantity	int16		s	-9999	\N				
CW_TEST	Nortek Generic Data Structures	deployment_name	501	array<quantity>	str		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	wrap_moder	502	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	deployment_start_time	503	quantity	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	diagnostics_interval	504	quantity	int32		s	-9999	\N				
CW_TEST	Nortek Generic Data Structures	use_specified_sound_speed	505	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	diagnostics_mode_enable	506	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	analog_output_enable	507	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	output_format_nortek	508	category<int8:str>	int8	{0:"Vector",1:"ADV",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	scaling	509	category<int8:str>	int8	{0:"1 mm",1:"0.1 mm",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	serial_output_enable	510	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	stage_enable	511	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	analog_power_output	512	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	sound_speed_adjust_factor	513	quantity	int16		m s-1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_diagnostics_samples	514	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_beams_per_cell	515	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_pings_diagnostic	516	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	use_dsp_filter	517	boolean	int8		1	-99	\N				
CW_TEST	Nortek Generic Data Structures	filter_data_output	518	category<int8:str>	int8	{0:"total corrected velocity",1:"only correction part",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	analog_input_address	519	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	software_version	520	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	velocity_adjustment_factor	521	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	file_comments	522	array<quantity>	str		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	wave_data_rate	523	category<int8:str>	int8	{0:"1 Hz",1:"2 Hz",-99:"empty"}	Hz	-99	\N				
CW_TEST	Nortek Generic Data Structures	wave_cell_position	524	category<int8:str>	int8	{0:"fixed",1:"dynamic",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	dynamic_position_type	525	category<int8:str>	int8	{0:"precent of mean pressure",1:"precent of re",-99:"empty"}	1	-99	\N				
CW_TEST	Nortek Generic Data Structures	percent_wave_cell_position	526	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	wave_transmit_pulse	527	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	fixed_wave_blanking_distance	528	quantity	int16		counts	-9999	\N				
CW_TEST	Nortek Generic Data Structures	wave_measurement_cell_size	529	quantity	int16		m	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_diagnostics_per_wave	530	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	number_samples_per_burst	531	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	analog_scale_factor	532	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	correlation_threshold	533	quantity	int16		1	-9999	\N				
CW_TEST	Nortek Generic Data Structures	filter_constants	534	quantity	int16		1	-9999	\N				
SP_TEST	VEL3D-B	velocity_beam_a	535	quantity	int16		counts	-32768	\N				
SP_TEST	VEL3D-B	velocity_beam_b	536	quantity	int16		counts	-32768	\N				
SP_TEST	VEL3D-B	velocity_beam_c	537	quantity	int16		counts	-32768	\N				
SP_TEST	VEL3D-B	velocity_beam_d	538	quantity	int16		counts	-32768	\N				
SP_TEST	VEL3D-B	turbulent_velocity_east	539	quantity	float32		cm s-1	-9999	\N				VELPTTU-VLE_L0
SP_TEST	VEL3D-B	turbulent_velocity_north	540	quantity	float32		cm s-1	-9999	\N				VELPTTU-VLN_L0
SP_TEST	VEL3D-B	turbulent_velocity_vertical	541	quantity	float32		cm s-1	-9999	\N				VELPTTU-VLU_L0
SP_TEST	VEL3D-B	mag_comp_x	542	quantity	float32		1	-9999	\N				
SP_TEST	VEL3D-B	mag_comp_y	543	quantity	float32		1	-9999	\N				
SP_TEST	VEL3D-B	velocity_offsets	733	array<quantity>	float32		cm s-1	-9999	\N				
SP_TEST	VEL3D-B	compass_offsets	734	array<quantity>	int32		1	-9999	\N				
SP_TEST	VEL3D-B	compass_scale_factor	735	array<quantity>	float32		1	-9999	\N				
SP_TEST	VEL3D-B	tilt_offsets	736	array<quantity>	int16		1	-9999	\N				
SP_TEST	VEL3D-B	thermistor_calibration	737	quantity	float32		deg_C	-9999	\N				
SP_TEST	VEL3D-B	sample_period	738	quantity	float32		s	-9999	\N				
SP_TEST	VEL3D-B	samples_per_burst	739	quantity	int32		counts	-9999	\N				
SP_TEST	VEL3D-B	burst_interval	740	array<quantity>	str		1	empty	\N				
SP_TEST	VEL3D-B	bin_to_si_conversion	741	quantity	float32		1	-9999	\N				
CW_TEST	VEL3D-C,D	analog_input_2	547	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	ensemble_counter	548	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	seawater_pressure	549	quantity	float32		dbar	-9999	\N				
CW_TEST	VEL3D-C,D	analog_input_1	550	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	turbulent_velocity_east	551	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VEL3D-C,D	turbulent_velocity_north	552	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VEL3D-C,D	turbulent_velocity_vertical	553	quantity	float32		mm s-1	-9999	\N				
CW_TEST	VEL3D-C,D	amplitude_beam_1	554	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	amplitude_beam_2	555	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	amplitude_beam_3	556	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	correlation_beam_1	557	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	correlation_beam_2	558	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	correlation_beam_3	559	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	speed_of_sound	562	quantity	float32		m s-1	-9999	\N				
CW_TEST	VEL3D-C,D	error_code	567	quantity	int8		1	-99	\N				
CW_TEST	VEL3D-C,D	status_code	568	quantity	int8		1	-99	\N				
CW_TEST	VEL3D-C,D	analog_input	569	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	number_velocity_records	571	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	noise_amp_beam1	572	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	noise_amp_beam2	573	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	noise_amp_beam3	574	quantity	int16		counts	-9999	\N				
CW_TEST	VEL3D-C,D	noise_correlation_beam1	575	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	noise_correlation_beam2	576	quantity	int16		1	-9999	\N				
CW_TEST	VEL3D-C,D	noise_correlation_beam3	577	quantity	int16		1	-9999	\N				
CW_TEST	OPTAA	record_length	583	quantity	 uint16		1	65535	\N				
CW_TEST	OPTAA	packet_type	584	quantity	uint8		1	255	\N				
CW_TEST	OPTAA	meter_type	585	quantity	uint8		1	255	\N				
CW_TEST	OPTAA	a_reference_dark_counts	586	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	pressure_counts	587	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	a_signal_dark_counts	588	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	external_temp_raw	589	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	internal_temp_raw	590	quantity	uint16		counts	65535	\N				OPTTEMP_L0
CW_TEST	OPTAA	c_reference_dark_counts	591	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	c_signal_dark_counts	592	quantity	uint16		counts	65535	\N				
CW_TEST	OPTAA	elapsed_run_time	593	quantity	uint32		ms	0	\N				
CW_TEST	OPTAA	num_wavelengths	594	quantity	uint8		1	0	\N				
CW_TEST	OPTAA	c_reference_counts	595	array<quantity>	uint16		counts	65535	\N				OPTCREF_L0
CW_TEST	OPTAA	a_reference_counts	596	array<quantity>	uint16		counts	65535	\N				OPTAREF_L0
CW_TEST	OPTAA	c_signal_counts	597	array<quantity>	uint16		counts	65535	\N				OPTCSIG_L0
CW_TEST	OPTAA	a_signal_counts 	598	array<quantity>	uint16 		counts 	65535	\N				OPTASIG_L0
CW_TEST	OPTAA	firmware_version	599	quantity	 float32		1	-9999	\N				
CW_TEST	OPTAA	persistor_cf_serial_number	600	quantity	uint16		1	0	\N				
CW_TEST	OPTAA	persistor_bios_version	601	quantity	float32		1	-9999	\N				
CW_TEST	OPTAA	persistor_picodos_version 	602	quantity	float32 		1	-9999	\N				
TMPSF	TMPSF	temperature	603	array<quantity>	float32		deg_C	-9999	\N			{"PFID17":"RS03ASHS-MJ03B-05-TMPSFA301"}	TEMPSFL_L1
TMPSF	TMPSF	tmpsf_cal_coeffs	604	array<quantity>	float32		1	-9999	\N				
CW_TEST	ADCP-PD0	header_id	605	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	data_source_id	606	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	num_bytes	607	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	num_data_types	608	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	offset_data_types	609	array<quantity>	uint16		1	0	\N				
CW_TEST	ADCP-PD0	fixed_leader_id	610	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	firmware_version	611	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	firmware_revision	612	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	sysconfig_frequency	613	quantity	uint16		kHz	0	\N				
CW_TEST	ADCP-PD0	sysconfig_beam_pattern	614	category<int8:str>	int8	{0:"Concave",1:"Convex",-99:"empty"}	1	-99	\N				
CW_TEST	ADCP-PD0	sysconfig_sensor_config	615	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	sysconfig_head_attached	616	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sysconfig_vertical_orientation	617	category<int8:str>	int8	{0:"Downward",1:"Upward",-99:"empty"}	1	-99	\N				
CW_TEST	ADCP-PD0	data_flag	618	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	lag_length	619	quantity	uint8		s	0	\N				
CW_TEST	ADCP-PD0	num_beams	620	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	num_cells	621	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	pings_per_ensemble	622	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	depth_cell_length	623	quantity	uint16		cm	0	\N				
CW_TEST	ADCP-PD0	blank_after_transmit	624	quantity	uint16		cm	0	\N				
CW_TEST	ADCP-PD0	signal_processing_mode	625	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	low_corr_threshold	626	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	num_code_repetitions	627	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	percent_good_min	628	quantity	uint8		percent	0	\N				
CW_TEST	ADCP-PD0	error_vel_threshold	629	quantity	uint16		mm s-1	0	\N				
CW_TEST	ADCP-PD0	time_per_ping_minutes	630	quantity	uint8		min	0	\N				
CW_TEST	ADCP-PD0	time_per_ping_seconds	631	quantity	float32		s	-99	\N				
CW_TEST	ADCP-PD0	coord_transform_type	632	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	coord_transform_tilts	633	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	coord_transform_beams	634	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	coord_transform_mapping	635	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	heading_alignment	636	quantity	int16		cdegrees	-9999	\N				
CW_TEST	ADCP-PD0	heading_bias	637	quantity	int16		cdegrees	-9999	\N				
CW_TEST	ADCP-PD0	sensor_source_speed	638	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_depth	639	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_heading	640	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_pitch	641	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_roll	642	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_conductivity	643	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_source_temperature	644	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_depth	645	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_heading	646	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_pitch	647	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_roll	648	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_conductivity	649	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	sensor_available_temperature	650	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	bin_1_distance	651	quantity	uint16		cm	0	\N				
CW_TEST	ADCP-PD0	transmit_pulse_length	652	quantity	uint16		cm	0	\N				
CW_TEST	ADCP-PD0	reference_layer_start	653	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	reference_layer_stop	654	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	false_target_threshold	655	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	low_latency_trigger	656	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	transmit_lag_distance	657	quantity	uint16		cm	0	\N				
CW_TEST	ADCP-PD0	cpu_board_serial_number	658	quantity	uint64		1	0	\N				
CW_TEST	ADCP-PD0	system_bandwidth	659	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	system_power	660	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	serial_number	661	quantity	uint32		1	0	\N				
CW_TEST	ADCP-PD0	beam_angle	662	quantity	uint8		degrees	0	\N				
CW_TEST	ADCP-PD0	variable_leader_id	663	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	ensemble_number	664	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	ensemble_number_increment	666	quantity	uint8		1	0	\N				
CW_TEST	ADCP-PD0	bit_result_demod_1	667	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	bit_result_demod_2	668	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	bit_result_timing	669	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	speed_of_sound	670	quantity	uint16		m s-1	0	\N				
CW_TEST	ADCP-PD0	transducer_depth	671	quantity	uint16		dm	0	\N				
CW_TEST	ADCP-PD0	heading	672	quantity	uint16		cdegrees	0	\N				
CW_TEST	ADCP-PD0	pitch	673	quantity	int16		cdegrees	-9999	\N				
CW_TEST	ADCP-PD0	roll	674	quantity	int16		cdegrees	-9999	\N				
CW_TEST	ADCP-PD0	salinity	675	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD0	temperature	676	quantity	int16		cdeg_C	-9999	\N				
CW_TEST	ADCP-PD0	mpt_minutes	677	quantity	uint8		min	0	\N				
CW_TEST	ADCP-PD0	mpt_seconds	678	quantity	float32		s	-9999	\N				
CW_TEST	ADCP-PD0	heading_stdev	679	quantity	uint8		degrees	0	\N				
CW_TEST	ADCP-PD0	pitch_stdev	680	quantity	uint8		ddegrees	0	\N				
CW_TEST	ADCP-PD0	roll_stdev	681	quantity	uint8		ddegrees	0	\N				
CW_TEST	ADCP-PD0	adc_transmit_current	682	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_transmit_voltage	683	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_ambient_temp	684	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_pressure_plus	685	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_pressure_minus	686	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_attitude_temp	687	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_attitiude	688	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	adc_contamination_sensor	689	quantity	uint8		counts	0	\N				
CW_TEST	ADCP-PD0	bus_error_exception	690	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	address_error_exception	691	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	illegal_instruction_exception	692	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	zero_divide_instruction	693	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	emulator_exception	694	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	unassigned_exception	695	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	watchdog_restart_occurred	696	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	battery_saver_power	697	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	pinging	698	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	cold_wakeup_occurred	699	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	unknown_wakeup_occurred	700	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	clock_read_error	701	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	unexpected_alarm	702	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	clock_jump_forward	703	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	clock_jump_backward	704	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	power_fail	705	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	spurious_dsp_interrupt	706	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	spurious_uart_interrupt	707	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	spurious_clock_interrupt	708	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	level_7_interrupt	709	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD0	pressure	710	quantity	uint32		daPa	0	\N				
CW_TEST	ADCP-PD0	pressure_variance	711	quantity	uint32		daPa	0	\N				
CW_TEST	ADCP-PD0	velocity_data_id	713	quantity	uint16		1	65535	\N				
CW_TEST	ADCP-PD0	water_velocity_east	714	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-VLE
CW_TEST	ADCP-PD0	water_velocity_north	715	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-VLN
CW_TEST	ADCP-PD0	water_velocity_up	716	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-VLU
CW_TEST	ADCP-PD0	error_velocity	717	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-EVL
CW_TEST	ADCP-PD0	correlation_magnitude_id	718	quantity	uint16		1	65535	\N				
CW_TEST	ADCP-PD0	correlation_magnitude_beam1	719	array<quantity>	uint8		1	0	\N				
CW_TEST	ADCP-PD0	correlation_magnitude_beam2	720	array<quantity>	uint8		1	0	\N				
CW_TEST	ADCP-PD0	correlation_magnitude_beam3	721	array<quantity>	uint8		1	0	\N				
CW_TEST	ADCP-PD0	correlation_magnitude_beam4	722	array<quantity>	uint8		1	0	\N				
CW_TEST	ADCP-PD0	echo_intensity_id	723	quantity	uint16		1	65535	\N				
CW_TEST	ADCP-PD0	echo_intesity_beam1	724	array<quantity>	uint8		counts	0	\N				ECHOINT-B1
CW_TEST	ADCP-PD0	echo_intesity_beam2	725	array<quantity>	uint8		counts	0	\N				ECHOINT-B2
CW_TEST	ADCP-PD0	echo_intesity_beam3	726	array<quantity>	uint8		counts	0	\N				ECHOINT-B3
CW_TEST	ADCP-PD0	echo_intesity_beam4	727	array<quantity>	uint8		counts	0	\N				ECHOINT-B4
CW_TEST	ADCP-PD0	percent_good_id	728	quantity	uint16		1	65535	\N				
CW_TEST	ADCP-PD0	percent_good_3beam	729	array<quantity>	uint8		percent	255	\N				VELPROF-PCG
CW_TEST	ADCP-PD0	percent_transforms_reject	730	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	percent_bad_beams	731	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	percent_good_4beam	732	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	checksum	743	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	wave_header_id	744	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	checksum_offset	745	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	offset_data_types	747	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	first_leader_id	748	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	firmware_version	749	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	configuration	750	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	num_bins	751	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	samples_per_burst	752	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	bin_length	753	quantity	uint8		cm	0	\N				
CW_TEST	ADCP-Waves	time_between_pings	754	quantity	uint16		cs	0	\N				
CW_TEST	ADCP-Waves	time_between_bursts	755	quantity	uint16		s	0	\N				
CW_TEST	ADCP-Waves	num_bins_out	757	quantity	uint8		1	0	\N				
CW_TEST	ADCP-Waves	dws_bitmap	758	array<quantity>	uint8		1	empty	\N				
CW_TEST	ADCP-Waves	velocity_bitmap	759	array<quantity>	uint8		1	empty	\N				
CW_TEST	ADCP-Waves	burst_start_time	760	quantity	float64		seconds since 1900-01-01	-9999	\N				
CW_TEST	ADCP-Waves	burst_number	761	quantity	uint32		1	0	\N				
CW_TEST	ADCP-Waves	serial_number	762	quantity	uint64		1	0	\N				
CW_TEST	ADCP-Waves	wave_ping_id	764	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	sample_number	765	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	elapsed_time	766	quantity	uint32		cs	0	\N				
CW_TEST	ADCP-Waves	distance_surface	768	array<quantity>	int32		mm	empty	\N				
CW_TEST	ADCP-Waves	beam_radial_velocity	769	array<quantity>	int16		mm s-1	empty	\N				
CW_TEST	ADCP-Waves	hpr_ping_id	770	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	last_leader_id	774	quantity	uint16		1	0	\N				
CW_TEST	ADCP-Waves	avg_depth	775	quantity	uint16		dm	65535	\N				
CW_TEST	ADCP-Waves	avg_speed_of_sound	776	quantity	uint16		m s-1	65535	\N				
CW_TEST	ADCP-Waves	avg_temperature	777	quantity	uint16		cdeg_C	65535	\N				
CW_TEST	ADCP-Waves	avg_heading	778	quantity	uint16		cdegrees	65535	\N				
CW_TEST	ADCP-Waves	stdev_heading	779	quantity	int16		cdegrees	-32768	\N				
CW_TEST	ADCP-Waves	avg_pitch	780	quantity	int16		cdegrees	-32768	\N				
CW_TEST	ADCP-Waves	stdev_pitch	781	quantity	int16		cdegrees	-32768	\N				
CW_TEST	ADCP-Waves	avg_roll	782	quantity	int16		cdegrees	-32768	\N				
CW_TEST	ADCP-Waves	stdev_roll	783	quantity	int16		cdegrees	-32768	\N				
CW_TEST	ADCP-PD12	pd12_packet_id	784	quantity	uint16		1	0	\N				
CW_TEST	ADCP-PD12	ensemble_start_time	785	quantity	float64		seconds since 1900-01-01	-9999	\N				
CW_TEST	ADCP-PD12	velocity_po_error_flag	788	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD12	velocity_po_up_flag	789	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD12	velocity_po_north_flag	790	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD12	velocity_po_east_flag	791	boolean	int8		1	-99	\N				
CW_TEST	ADCP-PD12	increment_bin	792	quantity	uint8		1	255	\N				
CW_TEST	ADCP-PD12	start_bin	793	quantity	uint8		1	255	\N				
CW_TEST	ADCP-PD12	num_bins	794	quantity	uint8		1	255	\N				
CW_TEST	ADCP-CompCal	fluxgate_calibration_timestamp	795	quantity	float64		seconds since 1900-01-01	-9999	\N				
CW_TEST	ADCP-CompCal	s_inverse_bx	796	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	s_inverse_by	797	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	s_inverse_bz	798	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	s_inverse_err	799	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	coil_offset	800	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	electrical_null	801	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	tilt_calibration_timestamp	802	quantity	float64		seconds since 1900-01-01	-9999	\N				
CW_TEST	ADCP-CompCal	roll_up_down	803	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	pitch_up_down	804	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	offset_up_down	805	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-CompCal	tilt_null	806	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-SysConfig	transducer_frequency	807	quantity	uint32		Hz	65535	\N				
CW_TEST	ADCP-SysConfig	configuration	808	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	match_layer	809	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	beam_angle	810	quantity	uint8		degrees	255	\N				
CW_TEST	ADCP-SysConfig	beam_pattern	811	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	orientation	812	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	sensors	813	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	pressure_coeff_c3	814	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-SysConfig	pressure_coeff_c2	815	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-SysConfig	pressure_coeff_c1	816	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-SysConfig	pressure_coeff_offset	817	quantity	float32		1	-9999	\N				
CW_TEST	ADCP-SysConfig	temperature_sensor_offset	818	quantity	float32		deg_C	-9999	\N				
CW_TEST	ADCP-SysConfig	cpu_firmware	819	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	boot_code_required	820	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	boot_code_actual	821	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	demod_1_version	822	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	demod_1_type	823	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	demod_2_version	824	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	demod_2_type	825	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	power_timing_version	826	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	power_timing_type	827	array<quantity>	str		1	empty	\N				
CW_TEST	ADCP-SysConfig	board_serial_numbers	828	array<quantity>	str		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	date_time_array	829	array<quantity>	int8		1	empty	\N				
CW_TEST	Nortek Generic Data Structures	date_time_stamp	830	quantity	float64		seconds since 1900-01-01	-9999	\N				
CW_TEST	Nortek Generic Data Structures	battery_voltage	831	quantity	int32		mV	-9999	\N				
CW_TEST	Nortek Generic Data Structures	identification_string	832	array<quantity>	str		1	empty	\N				
ALPHA_SYS	PRESF	absolute_pressure_burst	833	array<quantity>	float32		psi	-9999	\N				SFLPRES_L0
ALPHA_SYS	PRESF	seafloor_pressure_burst	834	array<quantity>	float32		dbar	-9999	\N			{"PFID17":"CP03ISSM-MF005-02-PRESFB999"}	SFLPRES_L1
SP_TEST	CTDBP-NO	oxy_calphase	835	quantity	int32		counts	-9999	\N				
SP_TEST	CTDBP-NO	oxy_temp	836	quantity	int32		counts	-9999	\N				
SP_TEST	BOTPT	sensor_id	837	constant<str>	S6		1	empty	\N				
SP_TEST	BOTPT	time_sync_flag	838	category<int8:str>	int8	{0:"V",1:"P",-99:"empty"}	1	-99	\N				
SP_TEST	BOTPT	lily_x_tilt	839	quantity	float32		µrad	-9999	\N				BOTTILT-XTILT
SP_TEST	BOTPT	lily_y_tilt	840	quantity	float32		µrad	-9999	\N				BOTTILT-YTILT
SP_TEST	BOTPT	compass_direction	841	quantity	float32		degrees	-9999	\N				BOTTILT-SCMP
SP_TEST	BOTPT	supply_voltage	842	quantity	float32		V	-9999	\N				TLTVOLT
SP_TEST	BOTPT	press_trans_temp	843	quantity	float64		deg_C	-9999	\N				NPTTEMP
SP_TEST	BOTPT	heat_x_tilt	844	quantity	int16		degrees	-9999	\N				CRTTILT-XTILT
SP_TEST	BOTPT	heat_y_tilt	845	quantity	int16		degrees	-9999	\N				CRTTILT-YTILT
SP_TEST	BOTPT	iris_x_tilt	846	quantity	float32		degrees	-9999	\N				LRTTILT-XTILT
SP_TEST	BOTPT	iris_y_tilt	847	quantity	float32		degrees	-9999	\N				LRTTILT-YTILT
SP_TEST	BOTPT	bottom_pressure	848	quantity	float32		psi	-9999	\N			{"PFID17":"RS03CCAL-MJ03F-05-BOTPTA302"}	BOTPRES_L1
SP_TEST	BOTPT	lily_temp	849	quantity	float32		deg_C	-9999	\N				TLTTEMP
SP_TEST	BOTPT	iris_temp	850	quantity	float32		deg_C	-9999	\N				LRTTEMP
SP_TEST	BOTPT	heat_temp	851	quantity	int16		deg_C	-9999	\N				CRTTEMP
SP_TEST	BOTPT	seafloor_tilt_magnitude	852	quantity	float32		µrad	-9999	\N				BOTTILT-TMAG
SP_TEST	BOTPT	seafloor_tilt_direction	853	quantity	float32		degrees	-9999	\N				BOTTILT-TDIR
LC_TEST		TEMPWAT_L0	857	quantity	float64		deg_C	-9999	\N				
LC_TEST		CONDWAT_L0	858	quantity	float64			-9999	\N				
LC_TEST		PRESWAT_L0	859	quantity	float64			-9999	\N				
LC_TEST		TEMPWAT_L1	854	function	float64		deg_C	-9999	1	{"T": "PD857"}			
LC_TEST		CONDWAT_L1	855	function	float64			-9999	2	{"C":"PD858"}			
LC_TEST		PRESWAT_L1	856	function	float64			-9999	3	{"P": "PD859", "p_range": 679.34040721}			
LC_TEST		PRACSAL_L2	860	function	float64			-9999	5	{"C": {"PFID4": {"C": "PD855"}}, "t": "PD854", "p": "PD856"}			
LC_TEST		absolute_salinity	861	function	float64			-9999	7	{"sp":{"PFID5":{"C": {"PFID4": {"C": "PD855"}}, "t": "PD854", "p": "PD856"}},"p":"PD856", "lon":"PD9","lat":"PD8"}			
LC_TEST		rho	862	function	float64			-9999	8	{"SP":{"PFID5":{"C": {"PFID4": {"C": "PD855"}}, "t": "PD854", "p": "PD856"}}, "p":"PD856", "t":"PD854", "lat":"PD8","lon":"PD9"}			
BASE		ingestion_timestamp	863	quantity	float64		seconds since 1900-01-01	-9999	\N				
LC_TEST		conductivity_L1	864	function	float32		mS cm-1	-9999	9	{"conductivity":"PD1"}			
LC_TEST		pressure_L1	865	function	float32		dbar	-9999	10	{"pressure":"PD2"}			
LC_TEST		temp_L1	866	function	float32		deg_C	-9999	11	{"temperature":"PD6"}			
LC_TEST		salinity	867	function	float32			-9999	13	{"conductivity":"PD864", "temp":"PD866", "pressure":"PD865"}			
LC_TEST		density	868	function	float32			-9999	12	{"conductivity":"PD864", "temp":"PD866", "pressure":"PD865", "lat":"PD8", "lon":"PD9"}			
CW_TEST	ADCP-PD0	beam_1_velocity	869	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-B1
CW_TEST	ADCP-PD0	beam_2_velocity	870	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-B2
CW_TEST	ADCP-PD0	beam_3_velocity	871	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-B3
CW_TEST	ADCP-PD0	beam_4_velocity	872	array<quantity>	int16		mm s-1	-32768	\N				VELPROF-B4
CW_TEST	ADCP-PD0	percent_good_beam1	873	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	percent_good_beam2	874	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	percent_good_beam3	875	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	percent_good_beam4	876	array<quantity>	uint8		percent	255	\N				
CW_TEST	ADCP-PD0	real_time_clock	877	array<quantity>	int16		1	-128	\N				
SP_TEST	VEL3D-B	turbulent_velocity_east	878	quantity	float32		m s-1	-9999	\N				VELPTTU-VLE_L1
SP_TEST	VEL3D-B	turbulent_velocity_north	879	quantity	float32		m s-1	-9999	\N				VELPTTU-VLN_L1
SP_TEST	VEL3D-B	turbulent_velocity_vertical	880	quantity	float32		m s-1	-9999	\N				VELPTTU-VLU_L1
CW_TEST	ADCP-CompCal	calibration_temp	881	quantity	float32		deg_C	-9999	\N				
CW_TEST	OPTAA	absorption_coefficient	882	quantity	float32		m-1	-9999	\N				OPTABSN_L2
CW_TEST	OPTAA	attenuation_coefficient	883	quantity	float32		m-1	-9999	\N				OPTATTN_L2
BASE		input_voltage	884	quantity	float32		V	-9999	\N				
BASE		input_bus_current	885	quantity	float32		A	-9999	\N				
BASE		mvpc_temperature	886	quantity	float32		deg_C	-9999	\N				
BASE		mvpc_pressure_1	887	quantity	float32		psi	-9999	\N				
SP_TEST	DOSTA	oxygen	888	quantity	float32		μmol kg-1	-9999	\N				DOCONCS_L2
LC_TEST		calibrated_temperature	889	function	float32		deg_C	-9999	14	{"temperature":"PD6","offset":"LV_coeffA"}			
LC_TEST		test_lookup_val	890	quantity	float32		1	-9999	\N		1		
CW_TEST	PRESF and PREST	seafloor_pressure	891	function	float32		dbar	-9999	6	{"p_psia":"PD94"}			SFLPRES_L1
LC_TEST		explicit_lookup	892	function	float32			-9999	15	{"lookup":"LV_lc_test||lookup_val"}			
LC_TEST		extended_calibrated_temperature	893	function	float32			-9999	16	{"lookup1":"LV_coeffA", "lookup2":"LV_lctest||lookup_val"}			
LC_TEST		qc_temp_global_range	894	function	float32		1	-9999	17	{"dat":"PD866", "dat_min":"LV_grt_TEST_TEMPWAT_TEMPWAT||grt_min_value", "dat_max":"LV_grt_TEST_TEMPWAT_TEMPWAT||grt_max_value"}			
LC_TEST		qc_pressure_global_range	895	function	float32		1	-9999	17	{"dat":"PD865", "dat_min":"LV_grt_TEST_PRESWAT_PRESWAT||grt_min_value", "dat_max":"LV_grt_TEST_PRESWAT_PRESWAT||grt_max_value"}			
LC_TEST		qc_conductivity_global_range	896	function	float32		1	-9999	17	{"dat":"PD864", "dat_min":"LV_grt_TEST_CONDWAT_CONDWAT||grt_min_value", "dat_max":"LV_grt_TEST_CONDWAT_CONDWAT||grt_max_value"}			
LC_TEST		lookup_density	897	function	float32		kg m-3	-9999	12	{"conductivity":"PD864", "temp": "PD866", "pressure":"PD865", "lat":"LV_lat","lon":"LV_lon"}			
LC_TEST		salinity	900	function	float32		1	-9999	26	{"c":"PD1", "t":"PD6", "p":"PD2"}			PRACSAL_L2
LC_TEST		density	901	function	float32		kg m-3	-9999	27	{"SP":"PD900","t":"PD6","p":"PD2", "lat":"lat","lon":"lon"}			DENSITY_L2
CW_TEST	ADCP	eastward_seawater_velocity	902	function	float32		mm s-1	-9999	28				VELPROF-VLE_L0
CW_TEST	ADCP	northward_seawater_velocity	903	function	float32		mm s-1	-9999	29				VELPROF-VLN_L0
CW_TEST	ADCP	upward_seawater_velocity	904	function	float32		mm s-1	-9999	30				VELPROF-VLU_L0
CW_TEST	ADCP	error_velocity	905	function	float32		mm s-1	-9999	31				VELPROF-ERR_L0
BETA	CTDBP	seawater_temperature	908	function	float32		deg_C	-9999	35	{"t0":"PD193","a0":"LV_a0","a1":"LV_a1","a2":"LV_a2","a3":"LV_a3"}		["TEMPWAT","reference_designator"]	TEMPWAT_L1
BETA	CTDBP	seawater_pressure	909	function	float32		dbar	-9999	36	{"p0":"PD195","therm0":"PD196","ptempa0":"LV_ptempa0","ptempa1":"LV_ptempa1","ptempa2":"LV_ptempa2","ptca0":"LV_ptca0","ptca1":"LV_ptca1","ptca2":"LV_ptca2","ptcb0":"LV_ptcb0","ptcb1":"LV_ptcb1","ptcb2":"LV_ptcb2","pa0":"LV_pa0","pa1":"LV_pa1","pa2":"LV_pa2"}		["PRESWAT","reference_designator"]	PRESWAT_L1
BETA	CTDBP	seawater_conductivity	910	function	float32		S m-1	-9999	37	{"c0":"PD194","t1":"PD908","p1":"PD909","g":"LV_g","h":"LV_h","i":"LV_i","j":"LV_j","cpcor":"LV_cpcor","ctcor":"LV_ctcor"}		["CONDWAT","reference_designator"]	CONDWAT_L1
BETA	CTDBP	practical_salinity	911	function	float32		1	-9999	26	{"c":"PD910","t":"PD908","p":"PD909"} 		["PRACSAL","reference_designator"]	PRACSAL_L2
BETA	CTDBP	seawater_density	912	function	float32		kg m-3	-9999	27	{"SP":"PD911","t":"PD908","p":"PD909","lat":"PD8","lon":"PD9"}		["DENSITY","reference_designator"]	DENSITY_L2
\.


--
-- Data for Name: parameterdictionaries; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY parameterdictionaries (scenario, id, confluence, name, parameter_ids, temporal_parameter) FROM stdin;
BASE	1		ctd_parsed_param_dict	PD863,PD7,PD10,PD11,PD12,PD16,PD8,PD9,PD2,PD1,PD6,PD3,PD5,PD17	7
BASE	2	OBSOLETE: use "raw"	ctd_raw_param_dict	PD7,PD10,PD11,PD12,PD16,PD8,PD9,PD17,PD26,PD863	7
BASE	3		graph_image_param_dict	PD18,PD19,PD21,PD22,PD20,PD863	18
BASE	4		google_dt	PD18,PD23,PD863	18
BASE	5	ISSUE: Needs time param	mpl_graph	PD18,PD24,PD863	18
BASE	7		platform_eng_parsed	PD7,PD12,PD16,PD8,PD9,PD863,PD884,PD885,PD886,PD887	7
BASE	9		raw	PD7,PD10,PD11,PD12,PD16,PD8,PD9,PD17,PD26,PD863	7
BETA	15		presf_tide_measurement	PD7,PD10,PD11,PD12,PD16,PD93,PD94,PD29,PD742,PD863	7
BETA	16		presf_operating_status	PD7,PD10,PD11,PD12,PD16,PD113,PD114,PD93,PD115,PD116,PD117,PD118,PD119,PD120,PD121,PD122,PD123,PD124,PD126,PD127,PD128,PD129,PD130,PD131,PD132,PD133,PD134,PD135,PD136,PD137,PD138,PD139,PD140,PD141,PD142,PD143,PD144,PD156,PD157,PD863	7
BETA	17		presf_calibration_coefficients	PD7,PD10,PD11,PD12,PD16,PD158,PD159,PD160,PD161,PD162,PD163,PD164,PD165,PD166,PD167,PD168,PD169,PD170,PD171,PD172,PD173,PD174,PD175,PD176,PD177,PD178,PD179,PD180,PD181,PD182,PD183,PD184,PD185,PD186,PD187,PD863	7
BETA	19		ctdbp_cdef_sample	PD7,PD10,PD11,PD12,PD16,PD193,PD194,PD195,PD196,PD198,PD863	7
BETA	20		ctdbp_cdef_status	PD7, PD10, PD11,PD12,PD16,PD113,PD114,PD93,PD121,PD122,PD120,PD199,PD202,PD203,PD204,PD205,PD206,PD207, PD208, PD209, PD210, PD211, PD212, PD117, PD213, PD214, PD215, PD216, PD217, PD218, PD219, PD220, PD221, PD222, PD223, PD224, PD225, PD226, PD227, PD228,PD863	7
BETA	21		ctdbp_cdef_calibration_coefficients	PD7, PD10, PD11, PD12, PD16, PD113, PD114, PD93, PD175, PD176, PD177, PD178, PD179, PD229, PD180, PD181, PD182, PD183, PD184, PD186, PD185, PD187, PD230, PD117, PD158, PD231, PD232, PD233, PD234, PD235, PD236, PD237, PD238, PD239, PD240, PD241, PD242, PD174, PD244, PD243, PD246, PD245, PD248, PD247, PD250, PD249, PD252, PD251, PD254, PD253, PD255,PD863	7
SP_TEST	23		ctdbp_no_sample	PD7, PD10, PD11, PD12, PD16, PD193, PD194, PD195, PD196, PD835, PD836, PD197, PD198,PD863	7
SP_TEST	24		ctdbp_no_hardware	PD7, PD10, PD11, PD12, PD16, PD114, PD113, PD293, PD259, PD295, PD261, PD297, PD257, PD258, PD212, PD116,PD863	7
SP_TEST	25		ctdbp_no_calibration_coefficients	PD7, PD10, PD11, PD12, PD16, PD113, PD114, PD93, PD257, PD175, PD176, PD177, PD178, PD179, PD229, PD258, PD180, PD181, PD182, PD183, PD184, PD186, PD185, PD187, PD230, PD158, PD163, PD164, PD165, PD166, PD167, PD168, PD169, PD170, PD171, PD256, PD174, PD117, PD244, PD243, PD246, PD245, PD248, PD247, PD250, PD249, PD252, PD251, PD254, PD253, PD255,PD863	7
SP_TEST	26		ctdbp_no_status	PD7, PD10, PD11, PD12, PD16, PD114, PD93, PD202, PD263, PD121, PD122, PD120, PD199, PD200, PD201, PD204, PD203, PD264, PD265, PD266,PD863	7
SP_TEST	27		ctdbp_no_configuration	PD7, PD10, PD11, PD12, PD16, PD114, PD205, PD206, PD260, PD207, PD208, PD209, PD210, PD211, PD218, PD219, PD220, PD221, PD222, PD223, PD213, PD214, PD215, PD216, PD217, PD224, PD267, PD225, PD226, PD227, PD262, PD228,PD863	7
SP_TEST	28		parad_sa_sample	PD7, PD10, PD11, PD12, PD16, PD114, PD28, PD188, PD15,PD863	7
BETA	31		prest_real_time	PD7,PD10,PD11,PD12,PD16,PD73,PD74,PD93,PD94,PD29,PD863	7
BETA	32		prest_reference_oscillator	PD7,PD10,PD11,PD12,PD16,PD268,PD269,PD73,PD74,PD93,PD271,PD272,PD273,PD863	7
BETA	33		prest_configuration_data	PD7,PD10,PD11,PD12,PD16,PD274,PD114,PD275,PD276,PD277,PD278,PD279,PD280,PD158,PD159,PD160,PD161,PD162,PD163,PD164,PD165,PD166,PD167,PD168,PD169,PD170,PD171,PD174,PD281,PD282,PD283,PD284,PD285,PD286,PD863	7
BETA	34		prest_device_status	PD7,PD10,PD11,PD12,PD16,PD274,PD287,PD114,PD93,PD288,PD121,PD73,PD289,PD290,PD863	7
BETA	35		prest_event_counter	PD7,PD10,PD11,PD16,PD274,PD114,PD299,PD300,PD301,PD302,PD303,PD304,PD305,PD306,PD307,PD308,PD309,PD863	7
BETA	36		prest_hardware_data	PD7,PD10,PD11,PD16,PD274,PD114,PD291,PD113,PD293,PD294,PD295,PD296,PD297,PD863	7
CW_TEST	38		nutnr_b_sample	PD7,PD10,PD11,PD12,PD16,PD310,PD312,PD313,PD314,PD315,PD316,PD317,PD318,PD319,PD320,PD321,PD322,PD323,PD324,PD325,PD326,PD327,PD328,PD329,PD330,PD331,PD332,PD333,PD863	7
CW_TEST	39		nutnr_b_status	PD7,PD10,PD11,PD16,PD334,PD335,PD336,PD337,PD338,PD339,PD340,PD113,PD293,PD343,PD114,PD345,PD346,PD347,PD327,PD320,PD321,PD322,PD348,PD349,PD350,PD351,PD352,PD863	7
CW_TEST	41		pco2w_b_control_record	PD7,PD10,PD11,PD12,PD16,PD353,PD354,PD355,PD356,PD333,PD863	7
CW_TEST	42		pco2w_b_data_record	PD7,PD10,PD11,PD12,PD16,PD353,PD354,PD355,PD356,PD357,PD358,PD359,PD333,PD863	7
CW_TEST	43		pco2w_b_immediate_status	PD7,PD10,PD11,PD16,PD360,PD361,PD362,PD363,PD364,PD863	7
CW_TEST	44		pco2w_b_regular_status	PD7,PD10,PD11,PD12,PD16,PD365,PD366,PD367,PD368,PD369,PD370,PD371,PD372,PD373,PD374,PD375,PD376,PD377,PD378,PD379,PD863	7
CW_TEST	45		pco2w_b_configuration	PD7,PD10,PD11,PD12,PD16,PD380,PD381,PD382,PD383,PD384,PD385,PD386,PD387,PD388,PD389,PD390,PD391,PD392,PD393,PD394,PD395,PD396,PD397,PD398,PD399,PD400,PD401,PD402,PD403,PD404,PD405,PD406,PD407,PD408,PD409,PD410,PD411,PD412,PD413,PD414,PD415,PD416,PD417,PD418,PD419,PD420,PD863	7
SP_TEST	47		trhph_sample	PD7, PD10, PD11, PD12, PD16, PD421, PD422, PD423, PD424, PD425, PD426, PD427, PD428, PD429, PD430, PD431, PD432,PD863	7
CW_TEST	49		velpt_hardware_configuration	PD7,PD10,PD11,PD16,PD461,PD462,PD463,PD464,PD465,PD466,PD467,PD468,PD113,PD863	7
CW_TEST	50		velpt_head_configuration	PD7,PD10,PD11,PD16,PD470,PD471,PD472,PD473,PD474,PD475,PD476,PD477,PD478,PD863	7
CW_TEST	51		velpt_user_configuration	PD7,PD10,PD11,PD16,PD479,PD480,PD481,PD482,PD483,PD484,PD485,PD478,PD487,PD488,PD489,PD490,PD491,PD492,PD493,PD494,PD495,PD496,PD497,PD498,PD499,PD500,PD501,PD502,PD503,PD504,PD505,PD506,PD507,PD508,PD509,PD510,PD511,PD512,PD513,PD514,PD515,PD516,PD517,PD518,PD519,PD520,PD521,PD522,PD523,PD525,PD526,PD527,PD528,PD529,PD530,PD531,PD532,PD533,PD534,PD863	7
CW_TEST	52		velpt_velocity_data	PD7,PD10,PD11,PD12,PD16,PD93,PD433,PD434,PD432,PD435,PD436,PD437,PD438,PD2,PD439,PD440,PD441,PD442,PD443,PD444,PD445,PD446,PD863	7
CW_TEST	53		velpt_diagostics_header	PD7,PD10,PD11,PD16,PD447,PD448,PD449,PD450,PD451,PD452,PD453,PD454,PD455,PD456,PD457,PD458,PD459,PD460,PD863	7
CW_TEST	54		velpt_diagnostics_data	PD7,PD10,PD11,PD12,PD16,PD93,PD433,PD434,PD432,PD435,PD436,PD437,PD438,PD2,PD439,PD440,PD441,PD442,PD443,PD444,PD445,PD446,PD863	7
CW_TEST	56		vel3d_cd_hardware_configuration	PD7,PD10,PD11,PD16,PD461,PD462,PD463,PD464,PD465,PD466,PD467,PD468,PD113,PD863	7
CW_TEST	57		vel3d_cd_head_configuration	PD7,PD10,PD11,PD16,PD470,PD471,PD472,PD473,PD474,PD475,PD476,PD477,PD478,PD863	7
CW_TEST	58		vel3d_cd_user_configuration	PD7,PD10,PD11,PD16,PD479,PD480,PD481,PD482,PD483,PD484,PD485,PD478,PD487,PD488,PD489,PD490,PD491,PD492,PD493,PD494,PD495,PD496,PD497,PD498,PD499,PD500,PD501,PD502,PD503,PD504,PD505,PD506,PD507,PD508,PD509,PD510,PD511,PD512,PD513,PD514,PD515,PD516,PD517,PD518,PD519,PD520,PD521,PD522,PD523,PD526,PD525,PD527,PD528,PD529,PD530,PD531,PD532,PD533,PD534,PD863	7
LC_TEST	59		luke_test	PD7,PD6,PD26,PD863	7
CW_TEST	61		optaa_sample	PD7,PD10,PD11,PD12,PD16,PD583,PD584,PD585,PD114,PD586,PD587,PD588,PD589,PD590,PD591,PD592,PD593,PD594,PD595,PD596,PD597,PD598,PD863	7
CW_TEST	62		optaa_status	PD7,PD10,PD11,PD12,PD16,PD599,PD293,PD600,PD601,PD603,PD863	7
TMPSF	64		tmpsf_sample	PD7,PD10,PD11,PD12,PD16,PD93,PD603,PD432,PD863	7
TMPSF	65		tmpsf_engineering	PD7,PD10,PD11,PD12,PD16,PD604,PD432,PD863	7
VEL3D_B	67		vel3d_b_sample	PD7, PD10, PD11, PD12, PD16, PD93, PD535, PD536, PD537, PD538, PD539, PD540, PD541, PD440, PD542, PD543, PD437, PD438,PD863	7
VEL3D_B	68		vel3d_b_engineering	PD7, PD10, PD11, PD12, PD16, PD733, PD734, PD735, PD736, PD737, PD738, PD739, PD740, PD741,PD863	7
BETA	69		presf_tide_converted	PD7,PD95,PD863	7
CW_TEST	70		adcp_pd0_earth_parsed	PD698,PD654,PD655,PD656,PD657,PD650,PD651,PD652,PD653,PD709,PD658,PD659,PD728,PD729,PD724,PD725,PD726,PD727,PD720,PD721,PD722,PD723,PD621,PD620,PD623,PD622,PD625,PD624,PD627,PD626,PD629,PD628,PD710,PD719,PD718,PD632,PD633,PD630,PD631,PD636,PD637,PD634,PD635,PD638,PD639,PD743,PD701,PD609,PD608,PD607,PD606,PD605,PD687,PD686,PD685,PD684,PD683,PD682,PD681,PD680,PD689,PD688,PD12,PD11,PD10,PD16,PD618,PD619,PD711,PD610,PD611,PD612,PD613,PD614,PD615,PD616,PD617,PD690,PD691,PD692,PD693,PD694,PD695,PD696,PD697,PD7,PD699,PD731,PD648,PD715,PD714,PD717,PD716,PD669,PD668,PD713,PD664,PD667,PD666,PD661,PD660,PD663,PD662,PD708,PD785,PD706,PD707,PD704,PD705,PD702,PD703,PD678,PD679,PD676,PD677,PD674,PD675,PD672,PD673,PD670,PD671,PD863,PD730,PD732,PD649,PD877,PD700,PD643,PD642,PD641,PD640,PD647,PD646,PD645,PD644	7
CW_TEST	71		adcp_pd12_parsed	PD7,PD10,PD11,PD12,PD16,PD784,PD607,PD664,PD661,PD611,PD612,PD877,PD785,PD672,PD673,PD674,PD676,PD710,PD788,PD789,PD790,PD791,PD792,PD793,PD794,PD714,PD715,PD716,PD717,PD743,PD863	7
CW_TEST	72		adcp_waves_parsed	PD7,PD10,PD11,PD12,PD16,PD744,PD745,PD608,PD747,PD748,PD749,PD750,PD751,PD752,PD753,PD754,PD755,PD651,PD757,PD758,PD759,PD877,PD760,PD761,PD762,PD676,PD764,PD765,PD766,PD710,PD768,PD769,PD770,PD672,PD673,PD674,PD774,PD775,PD776,PD777,PD778,PD779,PD780,PD781,PD782,PD783,PD743,PD863	7
CW_TEST	73		adcp_compass_calibration	PD7,PD10,PD11,PD16,PD795,PD796,PD797,PD798,PD799,PD800,PD801,PD802,PD881,PD803,PD804,PD805,PD806,PD863	7
CW_TEST	74		adcp_system_configuration	PD7,PD10,PD11,PD16,PD312,PD807,PD808,PD809,PD810,PD811,PD812,PD813,PD814,PD815,PD816,PD817,PD818,PD819,PD820,PD821,PD822,PD823,PD824,PD825,PD826,PD827,PD828,PD863	7
CW_TEST	75		vel3d_cd_data_header	PD7,PD10,PD11,PD12,PD16,PD93,PD571,PD572,PD573,PD574,PD575,PD576,PD577,PD863	7
CW_TEST	76		vel3d_cd_velocity_data	PD7,PD10,PD11,PD16,PD547,PD548,PD549,PD550,PD551,PD552,PD553,PD554,PD555,PD556,PD557,PD558,PD559 ,PD863	7
CW_TEST	77		vel3d_cd_system_data	PD7,PD10,PD11,PD12,PD16,PD93,PD432,PD562,PD436,PD437,PD438,PD440,PD567,PD568,PD569,PD863	7
CW_TEST	78		vel3d_cd_clock_data	PD7,PD10,PD11,PD12,PD16,PD829,PD830,PD863	7
CW_TEST	79		vel3d_cd_battery_voltage	PD7,PD10,PD11,PD16,PD831,PD863	7
CW_TEST	80		vel3d_cd_identification_string	PD7,PD10,PD11,PD16,PD832,PD863	7
CW_TEST	81		velpt_clock_data	PD7,PD10,PD11,PD12,PD16,PD829,PD830,PD863	7
CW_TEST	82		velpt_battery_voltage	PD7,PD10,PD11,PD16,PD831,PD863	7
CW_TEST	83		velpt_identification_string	PD7,PD10,PD11,PD16,PD832,PD863	7
BETA	84		presf_wave_burst	PD7,PD10,PD11,PD12,PD16,PD93,PD96,PD833,PD863	7
BETA	85		presf_wave_statistics	PD7,PD10,PD11,PD16,PD97,PD98,PD99,PD100,PD101,PD102,PD103,PD104,PD105,PD106,PD107,PD108,PD109,PD110,PD111,PD112,PD863	7
BETA	86		prest_l1_pressure	PD7,PD95,PD863	7
SP_TEST	87		botpt_nano_sample	PD7,PD10,PD11,PD12,PD16, PD837, PD838, PD93, PD848, PD843,PD863	7
SP_TEST	88		botpt_lily_sample	PD7,PD10,PD11,PD12,PD16, PD837, PD93, PD839, PD840, PD841, PD849, PD842, PD312,PD863	7
SP_TEST	89		botpt_iris_sample	PD7,PD10,PD11,PD12,PD16, PD837, PD93, PD846, PD847, PD850, PD312,PD863	7
SP_TEST	90		botpt_heat_sample	PD7,PD10,PD11,PD12,PD16, PD837, PD93, PD844, PD845, PD851,PD863	7
BETA	91		ctdbp_cdef_L0	PD7,PD193,PD194,PD195,PD863	7
BETA	92		ctdbp_cdef_L1	PD7,PD6,PD1,PD2,PD863	7
BETA	93		ctdbp_cdef_L2_pracsal	PD7,PD3,PD863	7
BETA	94		ctdbp_cdef_L2_density	PD7,PD5,PD863	7
LC_TEST	95		sbe37_L0_test	PD7,PD8,PD9,PD857,PD858,PD859,PD863	7
LC_TEST	96		sbe37_L1_test	PD7,PD8,PD9,PD854,PD855,PD856,PD863	7
LC_TEST	97		sbe37_LC_TEST	PD7,PD8,PD9,PD857,PD858,PD859,PD854,PD855,PD856,PD860,PD861,PD862,PD863	7
LC_TEST	98		ctd_LC_TEST	PD17,PD866,PD864,PD863,PD10,PD2,PD8,PD11,PD1,PD16,PD6,PD868,PD865,PD9,PD867,PD12,PD7,PD897,PD894,PD895,PD896	7
SP_TEST	99		vel3d_b_L0	PD7, PD539, PD540, PD541 , PD863	7
SP_TEST	100		vel3d_b_L1	PD7, PD878, PD879, PD880 , PD863	7
TMPSF	103		tmpsf_L1	PD7, PD603, PD863	7
LC_TEST	104		lookup_value_test	PD7,PD6,PD889,PD893,PD863	7
LC_TEST	105		lookup_value_static_test	PD7,PD890,PD863	7
LC_TEST	106		explicit_lookup_value	PD7,PD892,PD863,PD894	7
LC_TEST	107		global_range_ctp	PD7,PD894,PD895,PD896,PD863	7
CW_TEST	108		adcp_pd0_beam_parsed	PD698,PD654,PD655,PD656,PD657,PD650,PD651,PD652,PD653,PD709,PD658,PD659,PD728,PD724,PD725,PD726,PD727,PD720,PD721,PD722,PD723,PD621,PD620,PD623,PD622,PD625,PD624,PD627,PD626,PD629,PD628,PD710,PD719,PD718,PD632,PD633,PD630,PD631,PD636,PD637,PD634,PD635,PD638,PD639,PD743,PD701,PD609,PD608,PD607,PD606,PD605,PD687,PD686,PD685,PD684,PD683,PD682,PD681,PD680,PD689,PD688,PD12,PD11,PD10,PD16,PD618,PD619,PD711,PD610,PD611,PD612,PD613,PD614,PD615,PD616,PD617,PD690,PD691,PD692,PD693,PD694,PD695,PD696,PD697,PD7,PD699,PD876,PD648,PD871,PD669,PD668,PD713,PD664,PD667,PD666,PD661,PD660,PD663,PD662,PD708,PD785,PD706,PD707,PD704,PD705,PD702,PD703,PD678,PD679,PD676,PD677,PD674,PD675,PD672,PD673,PD670,PD671,PD869,PD863,PD874,PD875,PD649,PD877,PD870,PD700,PD872,PD873,PD643,PD642,PD641,PD640,PD647,PD646,PD645,PD644	7
BETA	109		ctd_external_dataset	PD7, PD10, PD11, PD12, PD16, PD193, PD194, PD195, PD196, PD835, PD836, PD197, PD198,PD863	7
\.


--
-- Data for Name: parameterfunctions; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY parameterfunctions (scenario, id, name, instrument_class, instrument_series, function_type, function, owner, args, kwargs) FROM stdin;
LC_TEST	1	TEMPWAT_L1	CTDMO		NumexprFunction	(T / 10000) - 10		["T"]	
LC_TEST	2	CONDWAT_L1	CTDMO		NumexprFunction	(C / 100000) - 0.5		["C"]	
LC_TEST	3	PRESWAT_L1	CTDMO		NumexprFunction	(P * p_range / (0.85 * 65536)) - (0.05 * p_range)		["P", "p_range"]	
LC_TEST	4	CONDWAT_10	CTDMO		NumexprFunction	C*10		["C"]	
LC_TEST	5	PRACSAL_L2	CTDMO		PythonFunction	sp_from_c	pygsw.vectors	["C","t","p"] 	
CW_TEST	6	SFLPRES_L1	PRESF, PREST	A, B	NumexprFunction	p_psia * 0.689475728		["p_psia"]	
LC_TEST	7	sa	CTDMO		PythonFunction	sa_from_sp	pygsw.vectors	["sp","p","lon","lat"]	
LC_TEST	8	rho	CTDMO		PythonFunction	data_density	ion_functions.data.data_functions	["SP","p","t","lat","lon"]	
LC_TEST	9	conductivity_L1	TEST		NumexprFunction	(conductivity / 100000.0) - 0.5		["conductivity"]	
LC_TEST	10	pressure_L1	TEST		NumexprFunction	(pressure / 100.0) + 0.5		["pressure"]	
LC_TEST	11	temp_L1	TEST		NumexprFunction	(temperature / 10000.0) - 10		["temperature"]	
LC_TEST	12	density_L2	TEST		PythonFunction	data_l2_density	ion_functions.workflow_tests.fake_data	["conductivity", "temp", "pressure", "lat", "lon"]	
LC_TEST	13	salinity_L2	TEST		PythonFunction	data_l2_salinity	ion_functions.workflow_tests.fake_data	["conductivity", "temp", "pressure"]	
LC_TEST	14	calibrated_temperature	TEST		NumexprFunction	(temperature + offset)		["temperature", "offset"]	
LC_TEST	15	explicit_lookup	TEST		NumexprFunction	lookup		["lookup"]	
LC_TEST	16	extended_calibrated_temperature	TEST		NumexprFunction	lookup1 + lookup2		["lookup1", "lookup2"]	
LC_TEST	17	global_range_test	TEST		PythonFunction	dataqc_globalrangetest_minmax	ion_functions.qc.qc_functions	["dat","dat_min","dat_max"]	
LC_TEST	18	dataqc_localrangetest			PythonFunction	dataqc_localrangetest	ion_functions.qc.qc_functions	["dat","z","datlim","datlimz"]	
LC_TEST	19	dataqc_spiketest			PythonFunction	dataqc_spiketest	ion_functions.qc.qc_functions	["dat","acc","N","L"]	
LC_TEST	20	dataqc_polytrendtest			PythonFunction	dataqc_polytrendtest	ion_functions.qc.qc_functions	["dat","t","ord_n","ntsd"]	
LC_TEST	21	dataqc_stuckvaluetest			PythonFunction	dataqc_stuckvaluetest	ion_functions.qc.qc_functions	["x","reso","num"]	
LC_TEST	22	dataqc_gradienttest			PythonFunction	dataqc_gradienttest	ion_functions.qc.qc_functions	["dat","x","ddatdx","mindx","startdat","toldat"]	
LC_TEST	23	dataqc_solarelevation			PythonFunction	dataqc_solarelevation	ion_functions.qc.qc_functions	["lon","lat","dt"]	
LC_TEST	24	dataqc_propogateflags			PythonFunction	dataqc_propogateflags	ion_functions.qc.qc_functions	["inflags"]	
LC_TEST	25	dataqc_condcompress			PythonFunction	dataqc_condcompress	ion_functions.qc.qc_functions	["p_orig","p_new","c_orig","cpcor"]	
BETA	26	ctd_pracsal			PythonFunction	ctd_pracsal	ion_functions.data.ctd_functions	["c","t","p"] 	
BETA	27	ctd_density			PythonFunction	ctd_density	ion_functions.data.ctd_functions	["SP","t","p","lat","lon"]	
LC_TEST	28	adcp_beam_eastward	ADCPS, ADCPT	(I,K), (B,D,E)	PythonFunction	adcp_beam_eastward	ion_functions.data.adcp_functions	["b1","b2","b3","b4","h","p","r","v","lat","lon","z","dt"]	
LC_TEST	29	adcp_beam_northward	ADCPS, ADCPT	(I,K), (B,D,E)	PythonFunction	adcp_beam_northward	ion_functions.data.adcp_functions	["b1","b2","b3","b4","h","p","r","v","lat","lon","z","dt"]	
LC_TEST	30	adcp_beam_vertical	ADCPS, ADCPT	(I,K), (B,D,E)	PythonFunction	adcp_beam_vertical	ion_functions.data.adcp_functions	["b1","b2","b3","b4","h","p","r","v"]	
LC_TEST	31	adcp_beam_error	ADCPS, ADCPT	(I,K), (B,D,E)	PythonFunction	adcp_beam_error	ion_functions.data.adcp_functions	["b1","b2","b3","b4"]	
BETA	35	ctd_sbe16plus_tempwat	CTDBP	C,D,E,F,N,O	PythonFunction	ctd_sbe16plus_tempwat	ion_functions.data.ctd_functions	["t0","a0","a1","a2","a3"]	
BETA	36	ctd_sbe16plus_preswat	CTDBP	C,D,E,F,N,O	PythonFunction	ctd_sbe16plus_preswat	ion_functions.data.ctd_functions	["p0","therm0","ptempa0","ptempa1","ptempa2","ptca0","ptca1","ptca2","ptcb0","ptcb1","ptcb2","pa0","pa1","pa2"]	
BETA	37	ctd_sbe16plus_condwat	CTDBP	C,D,E,F,N,O	PythonFunction	ctd_sbe16plus_condwat	ion_functions.data.ctd_functions	["c0","t1","p1","g","h","i","j","cpcor","ctcor"]	
CW_TEST	38	adcp_scaling	ADCPA, ADCPS, ADCPT	All	NumexprFunction	velocity / 1000		["vel"]	
\.


--
-- Data for Name: parameterrelations; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY parameterrelations (parameter_id, pdict_id) FROM stdin;
9	1
8	1
7	1
6	1
5	1
3	1
2	1
1	1
12	1
11	1
10	1
17	1
16	1
863	1
863	2
9	2
8	2
7	2
12	2
11	2
10	2
17	2
16	2
26	2
863	3
19	3
18	3
22	3
20	3
21	3
863	4
18	4
23	4
863	5
24	5
18	5
9	7
8	7
7	7
885	7
884	7
887	7
886	7
12	7
16	7
863	7
863	9
9	9
8	9
7	9
12	9
11	9
10	9
17	9
16	9
26	9
863	15
7	15
742	15
12	15
11	15
10	15
16	15
29	15
93	15
94	15
140	16
141	16
142	16
122	16
93	16
128	16
129	16
144	16
7	16
123	16
120	16
121	16
126	16
127	16
124	16
143	16
863	16
117	16
116	16
115	16
114	16
113	16
119	16
118	16
139	16
138	16
157	16
156	16
131	16
130	16
133	16
132	16
135	16
134	16
137	16
136	16
12	16
11	16
10	16
16	16
180	17
181	17
182	17
183	17
184	17
185	17
186	17
187	17
166	17
167	17
164	17
165	17
162	17
163	17
160	17
161	17
7	17
168	17
169	17
863	17
175	17
174	17
177	17
176	17
171	17
170	17
173	17
172	17
159	17
158	17
179	17
178	17
12	17
11	17
10	17
16	17
198	19
7	19
196	19
195	19
194	19
193	19
12	19
11	19
10	19
16	19
863	19
203	20
10	20
11	20
122	20
93	20
202	20
207	20
206	20
205	20
204	20
7	20
120	20
121	20
208	20
209	20
228	20
226	20
227	20
224	20
225	20
222	20
223	20
220	20
221	20
199	20
863	20
114	20
113	20
217	20
216	20
215	20
214	20
213	20
212	20
211	20
210	20
219	20
218	20
12	20
117	20
16	20
176	21
177	21
174	21
175	21
158	21
240	21
178	21
179	21
12	21
245	21
10	21
11	21
16	21
242	21
241	21
243	21
252	21
248	21
249	21
7	21
182	21
181	21
180	21
187	21
186	21
185	21
184	21
229	21
863	21
93	21
244	21
247	21
253	21
246	21
251	21
250	21
255	21
254	21
114	21
183	21
117	21
239	21
238	21
113	21
235	21
234	21
237	21
236	21
231	21
230	21
233	21
232	21
198	23
7	23
195	23
196	23
197	23
836	23
835	23
193	23
12	23
194	23
10	23
11	23
16	23
863	23
114	24
259	24
261	24
212	24
7	24
257	24
295	24
293	24
116	24
258	24
12	24
297	24
10	24
11	24
16	24
113	24
863	24
176	25
177	25
174	25
175	25
170	25
171	25
158	25
178	25
179	25
12	25
245	25
10	25
11	25
16	25
243	25
252	25
248	25
249	25
7	25
182	25
181	25
180	25
187	25
186	25
185	25
184	25
229	25
863	25
93	25
244	25
165	25
164	25
167	25
166	25
163	25
169	25
168	25
258	25
253	25
246	25
251	25
250	25
257	25
256	25
255	25
254	25
114	25
183	25
117	25
113	25
230	25
247	25
114	26
863	26
266	26
199	26
264	26
263	26
7	26
120	26
122	26
12	26
121	26
10	26
11	26
16	26
265	26
201	26
200	26
93	26
202	26
203	26
204	26
12	27
10	27
11	27
16	27
262	27
205	27
260	27
267	27
7	27
208	27
209	27
228	27
226	27
227	27
224	27
225	27
222	27
223	27
220	27
221	27
863	27
217	27
216	27
215	27
214	27
213	27
211	27
210	27
219	27
218	27
114	27
206	27
207	27
114	28
188	28
7	28
15	28
12	28
10	28
11	28
16	28
28	28
863	28
863	31
74	31
7	31
12	31
11	31
10	31
16	31
73	31
29	31
93	31
94	31
272	32
273	32
271	32
74	32
7	32
268	32
269	32
863	32
12	32
11	32
10	32
16	32
73	32
93	32
282	33
166	33
167	33
164	33
280	33
162	33
163	33
160	33
161	33
7	33
168	33
169	33
863	33
165	33
283	33
276	33
277	33
274	33
275	33
278	33
279	33
281	33
114	33
285	33
286	33
174	33
171	33
170	33
159	33
158	33
12	33
11	33
10	33
16	33
284	33
863	34
114	34
121	34
287	34
274	34
7	34
289	34
288	34
290	34
12	34
11	34
10	34
16	34
73	34
93	34
302	35
303	35
114	35
301	35
306	35
299	35
274	35
305	35
7	35
308	35
309	35
300	35
11	35
10	35
16	35
304	35
863	35
307	35
114	36
274	36
7	36
295	36
296	36
297	36
291	36
293	36
294	36
11	36
10	36
113	36
16	36
863	36
328	38
329	38
320	38
321	38
322	38
323	38
324	38
325	38
326	38
327	38
7	38
863	38
310	38
313	38
312	38
315	38
314	38
317	38
316	38
319	38
318	38
333	38
332	38
331	38
330	38
12	38
11	38
10	38
16	38
320	39
321	39
322	39
327	39
348	39
349	39
346	39
347	39
345	39
343	39
340	39
7	39
863	39
339	39
338	39
337	39
336	39
335	39
334	39
114	39
113	39
351	39
350	39
352	39
293	39
11	39
10	39
16	39
863	41
7	41
333	41
12	41
11	41
10	41
16	41
355	41
354	41
356	41
353	41
863	42
7	42
333	42
12	42
11	42
10	42
359	42
16	42
355	42
354	42
357	42
356	42
353	42
358	42
364	43
360	43
361	43
362	43
363	43
7	43
11	43
10	43
16	43
863	43
863	44
365	44
366	44
367	44
378	44
7	44
368	44
369	44
12	44
11	44
10	44
16	44
379	44
373	44
372	44
371	44
370	44
377	44
376	44
375	44
374	44
406	45
417	45
401	45
400	45
403	45
402	45
388	45
389	45
418	45
12	45
382	45
383	45
380	45
381	45
386	45
387	45
384	45
385	45
863	45
411	45
413	45
415	45
410	45
419	45
420	45
405	45
412	45
399	45
398	45
409	45
408	45
416	45
391	45
390	45
393	45
392	45
395	45
394	45
397	45
396	45
414	45
7	45
11	45
10	45
16	45
404	45
407	45
428	47
429	47
7	47
421	47
422	47
423	47
424	47
425	47
426	47
427	47
12	47
10	47
11	47
16	47
432	47
431	47
430	47
863	47
7	49
863	49
11	49
10	49
113	49
16	49
468	49
467	49
466	49
465	49
464	49
463	49
462	49
461	49
7	50
478	50
863	50
11	50
10	50
16	50
470	50
471	50
472	50
473	50
474	50
475	50
476	50
477	50
534	51
532	51
531	51
516	51
478	51
479	51
533	51
514	51
530	51
519	51
518	51
7	51
512	51
511	51
510	51
517	51
11	51
515	51
513	51
496	51
497	51
494	51
495	51
492	51
493	51
490	51
491	51
863	51
498	51
480	51
504	51
505	51
506	51
507	51
500	51
501	51
502	51
503	51
508	51
509	51
528	51
529	51
526	51
527	51
525	51
522	51
523	51
520	51
521	51
485	51
484	51
487	51
10	51
481	51
16	51
483	51
482	51
499	51
489	51
488	51
434	52
435	52
436	52
437	52
432	52
433	52
93	52
438	52
439	52
7	52
2	52
863	52
441	52
440	52
443	52
442	52
445	52
444	52
446	52
12	52
11	52
10	52
16	52
460	53
451	53
863	53
454	53
7	53
450	53
452	53
453	53
11	53
10	53
456	53
16	53
447	53
455	53
449	53
448	53
458	53
459	53
457	53
434	54
435	54
436	54
437	54
432	54
433	54
93	54
438	54
439	54
7	54
2	54
863	54
441	54
440	54
443	54
442	54
445	54
444	54
446	54
12	54
11	54
10	54
16	54
7	56
863	56
11	56
10	56
113	56
16	56
468	56
467	56
466	56
465	56
464	56
463	56
462	56
461	56
7	57
478	57
863	57
11	57
10	57
16	57
470	57
471	57
472	57
473	57
474	57
475	57
476	57
477	57
534	58
532	58
531	58
516	58
478	58
479	58
533	58
514	58
530	58
519	58
518	58
7	58
512	58
511	58
510	58
517	58
11	58
515	58
513	58
496	58
497	58
494	58
495	58
492	58
493	58
490	58
491	58
863	58
498	58
480	58
504	58
505	58
506	58
507	58
500	58
501	58
502	58
503	58
508	58
509	58
528	58
529	58
526	58
527	58
525	58
522	58
523	58
520	58
521	58
485	58
484	58
487	58
10	58
481	58
16	58
483	58
482	58
499	58
489	58
488	58
7	59
6	59
863	59
26	59
7	61
593	61
592	61
591	61
590	61
597	61
596	61
595	61
594	61
863	61
598	61
589	61
114	61
12	61
11	61
10	61
588	61
16	61
584	61
585	61
586	61
587	61
583	61
7	62
293	62
12	62
11	62
10	62
16	62
863	62
599	62
603	62
601	62
600	62
863	64
7	64
12	64
11	64
10	64
16	64
432	64
93	64
603	64
7	65
12	65
11	65
10	65
16	65
432	65
863	65
604	65
437	67
863	67
538	67
539	67
7	67
537	67
535	67
440	67
12	67
536	67
10	67
11	67
16	67
542	67
543	67
93	67
541	67
540	67
438	67
733	68
734	68
735	68
736	68
737	68
7	68
739	68
741	68
12	68
738	68
10	68
11	68
16	68
740	68
863	68
7	69
863	69
95	69
654	70
655	70
656	70
657	70
650	70
651	70
652	70
653	70
671	70
658	70
659	70
728	70
729	70
724	70
725	70
726	70
727	70
720	70
721	70
722	70
723	70
621	70
620	70
623	70
622	70
625	70
624	70
627	70
626	70
629	70
628	70
668	70
661	70
660	70
632	70
633	70
630	70
631	70
636	70
637	70
634	70
635	70
638	70
639	70
743	70
877	70
669	70
609	70
608	70
607	70
606	70
605	70
687	70
686	70
685	70
684	70
683	70
682	70
681	70
680	70
689	70
688	70
698	70
11	70
10	70
16	70
618	70
619	70
610	70
611	70
612	70
613	70
614	70
615	70
616	70
617	70
690	70
691	70
692	70
693	70
694	70
695	70
696	70
697	70
7	70
699	70
649	70
730	70
715	70
714	70
717	70
716	70
711	70
710	70
713	70
664	70
667	70
666	70
719	70
718	70
663	70
662	70
12	70
640	70
670	70
785	70
706	70
707	70
704	70
705	70
702	70
703	70
678	70
701	70
676	70
677	70
674	70
675	70
672	70
673	70
708	70
709	70
863	70
732	70
731	70
648	70
700	70
643	70
642	70
641	70
679	70
647	70
646	70
645	70
644	70
788	71
789	71
611	71
784	71
785	71
612	71
12	71
676	71
743	71
674	71
672	71
673	71
863	71
716	71
607	71
794	71
791	71
790	71
793	71
792	71
715	71
714	71
717	71
877	71
710	71
664	71
661	71
7	71
11	71
10	71
16	71
770	72
673	72
760	72
761	72
762	72
764	72
651	72
766	72
768	72
769	72
782	72
783	72
780	72
781	72
748	72
749	72
7	72
743	72
674	72
672	72
747	72
744	72
745	72
863	72
774	72
777	72
776	72
775	72
676	72
608	72
779	72
778	72
759	72
758	72
877	72
710	72
751	72
750	72
753	72
752	72
755	72
754	72
757	72
12	72
11	72
10	72
16	72
765	72
801	73
800	73
803	73
802	73
805	73
804	73
806	73
7	73
863	73
881	73
11	73
10	73
799	73
16	73
795	73
797	73
796	73
798	73
827	74
807	74
828	74
7	74
808	74
825	74
824	74
823	74
822	74
821	74
820	74
863	74
312	74
812	74
813	74
810	74
811	74
816	74
817	74
814	74
815	74
818	74
819	74
809	74
11	74
10	74
16	74
826	74
863	75
7	75
573	75
571	75
12	75
11	75
10	75
575	75
16	75
577	75
576	75
93	75
572	75
574	75
863	76
554	76
559	76
7	76
548	76
549	76
11	76
10	76
16	76
558	76
557	76
556	76
555	76
550	76
553	76
552	76
551	76
547	76
863	77
440	77
7	77
436	77
562	77
12	77
11	77
10	77
437	77
16	77
432	77
93	77
568	77
569	77
438	77
567	77
829	78
7	78
12	78
11	78
10	78
16	78
863	78
830	78
7	79
831	79
11	79
10	79
16	79
863	79
7	80
832	80
11	80
10	80
16	80
863	80
829	81
7	81
12	81
11	81
10	81
16	81
863	81
830	81
7	82
831	82
11	82
10	82
16	82
863	82
7	83
832	83
11	83
10	83
16	83
863	83
863	84
7	84
833	84
12	84
11	84
10	84
16	84
93	84
96	84
863	85
103	85
111	85
102	85
7	85
110	85
107	85
99	85
112	85
100	85
101	85
11	85
98	85
104	85
16	85
106	85
10	85
108	85
109	85
97	85
105	85
7	86
863	86
95	86
838	87
7	87
837	87
12	87
11	87
10	87
16	87
848	87
863	87
93	87
843	87
312	88
839	88
7	88
837	88
12	88
11	88
10	88
16	88
849	88
863	88
93	88
842	88
840	88
841	88
312	89
863	89
7	89
837	89
12	89
11	89
10	89
16	89
847	89
846	89
93	89
850	89
7	90
837	90
12	90
11	90
10	90
16	90
863	90
93	90
844	90
845	90
851	90
7	91
863	91
195	91
194	91
193	91
7	92
6	92
863	92
2	92
1	92
7	93
863	93
3	93
7	94
863	94
5	94
9	95
8	95
7	95
858	95
859	95
863	95
857	95
9	96
8	96
7	96
863	96
856	96
854	96
855	96
862	97
860	97
9	97
8	97
7	97
863	97
858	97
859	97
856	97
857	97
854	97
855	97
861	97
9	98
8	98
7	98
6	98
896	98
2	98
1	98
897	98
12	98
11	98
10	98
17	98
16	98
895	98
863	98
894	98
868	98
867	98
866	98
865	98
864	98
7	99
541	99
540	99
863	99
539	99
7	100
863	100
880	100
879	100
878	100
7	103
863	103
603	103
7	104
6	104
863	104
889	104
893	104
7	105
863	105
890	105
7	106
892	106
863	106
894	106
7	107
863	107
896	107
894	107
895	107
654	108
655	108
656	108
657	108
650	108
651	108
652	108
653	108
671	108
658	108
659	108
728	108
724	108
725	108
726	108
727	108
720	108
721	108
722	108
723	108
621	108
620	108
623	108
622	108
625	108
624	108
627	108
626	108
629	108
628	108
668	108
661	108
660	108
632	108
633	108
630	108
631	108
636	108
637	108
634	108
635	108
638	108
639	108
700	108
743	108
669	108
609	108
608	108
607	108
606	108
605	108
687	108
686	108
685	108
684	108
683	108
682	108
681	108
680	108
689	108
688	108
698	108
11	108
10	108
16	108
618	108
619	108
610	108
611	108
612	108
613	108
614	108
615	108
616	108
617	108
690	108
691	108
692	108
693	108
694	108
695	108
696	108
697	108
7	108
699	108
649	108
877	108
711	108
710	108
713	108
664	108
667	108
666	108
719	108
718	108
663	108
662	108
12	108
640	108
670	108
785	108
706	108
707	108
704	108
705	108
702	108
703	108
678	108
701	108
676	108
677	108
674	108
675	108
672	108
673	108
708	108
709	108
869	108
863	108
874	108
875	108
876	108
648	108
870	108
871	108
872	108
873	108
643	108
642	108
641	108
679	108
647	108
646	108
645	108
644	108
198	109
7	109
195	109
196	109
197	109
836	109
835	109
193	109
12	109
194	109
10	109
11	109
16	109
863	109
\.


--
-- Data for Name: safdataproducts; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY safdataproducts (id, interp1, combine_qc_flags, condcmp, doors_l2_rq, doors_l2_text, dcn, dp_level, name, polyval_qc, glblrng_qc, gradtst_qc, loclrng_qc, modulus_qc, notes, flow_diag, solarel_qc, spketst_qc, stuckvl_qc, trndtst_qc, units, code, diagrams, dps, dp_id, instrument_class_list, level, description, regime, dp_units) FROM stdin;
0	not applicable	not applicable	not applicable	L2-SR-RQ-3850	Interactive Sampling for Microbial Genetic Analyses	DCN 1341-00630	2	16s rRNA sequence of filtered physical sample	not applicable	not applicable	not applicable	not applicable	not applicable		n/a	not applicable	not applicable	not applicable	not applicable	2 micron filter	DNASAMP	n/a	DCN 1341-00630	DNASAMP_L2	["PPSDN"]	L2	16s rRNA sequence of filtered physical sample	Seafloor/Crust	2 micron filter
1	not applicable	not applicable	not applicable	L2-SR-RQ-3033	Direct Covariance Fluxes 	DCN 1341-00360	0	Air Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	degree C	TEMPAIR	DCN 1342-00360	DCN 1341-00360	TEMPAIR_L1	["METBK"]	L1	Air Temperature	Air-Sea Interface, Surface Water	degree C
2	not applicable	not applicable	not applicable	L2-SR-RQ-3033	Direct Covariance Fluxes 	DCN 1341-00360	0	Air Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	degree C	TEMPAIR	DCN 1342-00360	DCN 1341-00360	TEMPAIR_L0	["METBK"]	L0	Air Temperature	Air-Sea Interface, Surface Water	degree C
3							2	Air Temperature at 2 m												degrees C	TEMPA2M			TEMPA2M_L2	["METBK"]	L2	Air Temperature at 2 m		degrees C
4	not applicable	not applicable	not applicable	L2-SR-RQ-3020	Barometric Pressure	DCN 1341-00360	0	Barometric Pressure	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	mbar	BARPRES	DCN 1342-00360	DCN 1341-00360	BARPRES_L0	["METBK"]	L0	Barometric Pressure	Air-Sea Interface, Surface Water	mbar
5	not applicable	not applicable	not applicable	L2-SR-RQ-3020	Barometric Pressure	DCN 1341-00360	0	Barometric Pressure	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	mbar	BARPRES	DCN 1342-00360	DCN 1341-00360	BARPRES_L1	["METBK"]	L1	Barometric Pressure	Air-Sea Interface, Surface Water	Pa
6	TBD	TBD	TBD	L2-SR-RQ-3087	Fluid Flow - into and out of seep sites	DCN 1341-00220	2	Benthic Flow Rates	TBD	TBD	TBD	TBD	TBD		DCN 1342-00220	TBD	TBD	TBD	TBD	m/yr	BENTHFL	DCN 1342-00220	DCN 1341-00220	BENTHFL_L2	["FLOBN"]	L2	Benthic Flow Rates	Seafloor/Crust	m/yr
7	not applicable	not applicable	not applicable	L2-SR-RQ-3918	HPIES Bottom Pressure	DCN 1341-00570	0	Bottom Pressure	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IESPRES	DCN 1342-00560	DCN 1341-00570	IESPRES_L0	["HPIES"]	L0	Bottom Pressure	Water Column	TBD
8	not applicable	not applicable	not applicable	L2-SR-RQ-3918	HPIES Bottom Pressure	DCN 1341-00570	0	Bottom Pressure	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IESPRES	DCN 1342-00560	DCN 1341-00570	IESPRES_L1	["HPIES"]	L1	Bottom Pressure	Water Column	Pa
9	not applicable	not applicable	not applicable	L2-SR-RQ-3086	Acoustic Pressure Waves	DCN 1341-00820	0	Broadband Acoustic pressure waves 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00810	not applicable	not applicable	not applicable	not applicable	TBD	HYDAPBB	DCN 1342-00810	DCN 1341-00820	HYDAPBB_L1	["HYDBB"]	L1	Broadband Acoustic pressure waves	Water Column, Seafloor/Crust	dB//1uPa/V
10	not applicable	not applicable	not applicable	L2-SR-RQ-3086	Acoustic Pressure Waves	DCN 1341-00820	0	Broadband Acoustic pressure waves 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00810	not applicable	not applicable	not applicable	not applicable	TBD	HYDAPBB	DCN 1342-00810	DCN 1341-00820	HYDAPBB_L0	["HYDBB"]	L0	Broadband Acoustic pressure waves	Water Column, Seafloor/Crust	TBD
11	not applicable	not applicable	not applicable	Derived from design to achieve HYDACR	none	DCN 1341-00810	0	Broadband Frequency	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00810	not applicable	not applicable	not applicable	not applicable	TBD	HYDFRBB	DCN 1342-00810	DCN 1341-00810	HYDFRBB_L0	["HYDBB"]	L0	Broadband Frequency	Water Column, Seafloor/Crust	TBD
12	not applicable	not applicable	not applicable	Derived from design to achieve HYDACR	none	DCN 1341-00810	0	Broadband Frequency	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00810	not applicable	not applicable	not applicable	not applicable	TBD	HYDFRBB	DCN 1342-00810	DCN 1341-00810	HYDFRBB_L1	["HYDBB"]	L1	Broadband Frequency	Water Column, Seafloor/Crust	KHz
13	TBD	TBD	TBD	L2-SR-RQ-3603	Strong motion	DCN 1341-00100	1	Broadband Ground Acceleration	TBD	TBD	TBD	TBD	TBD		DCN 1342-00090	TBD	TBD	TBD	TBD	m/s^2	GRNDACC	DCN 1342-00090	DCN 1341-00100	GRNDACC_L1	["OBSBB"]	L1	Broadband Ground Acceleration	Seafloor/Crust	m/s^2
14	TBD	TBD	TBD	L2-SR-RQ-3096	Broadband ground motion	DCN 1341-00090	1	Broadband Ground Velocity	TBD	TBD	TBD	TBD	TBD		DCN 1342-00090	TBD	TBD	TBD	TBD	m/s	GRNDVEL	DCN 1342-00090	DCN 1341-00090	GRNDVEL_L1	["OBSBB"]	L1	Broadband Ground Velocity	Seafloor/Crust	m/s
15	not applicable	not applicable	not applicable	Derived from design to achieve PCO2AIR	none	[DCN 1341-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/295440da-24e6-4279-90f5-03055a5b5a31/1341-00260_Data_Product_SPEC_PCO2SSW_PCO2ATM_OOI.pdf]	0	CO2 Mole Fraction in Atmosphere	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	ppm	XCO2ATM	DCN 1342-00260	DCN 1341-00260	XCO2ATM_L0	["PCO2A"]	L0	CO2 Mole Fraction in Atmosphere	Air-Sea Interface	ppm
16	not applicable	not applicable	not applicable	Derived from design to achieve PCO2AIR	none	[DCN 1341-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/295440da-24e6-4279-90f5-03055a5b5a31/1341-00260_Data_Product_SPEC_PCO2SSW_PCO2ATM_OOI.pdf]	0	CO2 Mole Fraction in Surface Sea Water	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	ppm	XCO2SSW	DCN 1342-00260	DCN 1341-00260	XCO2SSW_L0	["PCO2A"]	L0	CO2 Mole Fraction in Surface Sea Water	Air-Sea Interface	ppm
17	not applicable	not applicable	not applicable	L2-SR-RQ-3045	Conductivity	[DCN 1341-00030|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/d8318ad7-b189-4ff1-acd9-6acdd295f4f5/1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf]	0	Conductivity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	CONDWAT	DCN 1342-00010	DCN 1341-00030	CONDWAT_L1	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L1	Conductivity	Water Column	S/m
18	not applicable	not applicable	not applicable	L2-SR-RQ-3045	Conductivity	[DCN 1341-00030|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/d8318ad7-b189-4ff1-acd9-6acdd295f4f5/1341-00030_Data_Product_SPEC_CONDWAT_OOI.pdf]	0	Conductivity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	CONDWAT	DCN 1342-00010	DCN 1341-00030	CONDWAT_L0	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L0	Conductivity	Water Column	unitless
19	not applicable	not applicable	not applicable	L2-SR-RQ-3065	Density	[DCN 1341-00050|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/bafd6f75-4a29-457a-a243-a2b77d2ee1ec/1341-00050_Data_Product_SPEC_DENSITY_OOI.pdf]	2	Density	not applicable	applicable	applicable	applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	applicable	applicable	not applicable	kg/m^3	DENSITY	DCN 1342-00010	DCN 1341-00050	DENSITY_L2	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L2	Density	Water Column	kg/m^3
20	TBD	TBD	TBD	L2-SR-RQ-3924	Diffuse Attenuation	DCN 1341-00740	2	Diffuse Attenuation Coefficient	TBD	TBD	TBD	TBD	TBD		DCN 1342-00730	TBD	TBD	TBD	TBD	1/m	OPTATTS	DCN 1342-00730	DCN 1341-00740	OPTATTS_L2	["SPKIR"]	L2	Diffuse Attenuation Coefficient	Water Column	1/m
21	TBD	TBD	TBD	L2-SR-RQ-3062	Platform Motion	DCN 1341-00330	2	Direct Covariance Flux of Heat	TBD	TBD	TBD	TBD	TBD		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	TBD	TBD	TBD	TBD	J m^(-2) s^(-1)	FLUXHOT	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00330	FLUXHOT_L2	["FDCHP", "FDCLP"]	L2	Direct Covariance Flux of Heat	Air-Sea Interface	J m^(-2) s^(-1)
22	TBD	TBD	TBD	L2-SR-RQ-3033	Direct Covariance Fluxes 	DCN 1341-00340	2	Direct Covariance Flux of Moisture	TBD	TBD	TBD	TBD	TBD		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	TBD	TBD	TBD	TBD	kg m^(-1) s^(-1)	FLUXWET	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00340	FLUXWET_L2	["FDCHP", "FDCLP"]	L2	Direct Covariance Flux of Moisture	Air-Sea Interface	kg m^(-1) s^(-1)
23	TBD	TBD	TBD	L2-SR-RQ-3033	Direct Covariance Fluxes 	DCN 1341-00320	2	Direct Covariance Flux of Momentum	TBD	TBD	TBD	TBD	TBD		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	TBD	TBD	TBD	TBD	kg m^(-1) s^(-2)	FLUXMOM	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00320	FLUXMOM_L2	["FDCHP", "FDCLP"]	L2	Direct Covariance Flux of Momentum	Air-Sea Interface	kg m^(-1) s^(-2)
24	not applicable	not applicable	not applicable	L2-SR-RQ-3021	Downwelling longwave irradiance	DCN 1341-00360	0	Downwelling Longwave Irradiance	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	W/m2	LONGIRR	DCN 1342-00360	DCN 1341-00360	LONGIRR_L0	["METBK"]	L0	Downwelling Longwave Irradiance	Air-Sea Interface, Surface Water	W/m2
25	not applicable	not applicable	not applicable	L2-SR-RQ-3021	Downwelling longwave irradiance	DCN 1341-00360	0	Downwelling Longwave Irradiance	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	W/m2	LONGIRR	DCN 1342-00360	DCN 1341-00360	LONGIRR_L1	["METBK"]	L1	Downwelling Longwave Irradiance	Air-Sea Interface, Surface Water	W/m2
26	not applicable	not applicable	not applicable	L2-SR-RQ-3022	Downwelling shortwave irradiance	DCN 1341-00360	0	Downwelling Shortwave Irradiance 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	W/m2	SHRTIRR	DCN 1342-00360	DCN 1341-00360	SHRTIRR_L1	["METBK"]	L1	Downwelling Shortwave Irradiance	Air-Sea Interface, Surface Water	W/m2
27	not applicable	not applicable	not applicable	L2-SR-RQ-3022	Downwelling shortwave irradiance	DCN 1341-00360	0	Downwelling Shortwave Irradiance 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	W/m2	SHRTIRR	DCN 1342-00360	DCN 1341-00360	SHRTIRR_L0	["METBK"]	L0	Downwelling Shortwave Irradiance	Air-Sea Interface, Surface Water	W/m2
28	not applicable	not applicable	not applicable	L2-SR-RQ-3051	Downwelling spectral irradiance	DCN 1341-00730	0	Downwelling Spectral Irradiance 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00730	not applicable	not applicable	not applicable	not applicable	TBD	SPECTIR	DCN 1342-00730	DCN 1341-00730	SPECTIR_L1	["SPKIR"]	L1	Downwelling Spectral Irradiance	Water Column	??W*cm^-2*nm^-1
29	not applicable	not applicable	not applicable	L2-SR-RQ-3051	Downwelling spectral irradiance	DCN 1341-00730	0	Downwelling Spectral Irradiance 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00730	not applicable	not applicable	not applicable	not applicable	TBD	SPECTIR	DCN 1342-00730	DCN 1341-00730	SPECTIR_L0	["SPKIR"]	L0	Downwelling Spectral Irradiance	Water Column	TBD
30	not applicable	not applicable	not applicable	L2-SR-RQ-3887	Velocity profile measurements shall provide a measure of acoustic backscatter intensity for each depth bin.	[DCN 1341-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/7ea90727-c1b4-4d73-b565-0ae4227da451/1341-00750_Data_Product_SPEC_VELPROF_ECHOINT_OOI.pdf] (ADCPA, ADCPS, ADCPT), DCN 1341-00760 (VADCP)	0	Echo Intensity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/c1fb71ed-ec32-4035-9d7b-d8228b57f7b0/1342-00750_Data_Processing_Flow_ADCP_OOI.pdf] (ADCPA, ADCPS, ADCPT), DCN 1342-00760 (VADCP)	not applicable	not applicable	not applicable	not applicable	dB	ECHOINT	DCN 1342-00750 (ADCPA, ADCPS, ADCPT), DCN 1342-00760 (VADCP)	DCN 1341-00750 (ADCPA, ADCPS, ADCPT), DCN 1341-00760 (VADCP)	ECHOINT_L1	["ADCPA", "ADCPS", "ADCPT", "VADCP"]	L1	Echo Intensity	Water Column	dB
31	not applicable	not applicable	not applicable	L2-SR-RQ-3887	Velocity profile measurements shall provide a measure of acoustic backscatter intensity for each depth bin.	[DCN 1341-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/7ea90727-c1b4-4d73-b565-0ae4227da451/1341-00750_Data_Product_SPEC_VELPROF_ECHOINT_OOI.pdf] (ADCPA, ADCPS, ADCPT), DCN 1341-00760 (VADCP)	0	Echo Intensity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/c1fb71ed-ec32-4035-9d7b-d8228b57f7b0/1342-00750_Data_Processing_Flow_ADCP_OOI.pdf] (ADCPA, ADCPS, ADCPT), DCN 1342-00760 (VADCP)	not applicable	not applicable	not applicable	not applicable	dB	ECHOINT	DCN 1342-00750 (ADCPA, ADCPS, ADCPT), DCN 1342-00760 (VADCP)	DCN 1341-00750 (ADCPA, ADCPS, ADCPT), DCN 1341-00760 (VADCP)	ECHOINT_L0	["ADCPA", "ADCPS", "ADCPT", "VADCP"]	L0	Echo Intensity	Water Column	dB
47						DCN 1341-00821	0	Low Frequency Acoustic pressure waves							DCN 1341-00821						HYDAPLF	DCN 1341-00821	DCN 1341-00821	HYDAPLF_L0	["HYDLF"]	L0	Low Frequency Acoustic pressure waves		
32	not applicable	not applicable	not applicable	L2-SR-RQ-3187	Colored Dissolved Organic Matter (CDOM) fluorescence	[DCN 1341-00550|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/3a5d525b-59d8-4f1e-b901-20e43e6c8d26/1341-00550_Data_Product_SPEC_CDOMFLO_OOI.pdf]	0	Fluorometric CDOM Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	counts	CDOMFLO	DCN 1342-00530	DCN 1341-00550	CDOMFLO_L1	["FLORT"]	L1	Fluorometric CDOM Concentration	Water Column	ppm
33	not applicable	not applicable	not applicable	L2-SR-RQ-3187	Colored Dissolved Organic Matter (CDOM) fluorescence	[DCN 1341-00550|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/3a5d525b-59d8-4f1e-b901-20e43e6c8d26/1341-00550_Data_Product_SPEC_CDOMFLO_OOI.pdf]	0	Fluorometric CDOM Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	counts	CDOMFLO	DCN 1342-00530	DCN 1341-00550	CDOMFLO_L0	["FLORT"]	L0	Fluorometric CDOM Concentration	Water Column	counts
34	not applicable	not applicable	not applicable	L2-SR-RQ-3185	Chlorophyll-a fluorescence	[DCN 1341-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/de7bff13-c7a6-4e50-8a13-8c9e52c9b83f/1341-00530_Data_Product_SPEC_CHLAFLO_OOI.pdf]	0	Fluorometric Chlorophyll-a Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00531|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/f06ae944-8f55-40c0-a410-3af93cc9f2c6/1342-00531_Data_Processing_Flow_FLORD_OOI.pdf] (FLORD), [DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf] (FLORT)	not applicable	not applicable	not applicable	not applicable	counts	CHLAFLO	DCN 1342-00531 (FLORD), DCN 1342-00530 (FLORT)	DCN 1341-00530	CHLAFLO_L1	["FLORD", "FLORT"]	L1	Fluorometric Chlorophyll-a Concentration	Water Column	ug/L
35	not applicable	not applicable	not applicable	L2-SR-RQ-3185	Chlorophyll-a fluorescence	[DCN 1341-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/de7bff13-c7a6-4e50-8a13-8c9e52c9b83f/1341-00530_Data_Product_SPEC_CHLAFLO_OOI.pdf]	0	Fluorometric Chlorophyll-a Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00531|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/f06ae944-8f55-40c0-a410-3af93cc9f2c6/1342-00531_Data_Processing_Flow_FLORD_OOI.pdf] (FLORD), [DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf] (FLORT)	not applicable	not applicable	not applicable	not applicable	counts	CHLAFLO	DCN 1342-00531 (FLORD), DCN 1342-00530 (FLORT)	DCN 1341-00530	CHLAFLO_L0	["FLORD", "FLORT"]	L0	Fluorometric Chlorophyll-a Concentration	Water Column	counts
36	not applicable	not applicable	not applicable	L2-SR-RQ-3032	flux of CO2	[DCN 1341-00270|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/f13cc476-0dcf-4d5c-a0d6-2738ba48b86f/1341-00270_Data_Product_SPEC_CO2FLUX_OOI.pdf]	2	Flux of CO2 from the Ocean into the Atmosphere	not applicable	applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	applicable	applicable	not applicable	mol m-2 s-1	CO2FLUX	DCN 1342-00260	DCN 1341-00270	CO2FLUX_L2	["PCO2A"]	L2	Flux of CO2 from the Ocean into the Atmosphere	Air-Sea Interface	mol m-2 s-1
37																					FRSHFLX			FRSHFLX_L2	["METBK"]	L2	Freshwater Flux		m3/s
38	not applicable	not applicable	not applicable	L2-SR-RQ-3804	Imagery, HD Video	DCN 1341-00840	1	HD Video Image	not applicable	not applicable	not applicable	not applicable	not applicable	These are not considered data to be archived - only live streaming	n/a	not applicable	not applicable	not applicable	not applicable	Lossless compression Image File	HDVIDEO	n/a	DCN 1341-00840	HDVIDEO_L1	["CAMHD"]	L1	HD Video Image	Seafloor/Crust	Lossless compression Image File
39	not applicable	not applicable	not applicable	L2-SR-RQ-3912	Horizontal Electrical Field	DCN 1341-00580	0	Horizontal Electric Fields	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IES_HEF	DCN 1342-00560	DCN 1341-00580	IES_HEF_L0	["HPIES"]	L0	Horizontal Electric Fields	Water Column	TBD
40	not applicable	not applicable	not applicable	L2-SR-RQ-3912	Horizontal Electrical Field	DCN 1341-00580	0	Horizontal Electric Fields	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IES_HEF	DCN 1342-00560	DCN 1341-00580	IES_HEF_L1	["HPIES"]	L1	Horizontal Electric Fields	Water Column	micro volt/cm
41	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00210	0	Hydrogen Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHHC	DCN 1342-00120	DCN 1341-00210	THSPHHC_L0	["THSPH"]	L0	Hydrogen Concentration	Seafloor/Crust	V
42	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00210	0	Hydrogen Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHHC	DCN 1342-00120	DCN 1341-00210	THSPHHC_L2	["THSPH"]	L2	Hydrogen Concentration	Seafloor/Crust	Moles/kg
43	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00200	0	Hydrogen Sulfide Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHHS	DCN 1342-00120	DCN 1341-00200	THSPHHS_L0	["THSPH"]	L0	Hydrogen Sulfide Concentration	Seafloor/Crust	V
44	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00200	0	Hydrogen Sulfide Concentration	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHHS	DCN 1342-00120	DCN 1341-00200	THSPHHS_L2	["THSPH"]	L2	Hydrogen Sulfide Concentration	Seafloor/Crust	Moles/kg
45																					LATNFLX			LATNFLX_L2	["METBK"]	L2	Latent Heat Flux		W/m2
46						DCN 1341-00821	0	Low Frequency Acoustic pressure waves							DCN 1341-00821						HYDAPLF	DCN 1341-00821	DCN 1341-00821	HYDAPLF_L1	["HYDLF"]	L1	Low Frequency Acoustic pressure waves		
48	not applicable	not applicable	not applicable	L2-SR-RQ-3085	Single Point Water Velocity	[DCN 1341-00790|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/e47c753f-e4a4-4ed2-8ffa-7c7222246ecb/1341-00790_Data_Product_SPEC_VELPTMN_OOI.pdf]	1	Mean Point Water Velocity	applicable	applicable	not applicable	applicable	not applicable		[DCN 1342-00790|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/5dbba582-f589-45d5-b024-804336240d75/1342-00790_Data_Processing_Flow_VELPT_OOI.pdf]	not applicable	applicable	applicable	applicable	m/s	VELPTMN	DCN 1342-00790	DCN 1341-00790	VELPTMN_L1	["VELPT"]	L1	Mean Point Water Velocity	Water Column	m/s
49	not applicable	not applicable	not applicable	L2-SR-RQ-3027	Mean Wind Velocity	DCN 1341-00360	0	Mean Wind Velocity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	m/s	WINDAVG	DCN 1342-00360	DCN 1341-00360	WINDAVG_L0	["METBK"]	L0	Mean Wind Velocity	Air-Sea Interface, Surface Water	m/s
50	not applicable	not applicable	not applicable	L2-SR-RQ-3027	Mean Wind Velocity	DCN 1341-00360	0	Mean Wind Velocity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	m/s	WINDAVG	DCN 1342-00360	DCN 1341-00360	WINDAVG_L1	["METBK"]	L1	Mean Wind Velocity	Air-Sea Interface, Surface Water	m/s
51							2	Momentum Flux (Wind Stress) 												N/m2	MOMMFLX			MOMMFLX_L2	["METBK"]	L2	Momentum Flux (Wind Stress)		N/m2
52	not applicable	not applicable	not applicable	L2-SR-RQ-3054	Acoustic Backscatter 	DCN 1341-00800	0	Multi-Frequency Acoustic Backscatter	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00800	not applicable	not applicable	not applicable	not applicable	TBD	SONBSCA	DCN 1342-00800	DCN 1341-00800	SONBSCA_L0	["ZPLSC", "ZPLSG"]	L0	Multi-Frequency Acoustic Backscatter	Water Column	TBD
53	not applicable	not applicable	not applicable	L2-SR-RQ-3054	Acoustic Backscatter 	DCN 1341-00800	0	Multi-Frequency Acoustic Backscatter	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00800	not applicable	not applicable	not applicable	not applicable	TBD	SONBSCA	DCN 1342-00800	DCN 1341-00800	SONBSCA_L1	["ZPLSC", "ZPLSG"]	L1	Multi-Frequency Acoustic Backscatter	Water Column	dB re 1(m^2 nmi^-2)
54	TBD	TBD	TBD	L2-SR-RQ-3084	Coupled near bottom pressure and tilt (Seafloor uplift/deflation)	DCN 1341-00070	1	Nano-resolution Bottom Pressure	TBD	TBD	TBD	TBD	TBD		DCN 1342-00060	TBD	TBD	TBD	TBD	nanoPascal	BOTPRES	DCN 1342-00060	DCN 1341-00070	BOTPRES_L1	["BOTPT"]	L1	Nano-resolution Bottom Pressure	Seafloor/Crust	nanoPascal
55																					HEATFLX			HEATFLX_L2	["METBK"]	L2	Net Heat Flux		W/m2
56																					NETLIRR			NETLIRR_L2	["METBK"]	L2	Net Longwave Irradiance		W/m2
57																					NETSIRR			NETSIRR_L2	["METBK"]	L2	Net Shortwave Irradiance		W/m2
58	TBD	TBD	TBD	L2-SR-RQ-3050	Nitrate	DCN 1341-00620	1	Nitrate Concentration	TBD	TBD	TBD	TBD	TBD		DCN 1342-00620	TBD	TBD	TBD	TBD	??M	NITROPT	DCN 1342-00620	DCN 1341-00620	NITROPT_L1	["NUTNR"]	L1	Nitrate Concentration	Water Column	??M
59	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00170|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/5c359aaa-9a4d-4f55-88d3-17a9c4e7082f/1341-00170_Data_Product_Spec_TRHPHEH_OOI.pdf]	0	ORP Volts	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	V	TRHPHVO	DCN 1342-00150	DCN 1341-00170	TRHPHVO_L0	["TRHPH"]	L0	ORP Volts	Seafloor/Crust	V
60	not applicable	not applicable	not applicable	Derived from design to achieve PCO2WAT	none	[DCN 1341-00487|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/80a7f169-8d1d-47d1-96b8-1eef13f333a8/1341-00490_Data_Product_Spec_PCO2WAT_OOI.pdf]	0	Optical Absorbance Ratio at 434nm	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00490|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/37041aff-4f16-4023-8b04-d3810ca2905f/1342-00490_PCO2W_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	CO2ABS1	DCN 1342-00490	DCN 1341-00487	CO2ABS1_L0	["PCO2W"]	L0	Optical Absorbance Ratio at 434nm	Water Column	unitless
61	not applicable	not applicable	not applicable	Derived from design to achieve PCO2WAT	none	[DCN 1341-00488|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/80a7f169-8d1d-47d1-96b8-1eef13f333a8/1341-00490_Data_Product_Spec_PCO2WAT_OOI.pdf]	0	Optical Absorbance Ratio at 620nm	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00490|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/37041aff-4f16-4023-8b04-d3810ca2905f/1342-00490_PCO2W_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	CO2ABS2	DCN 1342-00490	DCN 1341-00488	CO2ABS2_L0	["PCO2W"]	L0	Optical Absorbance Ratio at 620nm	Water Column	unitless
62	not applicable	not applicable	not applicable	Derived from design to achieve PHWATER	none	DCN 1341-00508	0	Optical Absorbance Signal Intensity at 434nm	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00510	not applicable	not applicable	not applicable	not applicable	unitless	PH434SI	DCN 1342-00510	DCN 1341-00508	PH434SI_L0	["PHSEN"]	L0	Optical Absorbance Signal Intensity at 434nm	Water Column	unitless
63	not applicable	not applicable	not applicable	Derived from design to achieve PHWATER	none	DCN 1341-00509	0	Optical Absorbance Signal Intensity at 578nm	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00510	not applicable	not applicable	not applicable	not applicable	unitless	PH578SI	DCN 1342-00510	DCN 1341-00509	PH578SI_L0	["PHSEN"]	L0	Optical Absorbance Signal Intensity at 578nm	Water Column	unitless
64	not applicable	not applicable	not applicable	L2-SR-RQ-3926	Optical Absorption	[DCN 1341-00700|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/464dee40-a810-4fbc-bcd1-4874e787bbca/1341-00700_Data_Product_SPEC_OPTABSN_OOI.pdf]	2	Optical Absorption Coefficient	applicable	applicable	not applicable	applicable	not applicable		[DCN 1342-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/131c6f4a-e3fb-4f70-99b2-4a13c69b66eb/1342-00690_Data_Processing_Flow_OPTAA_OOI.pdf]	not applicable	applicable	applicable	applicable	1/m	OPTABSN	DCN 1342-00690	DCN 1341-00700	OPTABSN_L2	["OPTAA"]	L2	Optical Absorption Coefficient	Water Column	1/m
102	not applicable	not applicable	not applicable	L2-SR-RQ-3084	Coupled near bottom pressure and tilt (Seafloor uplift/deflation)	DCN 1341-00060	0	Seafloor High-Resolution Tilt	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00060	not applicable	not applicable	not applicable	not applicable	microradians	BOTTILT	DCN 1342-00060	DCN 1341-00060	BOTTILT_L0	["BOTPT"]	L0	Seafloor High-Resolution Tilt	Seafloor/Crust	microradians
65	not applicable	not applicable	not applicable	L2-SR-RQ-3059	Optical Backscatter	[DCN 1341-00540|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/2872f757-3ac4-4401-9728-d6ded25c5fa6/1341-00540_Data_Product_SPEC_FLUBSCT_OOI.pdf]	0	Optical Backscatter (Red Wavelengths)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00531|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/f06ae944-8f55-40c0-a410-3af93cc9f2c6/1342-00531_Data_Processing_Flow_FLORD_OOI.pdf] (FLORD), [DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf] (FLORT)	not applicable	not applicable	not applicable	not applicable	counts	FLUBSCT	DCN 1342-00531 (FLORD), DCN 1342-00530 (FLORT)	DCN 1341-00540	FLUBSCT_L0	["FLORD", "FLORT"]	L0	Optical Backscatter (Red Wavelengths)	Water Column	counts
66	not applicable	not applicable	not applicable	L2-SR-RQ-3059	Optical Backscatter	[DCN 1341-00540|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/2872f757-3ac4-4401-9728-d6ded25c5fa6/1341-00540_Data_Product_SPEC_FLUBSCT_OOI.pdf]	0	Optical Backscatter (Red Wavelengths)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00531|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/f06ae944-8f55-40c0-a410-3af93cc9f2c6/1342-00531_Data_Processing_Flow_FLORD_OOI.pdf] (FLORD), [DCN 1342-00530|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/555778c3-b51d-4a68-b472-ad45101dd509/1342-00530_Data_Processing_Flow_FLORT_OOI.pdf] (FLORT)	not applicable	not applicable	not applicable	not applicable	counts	FLUBSCT	DCN 1342-00531 (FLORD), DCN 1342-00530 (FLORT)	DCN 1341-00540	FLUBSCT_L1	["FLORD", "FLORT"]	L1	Optical Backscatter (Red Wavelengths)	Water Column	1/m
67	not applicable	not applicable	not applicable	L2-SR-RQ-3928	Optical Attenuation	[DCN 1341-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/28089882-716e-4fa8-b4b6-c703f5630882/1341-00690_Data_Product_SPEC_OPTATTN_OOI.pdf]	2	Optical Beam Attenuation Coefficient	applicable	applicable	not applicable	applicable	not applicable		[DCN 1342-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/131c6f4a-e3fb-4f70-99b2-4a13c69b66eb/1342-00690_Data_Processing_Flow_OPTAA_OOI.pdf]	not applicable	applicable	applicable	applicable	1/m	OPTATTN	DCN 1342-00690	DCN 1341-00690	OPTATTN_L2	["OPTAA"]	L2	Optical Beam Attenuation Coefficient	Water Column	1/m
68	TBD	TBD	TBD	L2-SR-RQ-3048	Dissolved Oxygen	DCN 1341-00521	2	Oxygen Concentration from Fastrep DO Instrument	TBD	TBD	TBD	TBD	TBD		DCN 1342-00521	TBD	TBD	TBD	TBD	uMol/l	DOCONCF	DCN 1342-00521	DCN 1341-00521	DOCONCF_L2	["DOFST"]	L2	Oxygen Concentration from Fastrep DO Instrument	Water Column	uMol/l
69	not applicable	not applicable	not applicable	L2-SR-RQ-3048	Dissolved Oxygen	[DCN 1341-00520|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/97f4bfbb-b075-4b1d-993f-b1df24adf369/1341-00520_Data_Product_SPEC_DOCONCS_OOI.pdf]	0	Oxygen Concentration from Stable DO Instrument	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00520|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/047d2339-e8e3-44c8-b1b7-4b4a575016b9/1342-00520_Data_Processing_Flow_DOSTA_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	degrees; degrees Celcius	DOCONCS	DCN 1342-00520	DCN 1341-00520	DOCONCS_L0	["DOSTA"]	L0	Oxygen Concentration from Stable DO Instrument	Water Column	degrees; degrees Celcius
70	not applicable	not applicable	not applicable	L2-SR-RQ-3048	Dissolved Oxygen	[DCN 1341-00520|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/97f4bfbb-b075-4b1d-993f-b1df24adf369/1341-00520_Data_Product_SPEC_DOCONCS_OOI.pdf]	0	Oxygen Concentration from Stable DO Instrument	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00520|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/047d2339-e8e3-44c8-b1b7-4b4a575016b9/1342-00520_Data_Processing_Flow_DOSTA_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	degrees; degrees Celcius	DOCONCS	DCN 1342-00520	DCN 1341-00520	DOCONCS_L2	["DOSTA"]	L2	Oxygen Concentration from Stable DO Instrument	Water Column	uMol/l
71	not applicable	not applicable	not applicable	Derived from design to achieve PCO2AIR	none	[DCN 1341-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/295440da-24e6-4279-90f5-03055a5b5a31/1341-00260_Data_Product_SPEC_PCO2SSW_PCO2ATM_OOI.pdf]	0	PCO2A Gas Stream Pressure	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	mbar	PRESAIR	DCN 1342-00260	DCN 1341-00260	PRESAIR_L0	["PCO2A"]	L0	PCO2A Gas Stream Pressure	Air-Sea Interface	mbar
72	not applicable	not applicable	not applicable	Derived from design to achieve PCO2WAT	none	[DCN 1341-00489|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/80a7f169-8d1d-47d1-96b8-1eef13f333a8/1341-00490_Data_Product_Spec_PCO2WAT_OOI.pdf]	0	PCO2W Thermistor Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00490|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/37041aff-4f16-4023-8b04-d3810ca2905f/1342-00490_PCO2W_Data_Processing_Flow_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	volts	CO2THRM	DCN 1342-00490	DCN 1341-00489	CO2THRM_L0	["PCO2W"]	L0	PCO2W Thermistor Temperature	Water Column	volts
73	not applicable	not applicable	not applicable	Derived from design to achieve PHWATER	none	DCN 1341-00507	0	PHSEN Thermistor Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00510	not applicable	not applicable	not applicable	not applicable	volts	ABSTHRM	DCN 1342-00510	DCN 1341-00507	ABSTHRM_L0	["PHSEN"]	L0	PHSEN Thermistor Temperature	Water Column	volts
74	not applicable	not applicable	not applicable	L2-SR-RQ-3023	pCO2 Air-Sea	[DCN 1341-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/295440da-24e6-4279-90f5-03055a5b5a31/1341-00260_Data_Product_SPEC_PCO2SSW_PCO2ATM_OOI.pdf]	1	Partial Pressure of CO2 in Atmosphere	applicable	applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	applicable	applicable	not applicable	??atm	PCO2ATM	DCN 1342-00260	DCN 1341-00260	PCO2ATM_L1	["PCO2A"]	L1	Partial Pressure of CO2 in Atmosphere	Air-Sea Interface	??atm
103	TBD	TBD	TBD	L2-SR-RQ-3083	Bottom Pressure	DCN 1341-00230 (PRESF), DCN 1341-00231 (PREST)	1	Seafloor Pressure	TBD	TBD	TBD	TBD	TBD		DCN 1342-00230 (PRESF), DCN 1342-00231 (PREST)	TBD	TBD	TBD	TBD	Pa	SFLPRES	DCN 1342-00230 (PRESF), DCN 1342-00231 (PREST)	DCN 1341-00230 (PRESF), DCN 1341-00231 (PREST)	SFLPRES_L1	["PRESF", "PREST"]	L1	Seafloor Pressure	Seafloor/Crust	Pa
75	not applicable	not applicable	not applicable	L2-SR-RQ-3023	pCO2 Air-Sea	[DCN 1341-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/295440da-24e6-4279-90f5-03055a5b5a31/1341-00260_Data_Product_SPEC_PCO2SSW_PCO2ATM_OOI.pdf]	1	Partial Pressure of CO2 in Surface Sea Water	applicable	applicable	not applicable	not applicable	not applicable		[DCN 1342-00260|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/057a2c02-c909-43c8-b0ef-102b4ad4f67e/1342-00260_PCO2A_Data_Processing_Flow_OOI.pdf]	not applicable	applicable	applicable	not applicable	??atm	PCO2SSW	DCN 1342-00260	DCN 1341-00260	PCO2SSW_L1	["PCO2A"]	L1	Partial Pressure of CO2 in Surface Sea Water	Air-Sea Interface	??atm
76	not applicable	not applicable	not applicable	L2-SR-RQ-3049	pCO2 Seawater	[DCN 1341-00490|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/80a7f169-8d1d-47d1-96b8-1eef13f333a8/1341-00490_Data_Product_Spec_PCO2WAT_OOI.pdf]	1	Partial Pressure of CO2 in Water	applicable	applicable	not applicable	applicable	not applicable		[DCN 1342-00490|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/37041aff-4f16-4023-8b04-d3810ca2905f/1342-00490_PCO2W_Data_Processing_Flow_OOI.pdf]	not applicable	applicable	applicable	not applicable	??atm	PCO2WAT	DCN 1342-00490	DCN 1341-00490	PCO2WAT_L1	["PCO2W"]	L1	Partial Pressure of CO2 in Water	Water Column	??atm
77	not applicable	not applicable	not applicable	L2-SR-RQ-3670	Photosynthically Available Radiation (PAR)	[DCN 1341-00720|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/b6fe37ee-41e2-420a-aca3-41437edb78d4/1341-00720_Data_Product_SPEC_OPTPARW_Satl_OOI.pdf] (Satl), [DCN 1341-00721|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/88fe21cf-a9ea-40ff-9cd7-8813057cae73/1341-00721_Data_Product_SPEC_OPTPARW_Bios_OOI.pdf] (Bios)	0	Photosynthetically Active Radiation (400-700 nm)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00720|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/134f177d-9604-476e-9039-f2e3dfb63331/1342-00720_Data_Processing_Flow_PARAD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	counts (Satl), volts (Bios)	OPTPARW	DCN 1342-00720	DCN 1341-00720 (Satl), DCN 1341-00721 (Bios)	OPTPARW_L0	["PARAD"]	L0	Photosynthetically Active Radiation (400-700 nm)	Water Column	counts (Satl), volts (Bios)
78	not applicable	not applicable	not applicable	L2-SR-RQ-3670	Photosynthically Available Radiation (PAR)	[DCN 1341-00720|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/b6fe37ee-41e2-420a-aca3-41437edb78d4/1341-00720_Data_Product_SPEC_OPTPARW_Satl_OOI.pdf] (Satl), [DCN 1341-00721|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/88fe21cf-a9ea-40ff-9cd7-8813057cae73/1341-00721_Data_Product_SPEC_OPTPARW_Bios_OOI.pdf] (Bios)	0	Photosynthetically Active Radiation (400-700 nm)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00720|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/134f177d-9604-476e-9039-f2e3dfb63331/1342-00720_Data_Processing_Flow_PARAD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	counts (Satl), volts (Bios)	OPTPARW	DCN 1342-00720	DCN 1341-00720 (Satl), DCN 1341-00721 (Bios)	OPTPARW_L1	["PARAD"]	L1	Photosynthetically Active Radiation (400-700 nm)	Water Column	??mol photons/m^2*s
79	not applicable	not applicable	not applicable	L2-SR-RQ-3088	Interactive Sampling for Vent Fluid Chemistry	DCN 1341-00640 (OSMOI), DCN 1341-00641 (RASFL)	2	Physical Fluid Sample	not applicable	not applicable	not applicable	not applicable	not applicable		n/a	not applicable	not applicable	not applicable	not applicable	No Direct Datastream to OOI	PHSSAMP	n/a	DCN 1341-00640 (OSMOI), DCN 1341-00641 (RASFL)	PHSSAMP_L2	["OSMOI", "RASFL"]	L2	Physical Fluid Sample	Seafloor/Crust	No Direct Datastream to OOI
80	not applicable	not applicable	not applicable	L2-SR-RQ-3025	Relative humidity 	DCN 1341-00301	0	Platform Direction and Tilt (3 axes)	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD (FDCHP), degree (from north or vertical) (FDCLP)	MOTFLUX	DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	DCN 1341-00301	MOTFLUX_L0	["FDCHP", "FDCLP"]	L0	Platform Direction and Tilt (3 axes)	Air-Sea Interface	TBD (FDCHP), degree (from north or vertical) (FDCLP)
81	not applicable	not applicable	not applicable	L2-SR-RQ-3064	Salinity	[DCN 1341-00040|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/bab9685d-bb16-44c2-88a5-1e8e8f0508fe/1341-00040_Data_Product_SPEC_PRACSAL_OOI.pdf]	2	Practical Salinity	not applicable	applicable	applicable	applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	applicable	applicable	not applicable	unitless	PRACSAL	DCN 1342-00010	DCN 1341-00040	PRACSAL_L2	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L2	Practical Salinity	Water Column	unitless
82	not applicable	not applicable	not applicable	L2-SR-RQ-3024	Precipitation	DCN 1341-00360	0	Precipitation	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	mm	PRECIPM	DCN 1342-00360	DCN 1341-00360	PRECIPM_L1	["METBK"]	L1	Precipitation	Air-Sea Interface, Surface Water	mm
83	not applicable	not applicable	not applicable	L2-SR-RQ-3024	Precipitation	DCN 1341-00360	0	Precipitation	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	mm	PRECIPM	DCN 1342-00360	DCN 1341-00360	PRECIPM_L0	["METBK"]	L0	Precipitation	Air-Sea Interface, Surface Water	mm
84	not applicable	not applicable	not applicable	L2-SR-RQ-3046	Pressure (Depth)	[DCN 1341-00020|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/542fd002-8a79-4681-a121-e8aa2b52fce1/1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf]	0	Pressure (Depth)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	PRESWAT	DCN 1342-00010	DCN 1341-00020	PRESWAT_L1	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L1	Pressure (Depth)	Water Column	Pa
85	not applicable	not applicable	not applicable	L2-SR-RQ-3046	Pressure (Depth)	[DCN 1341-00020|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/542fd002-8a79-4681-a121-e8aa2b52fce1/1341-00020_Data_Product_SPEC_PRESWAT_OOI.pdf]	0	Pressure (Depth)	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	PRESWAT	DCN 1342-00010	DCN 1341-00020	PRESWAT_L0	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L0	Pressure (Depth)	Water Column	unitless
86							2	Rain Heat Flux												W/m2	RAINFLX			RAINFLX_L2	["METBK"]	L2	Rain Heat Flux		W/m2
87							2	Rain rate												mm/hr	RAINRTE			RAINRTE_L2	["METBK"]	L2	Rain rate		mm/hr
88	not applicable	not applicable	not applicable	L2-SR-RQ-3926, L2-SR-RQ-3928	Optical Absorption, Optical Attenuation	[DCN 1341-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/28089882-716e-4fa8-b4b6-c703f5630882/1341-00690_Data_Product_SPEC_OPTATTN_OOI.pdf], [DCN 1341-00700|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/464dee40-a810-4fbc-bcd1-4874e787bbca/1341-00700_Data_Product_SPEC_OPTABSN_OOI.pdf]	0	Reference Beam Attenuation	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/131c6f4a-e3fb-4f70-99b2-4a13c69b66eb/1342-00690_Data_Processing_Flow_OPTAA_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	OPTCREF	DCN 1342-00690	DCN 1341-00690, DCN 1341-00700	OPTCREF_L0	["OPTAA"]	L0	Reference Beam Attenuation	Water Column	unitless
89	not applicable	not applicable	not applicable	L2-SR-RQ-3025	Relative humidity 	DCN 1341-00280 (FDCHP), DCN 1341-00360 (METBK)	0	Relative Humidity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00360 (METBK)	not applicable	not applicable	not applicable	not applicable	TBD (FDCHP), percent (METBK)	RELHUMI	DCN 1342-00280 (FDCHP), DCN 1342-00360 (METBK)	DCN 1341-00280 (FDCHP), DCN 1341-00360 (METBK)	RELHUMI_L1	["FDCHP", "METBK"]	L1	Relative Humidity	Air-Sea Interface, Surface Water	percent
90	not applicable	not applicable	not applicable	L2-SR-RQ-3025	Relative humidity 	DCN 1341-00280 (FDCHP), DCN 1341-00360 (METBK)	0	Relative Humidity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00360 (METBK)	not applicable	not applicable	not applicable	not applicable	TBD (FDCHP), percent (METBK)	RELHUMI	DCN 1342-00280 (FDCHP), DCN 1342-00360 (METBK)	DCN 1341-00280 (FDCHP), DCN 1341-00360 (METBK)	RELHUMI_L0	["FDCHP", "METBK"]	L0	Relative Humidity	Air-Sea Interface, Surface Water	TBD (FDCHP), percent (METBK)
91	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00160|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/6879d629-e938-4546-8ed6-edd67583aa5f/1341-00160_Data_Product_Spec_TRHPHCC_OOI.pdf]	0	Resistivity R1	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	Ohm, raw voltage	TRHPHR1	DCN 1342-00150	DCN 1341-00160	TRHPHR1_L0	["TRHPH"]	L0	Resistivity R1	Seafloor/Crust	Ohm, raw voltage
92	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00160|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/6879d629-e938-4546-8ed6-edd67583aa5f/1341-00160_Data_Product_Spec_TRHPHCC_OOI.pdf]	0	Resistivity R2	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	Ohm, raw voltage	TRHPHR2	DCN 1342-00150	DCN 1341-00160	TRHPHR2_L0	["TRHPH"]	L0	Resistivity R2	Seafloor/Crust	Ohm, raw voltage
93	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00160|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/6879d629-e938-4546-8ed6-edd67583aa5f/1341-00160_Data_Product_Spec_TRHPHCC_OOI.pdf]	0	Resistivity R3	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	Ohm, raw voltage	TRHPHR3	DCN 1342-00150	DCN 1341-00160	TRHPHR3_L0	["TRHPH"]	L0	Resistivity R3	Seafloor/Crust	Ohm, raw voltage
94	not applicable	not applicable	not applicable	L2-SR-RQ-3593	Round Trip Acoustic Travel Time (RATT)	DCN 1341-00560	0	Roundtrip Acoustic Travel Time (RATT)	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IESRATT	DCN 1342-00560	DCN 1341-00560	IESRATT_L1	["HPIES"]	L1	Roundtrip Acoustic Travel Time (RATT)	Water Column	milliseconds
95	not applicable	not applicable	not applicable	L2-SR-RQ-3593	Round Trip Acoustic Travel Time (RATT)	DCN 1341-00560	0	Roundtrip Acoustic Travel Time (RATT)	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00560	not applicable	not applicable	not applicable	not applicable	TBD	IESRATT	DCN 1342-00560	DCN 1341-00560	IESRATT_L0	["HPIES"]	L0	Roundtrip Acoustic Travel Time (RATT)	Water Column	TBD
96	not applicable	not applicable	not applicable	L2-SR-RQ-3413, L2-SR-RQ-3711	The OOI shall provide fixed measurements of Sea Surface Conductivity.	DCN 1341-00360	0	Sea Surface Conductivity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	S/m	CONDSRF	DCN 1342-00360	DCN 1341-00360	CONDSRF_L0	["METBK"]	L0	Sea Surface Conductivity	Air-Sea Interface, Surface Water	S/m
97	not applicable	not applicable	not applicable	L2-SR-RQ-3413, L2-SR-RQ-3711	The OOI shall provide fixed measurements of Sea Surface Conductivity.	DCN 1341-00360	0	Sea Surface Conductivity	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	S/m	CONDSRF	DCN 1342-00360	DCN 1341-00360	CONDSRF_L1	["METBK"]	L1	Sea Surface Conductivity	Air-Sea Interface, Surface Water	S/m
98							2	Sea Surface Salinity 												unitless	SALSURF			SALSURF_L2	["METBK"]	L2	Sea Surface Salinity		unitless
99	not applicable	not applicable	not applicable	L2-SR-RQ-3416, L2-SR-RQ-3708	The OOI shall provide fixed measurements of Sea Surface Temperature.	DCN 1341-00360	0	Sea Surface Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	degree C	TEMPSRF	DCN 1342-00360	DCN 1341-00360	TEMPSRF_L0	["METBK"]	L0	Sea Surface Temperature	Air-Sea Interface, Surface Water	degree C
100	not applicable	not applicable	not applicable	L2-SR-RQ-3416, L2-SR-RQ-3708	The OOI shall provide fixed measurements of Sea Surface Temperature.	DCN 1341-00360	0	Sea Surface Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00360	not applicable	not applicable	not applicable	not applicable	degree C	TEMPSRF	DCN 1342-00360	DCN 1341-00360	TEMPSRF_L1	["METBK"]	L1	Sea Surface Temperature	Air-Sea Interface, Surface Water	degree C
101	not applicable	not applicable	not applicable	L2-SR-RQ-3084	Coupled near bottom pressure and tilt (Seafloor uplift/deflation)	DCN 1341-00060	0	Seafloor High-Resolution Tilt	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00060	not applicable	not applicable	not applicable	not applicable	microradians	BOTTILT	DCN 1342-00060	DCN 1341-00060	BOTTILT_L1	["BOTPT"]	L1	Seafloor High-Resolution Tilt	Seafloor/Crust	microradians
104	TBD	TBD	TBD	L2-SR-RQ-3084	Coupled near bottom pressure and tilt (Seafloor uplift/deflation)	DCN 1341-00080	2	Seafloor Uplift and Deflation	TBD	TBD	TBD	TBD	TBD		DCN 1342-00060	TBD	TBD	TBD	TBD	meters	BOTSFLU	DCN 1342-00060	DCN 1341-00080	BOTSFLU_L2	["BOTPT"]	L2	Seafloor Uplift and Deflation	Seafloor/Crust	meters
105																					SENSFLX			SENSFLX_L2	["METBK"]	L2	Sensible Heat Flux		W/m2
106	TBD	TBD	TBD	L2-SR-RQ-3100	Short period ground motion	DCN 1341-00110	1	Short Period Ground Velocity	TBD	TBD	TBD	TBD	TBD		DCN 1342-00110	TBD	TBD	TBD	TBD	m/s	SGRDVEL	DCN 1342-00110	DCN 1341-00110	SGRDVEL_L1	["OBSSP"]	L1	Short Period Ground Velocity	Seafloor/Crust	m/s
107	not applicable	not applicable	not applicable	L2-SR-RQ-3926, L2-SR-RQ-3928	Optical Absorption, Optical Attenuation	[DCN 1341-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/28089882-716e-4fa8-b4b6-c703f5630882/1341-00690_Data_Product_SPEC_OPTATTN_OOI.pdf], [DCN 1341-00700|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/464dee40-a810-4fbc-bcd1-4874e787bbca/1341-00700_Data_Product_SPEC_OPTABSN_OOI.pdf]	0	Signal Beam Attenuation	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/131c6f4a-e3fb-4f70-99b2-4a13c69b66eb/1342-00690_Data_Processing_Flow_OPTAA_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	OPTCSIG	DCN 1342-00690	DCN 1341-00690, DCN 1341-00700	OPTCSIG_L0	["OPTAA"]	L0	Signal Beam Attenuation	Water Column	unitless
108	TBD	TBD	TBD	L2-SR-RQ-3179 	Specific Humidity	DCN 1341-00370	2	Specific Humidity	TBD	TBD	TBD	TBD	TBD		DCN 1342-00360	TBD	TBD	TBD	TBD	percent	SPECHUM	DCN 1342-00360	DCN 1341-00370	SPECHUM_L2	["METBK"]	L2	Specific Humidity	Air-Sea Interface, Surface Water	percent
109							2	Specific Humidity at 2 m												percent	SPHUM2M			SPHUM2M_L2	["METBK"]	L2	Specific Humidity at 2 m		percent
110	not applicable	not applicable	not applicable	L2-SR-RQ-3805	Imagery, Still	DCN 1341-00830	1	Still Image 	not applicable	not applicable	not applicable	not applicable	not applicable		n/a	not applicable	not applicable	not applicable	not applicable	Lossless compression Image File	CAMSTIL	n/a	DCN 1341-00830	CAMSTIL_L1	["CAMDS"]	L1	Still Image	Benthic Boundary Layer, Seafloor/Crust	Lossless compression Image File
111	not applicable	not applicable	not applicable	L2-SR-RQ-3094	In Situ Mass-Resolved Dissolved Gas Chemistry	DCN 1341-00240	0	Suite of Dissolved Gas Measurements (10-20 individual gases) vs. Time 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00240	not applicable	not applicable	not applicable	not applicable	TBD	MASSPEC	DCN 1342-00240	DCN 1341-00240	MASSPEC_L1	["MASSP"]	L1	Suite of Dissolved Gas Measurements (10-20 individual gases) vs. Time	Seafloor/Crust	uM and daltons
112	not applicable	not applicable	not applicable	L2-SR-RQ-3094	In Situ Mass-Resolved Dissolved Gas Chemistry	DCN 1341-00240	0	Suite of Dissolved Gas Measurements (10-20 individual gases) vs. Time 	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00240	not applicable	not applicable	not applicable	not applicable	TBD	MASSPEC	DCN 1342-00240	DCN 1341-00240	MASSPEC_L0	["MASSP"]	L0	Suite of Dissolved Gas Measurements (10-20 individual gases) vs. Time	Seafloor/Crust	TBD
113	not applicable	not applicable	not applicable	L2-SR-RQ-3044	Water Temperature	[DCN 1341-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/009f4f2f-55ea-46af-b980-e8f612a5831d/1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf]	0	Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	TEMPWAT	DCN 1342-00010	DCN 1341-00010	TEMPWAT_L1	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L1	Temperature	Water Column	degrees C
114	not applicable	not applicable	not applicable	L2-SR-RQ-3044	Water Temperature	[DCN 1341-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/009f4f2f-55ea-46af-b980-e8f612a5831d/1341-00010_Data_Product_SPEC_TEMPWAT_OOI.pdf]	0	Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00010|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/a2d4b90f-145f-44f6-bf03-6e720d87893c/1342-00010_Data_Processing_Flow_CTD_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	unitless	TEMPWAT	DCN 1342-00010	DCN 1341-00010	TEMPWAT_L0	["CTDAV", "CTDBP", "CTDGV", "CTDMO", "CTDPF"]	L0	Temperature	Water Column	unitless
115	not applicable	not applicable	not applicable	L2-SR-RQ-3101	Diffuse Vent Fluid 3-Dimensional Temperature Array	DCN 1341-00130	0	Temperature Array in Spatial Grid	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00130	not applicable	not applicable	not applicable	not applicable	TBD	TEMPSFL	DCN 1342-00130	DCN 1341-00130	TEMPSFL_L0	["TMPSF"]	L0	Temperature Array in Spatial Grid	Seafloor/Crust	TBD
116	not applicable	not applicable	not applicable	L2-SR-RQ-3101	Diffuse Vent Fluid 3-Dimensional Temperature Array	DCN 1341-00130	0	Temperature Array in Spatial Grid	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00130	not applicable	not applicable	not applicable	not applicable	TBD	TEMPSFL	DCN 1342-00130	DCN 1341-00130	TEMPSFL_L1	["TMPSF"]	L1	Temperature Array in Spatial Grid	Seafloor/Crust	C
117	not applicable	not applicable	not applicable	L2-SR-RQ-3926, L2-SR-RQ-3928	Optical Absorption, Optical Attenuation	[DCN 1341-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/28089882-716e-4fa8-b4b6-c703f5630882/1341-00690_Data_Product_SPEC_OPTATTN_OOI.pdf], [DCN 1341-00700|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/464dee40-a810-4fbc-bcd1-4874e787bbca/1341-00700_Data_Product_SPEC_OPTABSN_OOI.pdf]	0	Temperature from OPTAA	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00690|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/131c6f4a-e3fb-4f70-99b2-4a13c69b66eb/1342-00690_Data_Processing_Flow_OPTAA_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	degrees C	OPTTEMP	DCN 1342-00690	DCN 1341-00690, DCN 1341-00700	OPTTEMP_L0	["OPTAA"]	L0	Temperature from OPTAA	Water Column	degrees C
118	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/23624e5a-09c7-4aaf-b681-04584c9f9e48/1341-00150_Data_Product_Spec_TRHPHTE_OOI.pdf]	0	Thermistor Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	V	TRHPHVS	DCN 1342-00150	DCN 1341-00150	TRHPHVS_L0	["TRHPH"]	L0	Thermistor Temperature	Seafloor/Crust	V
119	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/23624e5a-09c7-4aaf-b681-04584c9f9e48/1341-00150_Data_Product_Spec_TRHPHTE_OOI.pdf]	0	Thermocouple Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	V	TRHPHVC	DCN 1342-00150	DCN 1341-00150	TRHPHVC_L0	["TRHPH"]	L0	Thermocouple Temperature	Seafloor/Crust	V
120	not applicable	not applicable	not applicable	L2-SR-RQ-3894	Turbulent Air Temperature	DCN 1341-00290	0	Turbulent Air Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	TMPATUR	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00290	TMPATUR_L0	["FDCHP", "FDCLP"]	L0	Turbulent Air Temperature	Air-Sea Interface	TBD
121	not applicable	not applicable	not applicable	L2-SR-RQ-3894	Turbulent Air Temperature	DCN 1341-00290	0	Turbulent Air Temperature	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	TMPATUR	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00290	TMPATUR_L1	["FDCHP", "FDCLP"]	L1	Turbulent Air Temperature	Air-Sea Interface	degree C
122	not applicable	not applicable	not applicable	L2-SR-RQ-3899	Turbulent Humidity Fluctuations	DCN 1341-00300	0	Turbulent Humidity Fluctuation	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	MOISTUR	DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	DCN 1341-00300	MOISTUR_L0	["FDCHP", "FDCLP"]	L0	Turbulent Humidity Fluctuation	Air-Sea Interface	TBD
123	not applicable	not applicable	not applicable	L2-SR-RQ-3899	Turbulent Humidity Fluctuations	DCN 1341-00300	0	Turbulent Humidity Fluctuation	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	MOISTUR	DCN 1342-00280 (FDHCP), DCN 1342-00290 (FDCLP)	DCN 1341-00300	MOISTUR_L1	["FDCHP", "FDCLP"]	L1	Turbulent Humidity Fluctuation	Air-Sea Interface	percent
124	not applicable	not applicable	not applicable	L2-SR-RQ-3058	Turbulent Point Water Velocity	[DCN 1341-00781|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/ff4b0896-321e-4811-9137-400a75b0b908/1341-00781_Data_Product_SPEC_VELPTTU_Nobska_OOI.pdf] (Nobska), [DCN 1341-00780|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/969c8edd-d2c7-493d-abbb-e59198941942/1341-00780_Data_Product_SPEC_VELPTTU_Nortek_OOI.pdf] (Nortek)	0	Turbulent Point Water Velocity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00780|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/75d9e7c6-40cd-40de-95f1-d5491b0bc42f/1342-00780_Data_Processing_Flow_VEL3D_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	cm/s (Nobska), m/s (Nortek)	VELPTTU	DCN 1342-00780	DCN 1341-00781 (Nobska), DCN 1341-00780 (Nortek)	VELPTTU_L1	["VEL3D"]	L1	Turbulent Point Water Velocity	Water Column, Seafloor/Crust	m/s
125	not applicable	not applicable	not applicable	L2-SR-RQ-3058	Turbulent Point Water Velocity	[DCN 1341-00781|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/ff4b0896-321e-4811-9137-400a75b0b908/1341-00781_Data_Product_SPEC_VELPTTU_Nobska_OOI.pdf] (Nobska), [DCN 1341-00780|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/969c8edd-d2c7-493d-abbb-e59198941942/1341-00780_Data_Product_SPEC_VELPTTU_Nortek_OOI.pdf] (Nortek)	0	Turbulent Point Water Velocity	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00780|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/75d9e7c6-40cd-40de-95f1-d5491b0bc42f/1342-00780_Data_Processing_Flow_VEL3D_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	cm/s (Nobska), m/s (Nortek)	VELPTTU	DCN 1342-00780	DCN 1341-00781 (Nobska), DCN 1341-00780 (Nortek)	VELPTTU_L0	["VEL3D"]	L0	Turbulent Point Water Velocity	Water Column, Seafloor/Crust	cm/s (Nobska), m/s (Nortek)
126	TBD	TBD	TBD	L2-SR-RQ-3060	Turbulent Water Velocity Profile	DCN 1341-00760	1	Turbulent Velocity Profile	TBD	TBD	TBD	TBD	TBD		DCN 1342-00760	TBD	TBD	TBD	TBD	m/s	VELTURB	DCN 1342-00760	DCN 1341-00760	VELTURB_L1	["VADCP"]	L1	Turbulent Velocity Profile	Water Column	m/s
127	not applicable	not applicable	not applicable	L2-SR-RQ-3757	Water Velocity Profile	[DCN 1341-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/7ea90727-c1b4-4d73-b565-0ae4227da451/1341-00750_Data_Product_SPEC_VELPROF_ECHOINT_OOI.pdf]	0	Velocity Profile	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/c1fb71ed-ec32-4035-9d7b-d8228b57f7b0/1342-00750_Data_Processing_Flow_ADCP_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	mm/s	VELPROF	DCN 1342-00750	DCN 1341-00750	VELPROF_L0	["ADCPA", "ADCPS", "ADCPT"]	L0	Velocity Profile	Water Column	mm/s
128	not applicable	not applicable	not applicable	L2-SR-RQ-3757	Water Velocity Profile	[DCN 1341-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/7ea90727-c1b4-4d73-b565-0ae4227da451/1341-00750_Data_Product_SPEC_VELPROF_ECHOINT_OOI.pdf]	0	Velocity Profile	not applicable	not applicable	not applicable	not applicable	not applicable		[DCN 1342-00750|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/c1fb71ed-ec32-4035-9d7b-d8228b57f7b0/1342-00750_Data_Processing_Flow_ADCP_OOI.pdf]	not applicable	not applicable	not applicable	not applicable	mm/s	VELPROF	DCN 1342-00750	DCN 1341-00750	VELPROF_L1	["ADCPA", "ADCPS", "ADCPT"]	L1	Velocity Profile	Water Column	m/s
129	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00160|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/6879d629-e938-4546-8ed6-edd67583aa5f/1341-00160_Data_Product_Spec_TRHPHCC_OOI.pdf]	2	Vent Fluid Chloride Concentration	applicable	applicable	applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	applicable	applicable	applicable	??M	TRHPHCC	DCN 1342-00150	DCN 1341-00160	TRHPHCC_L2	["TRHPH"]	L2	Vent Fluid Chloride Concentration	Seafloor/Crust	??M
145	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00190	0	pH	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHPH	DCN 1342-00120	DCN 1341-00190	THSPHPH_L2	["THSPH"]	L2	pH	Seafloor/Crust	pH units
146	TBD	TBD	TBD	L2-SR-RQ-3047	pH	DCN 1341-00510	1	pH	TBD	TBD	TBD	TBD	TBD		DCN 1342-00510	TBD	TBD	TBD	TBD	pH units	PHWATER	DCN 1342-00510	DCN 1341-00510	PHWATER_L1	["PHSEN"]	L1	pH	Water Column	pH units
130	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00170|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/5c359aaa-9a4d-4f55-88d3-17a9c4e7082f/1341-00170_Data_Product_Spec_TRHPHEH_OOI.pdf]	1	Vent Fluid Oxidation-Reduction Potential (ORP)	not applicable	applicable	applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	applicable	applicable	applicable	mV	TRHPHEH	DCN 1342-00150	DCN 1341-00170	TRHPHEH_L1	["TRHPH"]	L1	Vent Fluid Oxidation-Reduction Potential (ORP)	Seafloor/Crust	mV
131	not applicable	not applicable	not applicable	L2-SR-RQ-3408	Interactive Sampling for Vent Fluid Chemistry	DCN 1341-00140	0	Vent Fluid Temperature from RASFL	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00140	not applicable	not applicable	not applicable	not applicable	TBD	TEMPVNT	DCN 1342-00140	DCN 1341-00140	TEMPVNT_L1	["RASFL"]	L1	Vent Fluid Temperature from RASFL	Seafloor/Crust	degrees C
132	not applicable	not applicable	not applicable	L2-SR-RQ-3408	Interactive Sampling for Vent Fluid Chemistry	DCN 1341-00140	0	Vent Fluid Temperature from RASFL	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00140	not applicable	not applicable	not applicable	not applicable	TBD	TEMPVNT	DCN 1342-00140	DCN 1341-00140	TEMPVNT_L0	["RASFL"]	L0	Vent Fluid Temperature from RASFL	Seafloor/Crust	TBD
133	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00120	0	Vent Fluid Temperature from THSPH	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHTE	DCN 1342-00120	DCN 1341-00120	THSPHTE_L1	["THSPH"]	L1	Vent Fluid Temperature from THSPH	Seafloor/Crust	degrees C
134	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00120	0	Vent Fluid Temperature from THSPH	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHTE	DCN 1342-00120	DCN 1341-00120	THSPHTE_L0	["THSPH"]	L0	Vent Fluid Temperature from THSPH	Seafloor/Crust	V
135	not applicable	not applicable	not applicable	L2-SR-RQ-3090	Vent Fluid chloride concentrations	[DCN 1341-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/23624e5a-09c7-4aaf-b681-04584c9f9e48/1341-00150_Data_Product_Spec_TRHPHTE_OOI.pdf]	1	Vent Fluid Temperature from TRHPH	not applicable	applicable	applicable	not applicable	not applicable		[DCN 1342-00150|https://alfresco.oceanobservatories.org/alfresco/d/d/workspace/SpacesStore/54181509-329e-4ded-8081-7524d30aff49/1342-00150_Data_Processing_Flow_TRHPH_OOI.pdf]	not applicable	applicable	applicable	applicable	C	TRHPHTE	DCN 1342-00150	DCN 1341-00150	TRHPHTE_L1	["TRHPH"]	L1	Vent Fluid Temperature from TRHPH	Seafloor/Crust	C
136	TBD	TBD	TBD	L2-SR-RQ-3641	Vertically Averaged Horizontal Water Velocity 	DCN 1341-00590	2	Vertically Averaged Horizontal Water Velocity (VAHWV) 	TBD	TBD	TBD	TBD	TBD		DCN 1342-00560	TBD	TBD	TBD	TBD	m/s	IESAHWV	DCN 1342-00560	DCN 1341-00590	IESAHWV_L2	["HPIES"]	L2	Vertically Averaged Horizontal Water Velocity (VAHWV)	Water Column	m/s
137	TBD	TBD	TBD	L2-SR-RQ-3073	Water Column Heat Content	DCN 1341-00610	2	Water Column Heat Content	TBD	TBD	TBD	TBD	TBD		DCN 1342-00560	TBD	TBD	TBD	TBD	Jm-2	IESHEAT	DCN 1342-00560	DCN 1341-00610	IESHEAT_L2	["HPIES"]	L2	Water Column Heat Content	Water Column	Jm-2
138	TBD	TBD	TBD	L2-SR-RQ-3073	Water Property Profile Time Series	DCN 1341-00600	2	Water Property Profile Time Series	TBD	TBD	TBD	TBD	TBD		DCN 1342-00560	TBD	TBD	TBD	TBD	T (degree C), salinity (unitless), density (kgm-3)	IES_WPP	DCN 1342-00560	DCN 1341-00600	IES_WPP_L2	["HPIES"]	L2	Water Property Profile Time Series	Water Column	T (degree C), salinity (unitless), density (kgm-3)
139	not applicable	not applicable	not applicable	L2-SR-RQ-3587	The OOI shall provide surface wave properties that include but are not limited to:  Significant wave height [H_m0], Mean period [T_zero], Mean direction [theta_1], Spectral width (directional spreading function) [D(f,alpha)], Period of spectral peak [T_p], Direction of spectral peak [alpha_1], Average wave period [T_av], Spectral energy density (non-directional) for multiple frequency bands [C_11(f)], Directional spectra for multiple frequency bands [S(f,alpha)]	DCN 1341-00450	0	Wave Spectral Properties	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00450	not applicable	not applicable	not applicable	not applicable	m; s; degrees; Hz; m^2 Hz^-1	WAVSTAT	DCN 1342-00450	DCN 1341-00450	WAVSTAT_L0	["ADCPT", "WAVSS"]	L0	Wave Spectral Properties	Air-Sea Interface, Surface Water	m; s; degrees; Hz; m^2 Hz^-1
140	not applicable	not applicable	not applicable	L2-SR-RQ-3587	The OOI shall provide surface wave properties that include but are not limited to:  Significant wave height [H_m0], Mean period [T_zero], Mean direction [theta_1], Spectral width (directional spreading function) [D(f,alpha)], Period of spectral peak [T_p], Direction of spectral peak [alpha_1], Average wave period [T_av], Spectral energy density (non-directional) for multiple frequency bands [C_11(f)], Directional spectra for multiple frequency bands [S(f,alpha)]	DCN 1341-00450	0	Wave Spectral Properties	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00450	not applicable	not applicable	not applicable	not applicable	m; s; degrees; Hz; m^2 Hz^-1	WAVSTAT	DCN 1342-00450	DCN 1341-00450	WAVSTAT_L2	["ADCPT", "WAVSS"]	L2	Wave Spectral Properties	Air-Sea Interface, Surface Water	m; s; degrees; Hz; m^2 Hz^-1
141							2	Wind Velocity at 10 m  												m/s	WIND10M			WIND10M_L2	["METBK"]	L2	Wind Velocity at 10 m		m/s
142	not applicable	not applicable	not applicable	L2-SR-RQ-3028	Turbulent wind velocity	DCN 1341-00310	0	Wind Velocity in 3 Dimensions	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	WINDTUR	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00310	WINDTUR_L0	["FDCHP", "FDCLP"]	L0	Wind Velocity in 3 Dimensions	Air-Sea Interface	TBD
143	not applicable	not applicable	not applicable	L2-SR-RQ-3028	Turbulent wind velocity	DCN 1341-00310	0	Wind Velocity in 3 Dimensions	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	not applicable	not applicable	not applicable	not applicable	TBD	WINDTUR	DCN 1342-00280 (FDCHP), DCN 1342-00290 (FDCLP)	DCN 1341-00310	WINDTUR_L1	["FDCHP", "FDCLP"]	L1	Wind Velocity in 3 Dimensions	Air-Sea Interface	m/s
144	not applicable	not applicable	not applicable	L2-SR-RQ-3092	Vent Fluid pH-temperature-H2 chemistry	DCN 1341-00190	0	pH	not applicable	not applicable	not applicable	not applicable	not applicable		DCN 1342-00120	not applicable	not applicable	not applicable	not applicable	V	THSPHPH	DCN 1342-00120	DCN 1341-00190	THSPHPH_L0	["THSPH"]	L0	pH	Seafloor/Crust	V
\.


--
-- Data for Name: safinstrumentdevices; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY safinstrumentdevices (iclass, first_deployment_date, platform_agent_type, relative_depth, data_agent_recovery, data_agent_rt, data_product_list, deploy_date, depth_port_max, depth_port_min, depth_subsite, id, instrument_agent_rt, instrument_class, instrument_model, instrument_model1, instrument_series, instrument_subseries, latitude, longitude, makemodel, ready_for_2013) FROM stdin;
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	5200	GA03FLMA-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
ADCPS	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-08-05 00:00:00	500	500	4250	GP03FLMA-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	50.4676	-144.5174	WorkHorse LongRanger Sentinel 75khz	
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL003-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	2800	GI03FLMA-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
FDCHP	2015-01	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["FLUXHOT_L2", "FLUXMOM_L2", "FLUXWET_L2", "MOISTUR_L0", "MOISTUR_L1", "MOTFLUX_L0", "RELHUMI_L0", "RELHUMI_L1", "TMPATUR_L0", "TMPATUR_L1", "WINDTUR_L0", "WINDTUR_L1"]	2020-01-01 00:00:00	-3	-3	4800	GS01SUMO-SB001-04-FDCHPA999	TRUE	FDCHP	FDCHPA	FDCHP	A	01	-54.4704	-89.2796	non-commercial FDCHP	No
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	2800	GI03FLMB-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF004-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	50.1969	-144.7131	FLBBRTD	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	4800	GS03FLMB-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-88.894	SBE 37IM	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL001-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
PARAD	2013-10	Shore CyberPoP - Coastal Mooring Server	Near bottom to 15m below surface	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	500	15	500	CE09OSPM-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	46.91	-124.95		
FLORT	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMA-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	60.4582	-38.4407	ECO Triplet-w	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF004-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	50.1969	-144.7131	Optode 4330	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	2800	GI03FLMB-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 200	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2906	200	2906	RS01SBVM-DP01A-01-CTDPFL104	TRUE	CTDPF	CTDPFL	CTDPF	L	01	44.55404	-125.35235	SBE 52MP	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	5200	GA03FLMB-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
CTDBP	2014-06	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	15	15	2800	GI01SUMO-RI002-02-CTDBPF999	TRUE	CTDBP	CTDBPF	CTDBP	F	01	60.6136	-38.2581	SBE 16plusV2	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	40m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	4800	GS01SUMO-RI003-04-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
PHSEN	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMB-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	-54.0814	-88.894	SAMI-pH	
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL006-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
CAMDS	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF005-02-CAMDSA999	TRUE	CAMDS	CAMDSA	CAMDS	A	01	47	-124.27	Kongsberg (Make/Model TBD)	No. Waiver 1303-00956.
PCO2W	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-09-PCO2WB103	TRUE	PCO2W	PCO2WB	PCO2W	B	01	44.64	-124.3	SAMI-pCO2	
METBK	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	80	CE02SHSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	44.64	-124.3	ASIMET	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	5200	GA03FLMA-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL003-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
FLORT	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMB-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	50.125	-144.2097	ECO Triplet-w	
CTDPF	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-01-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	44.64	-124.3		
PCO2W	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI002-05-PCO2WB999	FALSE	PCO2W	PCO2WB	PCO2W	B	01	44.65	-124.1	SAMI-pCO2	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	500	500	4250	GP03FLMA-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
PRESF	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["SFLPRES_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF005-04-PRESFA999	FALSE	PRESF	PRESFA	PRESF	A	01	44.65	-124.1	SBE 26plus	
METBK	2015-01	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	5200	GA01SUMO-SB001-02-METBKA999	TRUE	METBK	METBKA	METBK	A	01	-42.9906	-42.5104	ASIMET	
CTDBP	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF005-02-CTDBPD999	TRUE	CTDBP	CTDBPD	CTDBP	D	01	40.03333333	-70.79166667	SBE 16plusV2	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-04-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	-54.4068	-89.2796		
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	250m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	2800	GI01SUMO-RI003-09-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	90	90	4250	GP03FLMB-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
OBSSP	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SGRDVEL_L1"]	2013-07-16 00:00:00			1552	RS03ASHS-MJ03B-06-OBSSPA305	TRUE	OBSSP	OBSSPA	OBSSP	A	01	45.93619	-130.01417	Guralp (Make/Model TBD)	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	4800	GS03FLMA-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-89.6652	SBE 37IM	
SPKIR	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	40.16666667	-70.79166667		
CAMDS	2014	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00			811	RS01SUM2-MJ01B-08-CAMDSB103	TRUE	CAMDS	CAMDSB	CAMDS	B	01	44.57	-125.147	Kongsberg (Make/Model TBD)	Maybe
FLORD	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL002-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00			500	CE04OSHY-PC01B-4A-DOSTAD109	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.9	Optode 4831	
DOSTA	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI003-02-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	40.03333333	-70.79166667	Optode 4831	
VELPT	2014-06	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	15	15	2800	GI01SUMO-RI002-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	60.6136	-38.2581	Aquadopp 300m	
VELPT	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF004-03-VELPTB999	TRUE	VELPT	VELPTB	VELPT	B	01	39.91666667	-70.79166667	Aquadopp 3000m	
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL002-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
PHSEN	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF004-02-PHSEND999	FALSE	PHSEN	PHSEND	PHSEN	D	01	47	-124.162	SAMI-pH	
PARAD	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	125	15	140	CP02PMCI-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	40.1	-70.79166667		
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL002-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	4800	GS03FLMB-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
SPKIR	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-06-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	44.64	-124.3		
VEL3D	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-11-22 00:00:00	450	15	520	CP04OSPM-WF001-01-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	39.91666667	-70.79166667		
ADCPS	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-08-05 00:00:00	500	500	4250	GP03FLMB-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	50.125	-144.2097	WorkHorse LongRanger Sentinel 75khz	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	2800	GI03FLMB-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL001-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
VEL3D	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	47	-124.162		
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	5200	GA03FLMA-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	-42.5073	-42.8905	Optode 4831	
PCO2A	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	80	CE02SHSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	44.64	-124.3	pCO2-pro	
FLORT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	150	15	360	CP02PMCO-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	39.975	-70.79166667	ECO Triplet	
SPKIR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI003-04-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	44.65	-124.9	OCR507 ICSW	
OPTAA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF004-02-OPTAAC999	TRUE	OPTAA	OPTAAC	OPTAA	C	01	46.91	-124.95	AC-S Deep	
ADCPS	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	2800	GI03FLMB-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	60.4582	-38.0755	WorkHorse LongRanger Sentinel 75khz	
OPTAA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-05-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	60.5732	-38.2581		
CTDPF	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-08-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	40.03333333	-70.79166667		
PHSEN	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF004-05-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	40.16666667	-70.79166667	SAMI-pH	
VEL3D	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	40.16666667	-70.79166667		
NUTNR	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI003-01-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	39.91666667	-70.79166667	ISUS	
OPTAA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI003-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	44.65	-124.9	AC-S	
SPKIR	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	-42.9222	-42.5104		
ADCPS	2014-06	Shore CyberPoP - Global Mooring Server	Mounted at 500m, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	2800	GI01SUMO-RI002-03-ADCPSN999	TRUE	ADCPS	ADCPSN	ADCPS	N	01	60.6136	-38.2581	WorkHorse LongRanger Sentinel 75khz	
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL005-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
CTDPF	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-08-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	47	-124.27		
FDCHP	2014-06	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["FLUXHOT_L2", "FLUXMOM_L2", "FLUXWET_L2", "MOISTUR_L0", "MOISTUR_L1", "MOTFLUX_L0", "RELHUMI_L0", "RELHUMI_L1", "TMPATUR_L0", "TMPATUR_L1", "WINDTUR_L0", "WINDTUR_L1"]	2020-01-01 00:00:00	-3	-3	2800	GI01SUMO-SB001-04-FDCHPA999	TRUE	FDCHP	FDCHPA	FDCHP	A	01	60.6136	-38.2581	non-commercial FDCHP	No
SPKIR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI003-04-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	44.64	-124.3	OCR507 ICSW	
ZPLSC	2014-08	Shore CyberPoP - Regional Observatory Management System	Mounted at 200m, uplooking	FALSE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	200	200	500	CE04OSHY-PC01B-08-ZPLSCB102	TRUE	ZPLSC	ZPLSCB	ZPLSC	B	01	44.65	-124.9		Maybe
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF002-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	-42.9222	-42.5104	Optode 4330	
ZPLSG	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 150m, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2013-08-05 00:00:00	150	150	4250	GP02HYPM-MP003-01-ZPLSGA999	FALSE	ZPLSG	ZPLSGA	ZPLSG	A	01	50.1969	-144.7131		Maybe
PHSEN	2015-01	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	20	20	5200	GA01SUMO-RI003-01-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	-42.9906	-42.5104	SAMI-pH	No
PCO2A	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	80	CE07SHSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	47	-124.27	pCO2-pro	
DOFST	2013-10	Shore CyberPoP - Coastal Mooring Server	Near bottom to 15m below surface	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	500	15	500	CE09OSPM-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	46.91	-124.95	SBE 43F	
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL004-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
OPTAA	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI003-03-OPTAAD999	FALSE	OPTAA	OPTAAD	OPTAA	D	01	47	-124.162	AC-S	
VEL3D	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF002-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	50.1969	-144.7131		
ZPLSC	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted 2m above bottom, uplooking	TRUE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF005-05-ZPLSCC999	TRUE	ZPLSC	ZPLSCC	ZPLSC	C	01	39.91666667	-70.79166667		Maybe
CTDBP	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI002-05-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	44.64	-124.3	SBE 16plusV2	
HYDLF	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["HYDAPLF_L0", "HYDAPLF_L1"]	2013-06-28 00:00:00	2909	2909	2906	RS01SLBS-MJ01A-05-HYDLFA101	TRUE	HYDLF	HYDLFA	HYDLF	A	01	44.55404	-125.35235	90-U	
PHSEN	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-10-PHSEND107	TRUE	PHSEN	PHSEND	PHSEN	D	01	44.65	-124.9	SAMI-pH	
ADCPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom mount, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	2906	2906	2906	RS01SBVM-LJ01A-10-ADCPTE101	TRUE	ADCPT	ADCPTE	ADCPT	E	01	44.55404	-125.35235	Quartermaster 150kHz	
PHSEN	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI002-03-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	44.65	-124.9	SAMI-pH	
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL005-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	1000m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	5200	GA01SUMO-RI003-13-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-42.9906	-42.5104	SBE 37IM	
VELPT	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI002-02-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	47	-124.27	Aquadopp 300m	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF004-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	-54.4068	-89.2796	Optode 4330	
CTDPF	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	450	15	520	CP02PMUO-WF001-03-CTDPFK999	FALSE	CTDPF	CTDPFK	CTDPF	K	01	39.90833333	-70.68333333	SBE 52MP	
ADCPT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2013-11-22 00:00:00	150	150	360	CP02PMCO-RI001-01-ADCPTG999	FALSE	ADCPT	ADCPTG	ADCPT	G	01	39.975	-70.79166667	WorkHorse Monitor 150khz	
FLORT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	46.91	-124.95	ECO Triplet-w	
METBK	2014-09	Shore CyberPoP - Coastal Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	130	CP03ISSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	40.16666667	-70.79166667	ASIMET	
DOFST	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-02-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	44.65	-124.1		
PHSEN	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-10-PHSEND103	TRUE	PHSEN	PHSEND	PHSEN	D	01	44.64	-124.3	SAMI-pH	
HPIES	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["IESAHWV_L2", "IESHEAT_L2", "IESPRES_L0", "IESPRES_L1", "IESRATT_L0", "IESRATT_L1", "IES_HEF_L0", "IES_HEF_L1", "IES_WPP_L2"]	2020-01-01 00:00:00			2906	RS01SBVM-LJ01A-05-HPIESA101	TRUE	HPIES	HPIESA	HPIES	A	01	44.55404	-125.35235	non-commercial HPIES	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	4800	GS03FLMB-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	-54.0814	-88.894	Optode 4831	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	2800	GI01SUMO-RI003-06-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	40	40	4250	GP03FLMA-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	50.4676	-144.5174	Optode 4831	
OPTAA	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF004-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	40.03333333	-70.79166667	AC-S	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	90	90	4250	GP03FLMA-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
TMPSF	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["TEMPSFL_L0", "TEMPSFL_L1"]	2013-07-16 00:00:00			1552	RS03ASHS-MJ03B-05-TMPSFA301	TRUE	TMPSF	TMPSFA	TMPSF	A	01	45.93619	-130.01417	XR-420	
DOFST	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["DOCONCF_L2"]	2013-11-22 00:00:00	125	15	140	CP02PMCI-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	40.1	-70.79166667	SBE 43F	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	750m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	2800	GI01SUMO-RI003-12-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	60.6136	-38.2581	SBE 37IM	
SPKIR	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI003-05-SPKIRB999	FALSE	SPKIR	SPKIRB	SPKIR	B	01	47	-124.162	OCR507 ICSW	
OPTAA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-05-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	-42.9222	-42.5104		
METBK	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2013-11-22 00:00:00	-3	-3	210	CP01CNSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	40.03333333	-70.79166667	ASIMET	
METBK	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2013-11-22 00:00:00	-3	-3	210	CP01CNSM-SB001-02-METBKA999	TRUE	METBK	METBKA	METBK	A	01	40.03333333	-70.79166667	ASIMET	
CTDPF	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	91.5	15	130	CP02PMUI-WF001-03-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	40.11666667	-70.68333333		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	4800	GS03FLMA-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-89.6652	SBE 37IM	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL002-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
OPTAA	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-08-OPTAAD106	TRUE	OPTAA	OPTAAD	OPTAA	D	01	44.64	-124.3	AC-S	
FLORT	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	40.16666667	-70.79166667	ECO Triplet-w	
CTDPF	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-04-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	60.5732	-38.2581		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	5200	GA01SUMO-RI003-06-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
PCO2A	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2013-11-22 00:00:00	0	0	210	CP01CNSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	40.03333333	-70.79166667	pCO2-pro	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	130m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	4800	GS01SUMO-RI003-07-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-06-CTDPFA303	TRUE	CTDPF	CTDPFA	CTDPF	A	01	46.06701	-129.60316	SBE 16plusV2	
PCO2W	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-03-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	47	-124.27		
ADCPA		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-05-ADCPAN999	FALSE	ADCPA	ADCPAN	ADCPA	N	01				
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL003-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
NUTNR	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-03-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	40.16666667	-70.79166667		
PARAD		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-06-PARADN999	FALSE	PARAD	PARADN	PARAD	N	01			QSP-2150	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	5200	GA03FLMA-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.8905	SBE 37IM	
PHSEN	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI002-03-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	47	-124.27	SAMI-pH	
DOSTA	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-06-DOSTAD108	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.9	Optode 4831	
OSMOI	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["PHSSAMP_L2"]	2013-07-16 00:00:00			1552	RS03ASHS-MJ03B-00-OSMOIA301	TRUE	OSMOI	OSMOIA	OSMOI	A	01	45.93619	-130.01417	OsmoSampler	
PARAD	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-09-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	47	-124.27		
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL003-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
CTDBP	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF005-01-CTDBPC999	FALSE	CTDBP	CTDBPC	CTDBP	C	01	44.65	-124.1	SBE 16plusV2	
PCO2W	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI002-05-PCO2WB999	FALSE	PCO2W	PCO2WB	PCO2W	B	01	47	-124.162	SAMI-pCO2	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-03-DOSTA0999	FALSE	DOSTA	DOSTA0	DOSTA	0	01	60.5732	-38.2581		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	5200	GA03FLMB-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
PHSEN	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMA-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	-54.0814	-89.6652	SAMI-pH	
WAVSS	2015-01	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	4800	GS01SUMO-SB001-05-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	-54.4704	-89.2796	TRIAXYS	
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	1m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	1	1	80	CE02SHSM-SB001-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	44.64	-124.3	Aquadopp 300m	
NUTNR	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	-54.4068	-89.2796		
PHSEN	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI002-03-PHSEND999	FALSE	PHSEN	PHSEND	PHSEN	D	01	47	-124.162	SAMI-pH	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL006-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
VEL3D	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF002-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	-54.4068	-89.2796		
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL002-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
METBK	2015-01	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	5200	GA01SUMO-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	-42.9906	-42.5104	ASIMET	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	4250	GP03FLMA-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.4676	-144.5174	SBE 37IM	
VEL3D	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-07-VEL3DC108	TRUE	VEL3D	VEL3DC	VEL3D	C	01	44.64	-124.3	VECTOR	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL005-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
DOFST	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["DOCONCF_L2"]	2013-11-22 00:00:00	450	15	520	CP02PMUO-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	39.90833333	-70.68333333	SBE 43F	
CTDPF	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	450	15	520	CP04OSPM-WF001-03-CTDPFK999	FALSE	CTDPF	CTDPFK	CTDPF	K	01	39.91666667	-70.79166667	SBE 52MP	
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL005-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-06-DOSTAD103	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.55404	-125.35235	Optode 4831	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF002-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	-54.4068	-89.2796	FLBBRTD	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	2800	GI03FLMB-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	1000m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	4800	GS01SUMO-RI003-13-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-54.4704	-89.2796	SBE 37IM	
OBSBB	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["GRNDACC_L1", "GRNDVEL_L1"]	2013-06-28 00:00:00	2909	2909	2906	RS01SLBS-MJ01A-05-OBSBBA101	TRUE	OBSBB	OBSBBA	OBSBB	A	01	44.55404	-125.35235	CMG-1T/5T	
CAMDS	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00			2906	RS01SBVM-PC01A-12-CAMDSC102	TRUE	CAMDS	CAMDSC	CAMDS	C	01	44.55404	-125.35235	Kongsberg (Make/Model TBD)	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-08-CTDPFA107	TRUE	CTDPF	CTDPFA	CTDPF	A	01	44.65	-124.9	SBE 16plusV2	
DOFST	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-01-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	47	-124.27		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	40m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	5200	GA01SUMO-RI003-04-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL003-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
DOSTA	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI002-04-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	40.16666667	-70.79166667	Optode 4831	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF002-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	-42.9222	-42.5104	FLBBRTD	
PCO2W	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-03-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	44.64	-124.3		
WAVSS	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	500	CE09OSSM-SB001-06-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	46.91	-124.95	TRIAXYS	
PCO2W	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-02-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	-54.4068	-89.2796		
PCO2W	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-03-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	47	-124.162		
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2906	2906	2906	RS01SBVM-LJ01A-06-CTDPFB101	TRUE	CTDPF	CTDPFB	CTDPF	B	01	44.55404	-125.35235	SBE 16plusV2	
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL006-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
MASSP	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["MASSPEC_L0", "MASSPEC_L1"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-09-MASSPA301	TRUE	MASSP	MASSPA	MASSP	A	01	45.93567	-130.01394	non-commercial MASSP	Maybe.
OPTAA	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF004-03-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	47	-124.27	AC-S	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	5200	GA03FLMA-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
PARAD	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-06-PARADA102	TRUE	PARAD	PARADA	PARAD	A	01	44.65	-124.9	digital PAR	
PRESF	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["SFLPRES_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF005-04-PRESFB999	TRUE	PRESF	PRESFB	PRESF	B	01	40.03333333	-70.79166667	SBE 26plus	
CTDBP	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI002-05-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	47	-124.27	SBE 16plusV2	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL003-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	4800	GS03FLMA-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL002-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
PCO2W	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF005-01-PCO2WB999	TRUE	PCO2W	PCO2WB	PCO2W	B	01	39.91666667	-70.79166667	SAMI-pCO2	
VEL3D	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF004-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	-54.4068	-89.2796		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	4800	GS03FLMB-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
SPKIR	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-07-SPKIRA301	TRUE	SPKIR	SPKIRA	SPKIR	A	01	46.06701	-129.60316	OCR507 ICSW	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	1000m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	2800	GI01SUMO-RI003-13-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	60.6136	-38.2581	SBE 37IM	
TRHPH	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["TRHPHCC_L2", "TRHPHEH_L1", "TRHPHR1_L0", "TRHPHR2_L0", "TRHPHR3_L0", "TRHPHTE_L1", "TRHPHVC_L0", "TRHPHVO_L0", "TRHPHVS_L0"]	2013-07-16 00:00:00	1520	1520	1551	RS03INT1-MJ03C-04-TRHPHA301	TRUE	TRHPH	TRHPHA	TRHPH	A	01	45.9357	-130.01533	non-commercial TRHPH	
CTDAV		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-03-CTDAVN999	FALSE	CTDAV	CTDAVN	CTDAV	N	01				
PHSEN	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMA-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	50.4676	-144.5174	SAMI-pH	
PHSEN	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMB-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	60.4582	-38.0755	SAMI-pH	
DOSTA	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF004-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	40.16666667	-70.79166667	Optode 4831	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	60m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	2800	GI01SUMO-RI003-05-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
SPKIR	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	44.65	-124.1		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	250m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	5200	GA01SUMO-RI003-09-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	4250	GP03FLMB-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.125	-144.2097	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	4800	GS03FLMA-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL006-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
NUTNR	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	44.65	-124.1		
ADCPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted at 5m, downlooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI003-01-ADCPTA999	TRUE	ADCPT	ADCPTA	ADCPT	A	01	44.64	-124.3	WorkHorse Monitor 150khz	
OPTAA	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF004-03-OPTAAD999	FALSE	OPTAA	OPTAAD	OPTAA	D	01	47	-124.162	AC-S	
FLORD	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL001-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
VEL3D	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF004-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	-42.9222	-42.5104		
FLORT	2013-10	Shore CyberPoP - Coastal Mooring Server	Near bottom to 15m below surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	500	15	500	CE09OSPM-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	46.91	-124.95	ECO Triplet	
OPTAA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-05-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	-54.4068	-89.2796		
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	250	250	4250	GP03FLMB-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
OPTAA	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI002-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	40.03333333	-70.79166667	AC-S	
FLORT	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMA-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	50.4676	-144.5174	ECO Triplet-w	
ADCPS	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	5200	GA03FLMA-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	-42.5073	-42.8905	WorkHorse LongRanger Sentinel 75khz	
FLORT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	44.64	-124.3	ECO Triplet-w	
FDCHP	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["FLUXHOT_L2", "FLUXMOM_L2", "FLUXWET_L2", "MOISTUR_L0", "MOISTUR_L1", "MOTFLUX_L0", "RELHUMI_L0", "RELHUMI_L1", "TMPATUR_L0", "TMPATUR_L1", "WINDTUR_L0", "WINDTUR_L1"]	2020-01-01 00:00:00	-3	-3	210	CP01CNSM-SB001-05-FDCHPA999	TRUE	FDCHP	FDCHPA	FDCHP	A	01	40.03333333	-70.79166667	non-commercial FDCHP	No
VEL3D	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-07-VEL3DC107	TRUE	VEL3D	VEL3DC	VEL3D	C	01	44.65	-124.9	VECTOR	
PCO2W	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-02-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	60.5732	-38.2581		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMB-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
VELPT	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI003-03-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	40.16666667	-70.79166667	Aquadopp 300m	
VADCP	2014-08	Shore CyberPoP - Regional Observatory Management System	Mounted at 200, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELTURB_L1"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-05-VADCPA301	TRUE	VADCP	VADCPA	VADCP	A	01	46.06701	-129.60316	Workhorse custom 600 kHz 5 Beam 	
METBK	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	500	CE04OSSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	44.65	-124.9	ASIMET	
CTDGV	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL002-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PREST	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SFLPRES_L1"]	2013-07-16 00:00:00			2654	RS03AXBS-MJ03A-07-PRESTA301	TRUE	PREST	PRESTA	PREST	A	01	46.10815	-129.61816	SBE 54	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL003-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
PCO2W	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-05-PCO2WA102	TRUE	PCO2W	PCO2WA	PCO2W	A	01	44.65	-124.9	SAMI-pCO2	
ZPLSG	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 150m, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	150	150	2800	GI02HYPM-MP003-01-ZPLSGA999	FALSE	ZPLSG	ZPLSGA	ZPLSG	A	01	60.5732	-38.2581		Maybe
PHSEN	2015-01	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	100	100	4800	GS01SUMO-RI003-02-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	-54.4704	-89.2796	SAMI-pH	No
HYDLF	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["HYDAPLF_L0", "HYDAPLF_L1"]	2013-07-16 00:00:00			1584	RS03CCAL-MJ03F-06-HYDLFA305	TRUE	HYDLF	HYDLFA	HYDLF	A	01	45.97618	-130.02011	90-U	
WAVSS	2014-06	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	2800	GI01SUMO-SB001-05-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	60.6136	-38.2581	TRIAXYS	
DOSTA	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF004-01-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.1	Optode 4831	
DOSTA	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI002-01-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.1	Optode 4831	
CTDBP	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI003-04-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	39.91666667	-70.79166667	SBE 16plusV2	
FLORD	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-01-FLORD0999	FALSE	FLORD	FLORD0	FLORD	0	01	60.5732	-38.2581		
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	350	350	4250	GP03FLMA-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	4800	GS03FLMA-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
HYDLF	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["HYDAPLF_L0", "HYDAPLF_L1"]	2013-07-16 00:00:00	1516	1516	1518	RS03ECAL-MJ03E-05-HYDLFA304	TRUE	HYDLF	HYDLFA	HYDLF	A	01	45.94801	-129.98053	90-U	
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL003-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
DOSTA	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-06-DOSTAD106	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.64	-124.3	Optode 4831	
WAVSS	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	80	CE07SHSM-SB001-06-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	47	-124.27	TRIAXYS	
CTDBP	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI003-01-CTDBPC999	FALSE	CTDBP	CTDBPC	CTDBP	C	01	44.65	-124.1	SBE 16plusV2	
PCO2W	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF005-01-PCO2WB999	TRUE	PCO2W	PCO2WB	PCO2W	B	01	40.03333333	-70.79166667	SAMI-pCO2	
FLORD	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL003-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-03-FLORTD104	TRUE	FLORT	FLORTD	FLORT	D	01	44.65	-124.9	ECO Triplet-w	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	4800	GS01SUMO-RI003-06-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	5200	GA03FLMB-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.1303	SBE 37IM	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF002-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	50.1969	-144.7131	Optode 4330	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	2800	GI03FLMA-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.4407	SBE 37IM	
NUTNR	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	47	-124.162		
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-06-CTDPFA103	TRUE	CTDPF	CTDPFA	CTDPF	A	01	44.55404	-125.35235	SBE 16plusV2	
DOSTA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI002-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	46.91	-124.95	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	60m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	4800	GS01SUMO-RI003-05-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	5200	GA03FLMB-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	-42.5073	-42.1303	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	4800	GS03FLMA-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
NUTNR	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-11-NUTNRA301	TRUE	NUTNR	NUTNRA	NUTNR	A	01	46.06701	-129.60316	Deep SUNA	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	2800	GI03FLMB-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
PHSEN	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI002-03-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	44.64	-124.3	SAMI-pH	
PHSEN	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-07-PHSENA102	TRUE	PHSEN	PHSENA	PHSEN	A	01	44.55404	-125.35235	SAMI-pH	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	60m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	5200	GA01SUMO-RI003-05-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
CTDGV	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL003-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00			2906	RS01SBVM-DP01A-05-OPTAAC102	TRUE	OPTAA	OPTAAC	OPTAA	C	01	44.55404	-125.35235	AC-S Deep	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	180	180	4250	GP03FLMB-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
CTDBP	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI002-03-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	40.03333333	-70.79166667	SBE 16plusV2	
VELPT	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["VELPTMN_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF004-04-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	40.03333333	-70.79166667	Aquadopp 300m	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL002-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDGV	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL002-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
HPIES	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["IESAHWV_L2", "IESHEAT_L2", "IESPRES_L0", "IESPRES_L1", "IESRATT_L0", "IESRATT_L1", "IES_HEF_L0", "IES_HEF_L1", "IES_WPP_L2"]	2020-01-01 00:00:00			2597	RS03AXVM-LJ03A-05-HPIESA301	TRUE	HPIES	HPIESA	HPIES	A	01	46.06701	-129.60316	non-commercial HPIES	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	350	350	4250	GP03FLMB-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMB-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	1500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	4800	GS01SUMO-RI003-14-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-54.4704	-89.2796	SBE 37IM	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF004-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	-42.9222	-42.5104	FLBBRTD	
VELPT	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-02-VELPTD106	TRUE	VELPT	VELPTD	VELPT	D	01	44.65	-124.9	Aquadopp	
PARAD	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	91.5	15	130	CP02PMUI-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	40.11666667	-70.68333333		
DOFST	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-06-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	40.16666667	-70.79166667		
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	2650	2650	2597	RS03AXVM-LJ03A-06-DOSTAD301	TRUE	DOSTA	DOSTAD	DOSTA	D	01	46.06701	-129.60316	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	180m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	5200	GA01SUMO-RI003-08-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	2800	GI03FLMA-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
PCO2A	2015-01	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	5200	GA01SUMO-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	-42.9906	-42.5104	pCO2-pro	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMB-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
PCO2W	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF005-01-PCO2WB999	TRUE	PCO2W	PCO2WB	PCO2W	B	01	40.16666667	-70.79166667	SAMI-pCO2	
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL005-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	2650	2650	2597	RS03AXVM-LJ03A-07-OPTAAC303	TRUE	OPTAA	OPTAAC	OPTAA	C	01	46.06701	-129.60316	AC-S Deep	
NUTNR		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-04-NUTNRN999	FALSE	NUTNR	NUTNRN	NUTNR	N	01			SUNA	
HYDBB	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-09-HYDBBA103	TRUE	HYDBB	HYDBBA	HYDBB	A	01	44.55404	-125.35235	icListen HF	
PCO2W	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-05-PCO2WA101	TRUE	PCO2W	PCO2WA	PCO2W	A	01	44.55404	-125.35235	SAMI-pCO2	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	4250	GP03FLMB-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.125	-144.2097	SBE 37IM	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	40	40	4250	GP03FLMB-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	50.125	-144.2097	Optode 4831	
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI002-02-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	44.65	-124.9	Aquadopp 300m	
NUTNR	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["NITROPT_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI003-04-NUTNRB999	FALSE	NUTNR	NUTNRB	NUTNR	B	01	44.65	-124.1	ISUS	
SPKIR	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	47	-124.162		
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	2800	GI03FLMA-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
ADCPS	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	4800	GS03FLMB-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	-54.0814	-88.894	WorkHorse LongRanger Sentinel 75khz	
DOFST	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["DOCONCF_L2"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-09-DOFSTA302	TRUE	DOFST	DOFSTA	DOFST	A	01	46.06701	-129.60316	SBE 43	
NUTNR		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-04-NUTNRN999	FALSE	NUTNR	NUTNRN	NUTNR	N	01			SUNA	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	4800	GS03FLMB-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
VELPT	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["VELPTMN_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI002-02-VELPTA999	FALSE	VELPT	VELPTA	VELPT	A	01	44.65	-124.1	Aquadopp 300m	
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL002-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
FLORT		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-01-FLORTN999	FALSE	FLORT	FLORTN	FLORT	N	01				
DOFST	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["DOCONCF_L2"]	2013-11-22 00:00:00	150	15	360	CP02PMCO-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	39.975	-70.79166667	SBE 43F	
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL004-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
DOFST	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["DOCONCF_L2"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-08-DOFSTA107	TRUE	DOFST	DOFSTA	DOFST	A	01	44.65	-124.9	SBE 43	
PHSEN	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF004-02-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	47	-124.27	SAMI-pH	
WAVSS	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2013-11-22 00:00:00	0	0	210	CP01CNSM-SB001-04-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	40.03333333	-70.79166667	TRIAXYS	
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL006-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-03-DOSTA0999	FALSE	DOSTA	DOSTA0	DOSTA	0	01	50.1969	-144.7131		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	750m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	5200	GA01SUMO-RI003-12-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-42.9906	-42.5104	SBE 37IM	
FLORT	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMB-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	-54.0814	-88.894	ECO Triplet-w	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	4800	GS03FLMB-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-88.894	SBE 37IM	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL002-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF004-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	-54.4068	-89.2796	FLBBRTD	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMA-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-06-DOSTAD303	TRUE	DOSTA	DOSTAD	DOSTA	D	01	46.06701	-129.60316	Optode 4831	
CTDBP	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI003-04-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	40.16666667	-70.79166667	SBE 16plusV2	
SPKIR	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI002-03-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	40.16666667	-70.79166667	OCR507 ICSW	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	5200	GA03FLMB-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
PPSDN	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["DNASAMP_L2"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-10-PPSDNA301	TRUE	PPSDN	PPSDNA	PPSDN	A	01	45.93567	-130.01394	non-commercial PPSDN	
OPTAA	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF004-03-OPTAAD999	FALSE	OPTAA	OPTAAD	OPTAA	D	01	44.65	-124.1	AC-S	
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL001-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
PHSEN	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI002-03-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	46.91	-124.95	SAMI-pH	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	5200	GA03FLMB-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.1303	SBE 37IM	
FLORT	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-09-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	40.03333333	-70.79166667		
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL005-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CAMDS	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-12-CAMDSB107	TRUE	CAMDS	CAMDSB	CAMDS	B	01	44.64	-124.3	Kongsberg (Make/Model TBD)	Maybe
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	4800	GS03FLMB-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	4800	GS03FLMA-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	-54.0814	-89.6652	Optode 4831	
VEL3D	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	44.65	-124.1		
PHSEN	2015-01	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	100	100	5200	GA01SUMO-RI003-02-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	-42.9906	-42.5104	SAMI-pH	No
CTDBP	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-06-CTDBPN106	TRUE	CTDBP	CTDBPN	CTDBP	N	01	44.64	-124.3	SBE 16plusV2	
FLORT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	450	15	520	CP04OSPM-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	39.91666667	-70.79166667	ECO Triplet	
PCO2W	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF004-04-PCO2WB999	FALSE	PCO2W	PCO2WB	PCO2W	B	01	44.65	-124.1	SAMI-pCO2	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	30	30	4250	GP03FLMB-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI002-02-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	46.91	-124.95	Aquadopp 300m	
VEL3D	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-09-VEL3DB104	TRUE	VEL3D	VEL3DB	VEL3D	B	01	44.568	-125.15	MAVS-4	
OBSSP	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["SGRDVEL_L1"]	2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-06-OBSSPA102	TRUE	OBSSP	OBSSPA	OBSSP	A	01	44.568	-125.15	Guralp (Make/Model TBD)	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	20	20	5200	GA01SUMO-RI003-03-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
CTDBP	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-06-CTDBPO108	TRUE	CTDBP	CTDBPO	CTDBP	O	01	44.65	-124.9	SBE 16plusV2	
ADCPT	2013-09	Shore CyberPoP - Coastal Mooring Server	Bottom mount, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	125	125	140	CP02PMCI-RI001-01-ADCPTG999	FALSE	ADCPT	ADCPTG	ADCPT	G	01	40.1	-70.79166667	WorkHorse Monitor 150khz	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	2800	GI03FLMA-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
SPKIR	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	50.1969	-144.7131		
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL006-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	2800	GI03FLMB-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.0755	SBE 37IM	
ADCPS	2014	Shore CyberPoP - Regional Observatory Management System	Bottom mount, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	811	811	811	RS01SUM2-MJ01B-05-ADCPSK101	TRUE	ADCPS	ADCPSK	ADCPS	K	01	44.57	-125.147	WorkHorse LongRanger Monitor 75khz	
VEL3D	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF004-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	50.1969	-144.7131		
VEL3D	2013-10	Shore CyberPoP - Coastal Mooring Server	Near bottom to 15m below surface	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	500	15	500	CE09OSPM-WF001-01-VEL3DK999	FALSE	VEL3D	VEL3DK	VEL3D	K	01	46.91	-124.95	Aquadopp	
ZPLSC	2014	Shore CyberPoP - Regional Observatory Management System	Mounted 2m above bottom, uplooking	FALSE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-MJ01C-07-ZPLSCB101	TRUE	ZPLSC	ZPLSCB	ZPLSC	B	01	44.64	-124.3		Maybe
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	2800	GI01SUMO-RI003-11-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL006-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
ADCPS	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Bottom mount, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	500	CE09OSSM-MF004-04-ADCPSJ999	TRUE	ADCPS	ADCPSJ	ADCPS	J	01	46.91	-124.95	WorkHorse LongRanger Sentinel 75khz	
ADCPS	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	4800	GS03FLMA-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	-54.0814	-89.6652	WorkHorse LongRanger Sentinel 75khz	
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00			2597	RS03AXVM-SF03A-10-FLORTD301	TRUE	FLORT	FLORTD	FLORT	D	01	46.06701	-129.60316	ECO Triplet-w	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	4800	GS03FLMA-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
OBSBB	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["GRNDACC_L1", "GRNDVEL_L1"]	2013-07-16 00:00:00	2654	2654	2654	RS03AXBS-MJ03A-05-OBSBBA301	TRUE	OBSBB	OBSBBA	OBSBB	A	01	46.10815	-129.61816	CMG-1T/5T	
PARAD	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-06-PARADA101	TRUE	PARAD	PARADA	PARAD	A	01	44.55404	-125.35235	digital PAR	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMB-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	1500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	2800	GI01SUMO-RI003-14-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	60.6136	-38.2581	SBE 37IM	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL002-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
VEL3D	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	2400	240	2800	GI02HYPM-WF002-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	60.5732	-38.2581		
MASSP	2014	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["MASSPEC_L0", "MASSPEC_L1"]	2020-01-01 00:00:00			811	RS01SUM2-MJ01B-07-MASSPA101	TRUE	MASSP	MASSPA	MASSP	A	01	44.57	-125.147	non-commercial MASSP	Maybe.
CTDPF	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	125	15	140	CP02PMCI-WF001-03-CTDPFK999	FALSE	CTDPF	CTDPFK	CTDPF	K	01	40.1	-70.79166667	SBE 52MP	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL001-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDPF	2013-10	Shore CyberPoP - Coastal Mooring Server	Near bottom to 15m below surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	15	500	CE09OSPM-WF001-03-CTDPFK999	FALSE	CTDPF	CTDPFK	CTDPF	K	01	46.91	-124.95	SBE 52MP	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 150	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	2650	150	2597	RS03AXVM-DP03A-05-OPTAAC302	TRUE	OPTAA	OPTAAC	OPTAA	C	01	46.06701	-129.60316	AC-S Deep	
FLORD	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	2400	240	2800	GI02HYPM-WF002-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	60.5732	-38.2581	FLBBRTD	
NUTNR	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI003-03-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	47	-124.27	ISUS	
ADCPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom mount, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	2597	2597	2597	RS03AXVM-LJ03A-10-ADCPTE301	TRUE	ADCPT	ADCPTE	ADCPT	E	01	46.06701	-129.60316	Quartermaster 150kHz	
VELPT	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI002-02-VELPTA999	FALSE	VELPT	VELPTA	VELPT	A	01	47	-124.162	Aquadopp 300m	
FLORT	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMB-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	-42.5073	-42.1303	ECO Triplet-w	
ADCPS	2015-01	Shore CyberPoP - Global Mooring Server	Mounted at 500m, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	5200	GA01SUMO-RI002-03-ADCPSN999	TRUE	ADCPS	ADCPSN	ADCPS	N	01	-42.9906	-42.5104	WorkHorse LongRanger Sentinel 75khz	
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL001-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
SPKIR	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	40.03333333	-70.79166667		
PARAD	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-10-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	40.16666667	-70.79166667		
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL001-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
DOSTA	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI002-04-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	39.91666667	-70.79166667	Optode 4831	
VELPT	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	1m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	1	1	80	CE07SHSM-SB001-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	47	-124.27	Aquadopp 300m	
DOSTA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF004-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	46.91	-124.95	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	5200	GA03FLMB-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL004-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
WAVSS	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	500	CE04OSSM-SB001-06-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	44.65	-124.9	TRIAXYS	
FLORT	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	47	-124.27	ECO Triplet-w	
ZPLSC	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted 2m above bottom, uplooking	TRUE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF005-03-ZPLSCC999	TRUE	ZPLSC	ZPLSCC	ZPLSC	C	01	40.03333333	-70.79166667		Maybe
PARAD	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	450	15	520	CP04OSPM-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	39.91666667	-70.79166667		
FLORT	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-07-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	44.64	-124.3		
HYDBB	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2020-01-01 00:00:00			2906	RS01SBVM-LJ01A-09-HYDBBA102	TRUE	HYDBB	HYDBBA	HYDBB	A	01	44.55404	-125.35235	icListen HF	
SPKIR	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-06-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	47	-124.27		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	750m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	4800	GS01SUMO-RI003-12-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-54.4704	-89.2796	SBE 37IM	
FLORT	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	15	15	4800	GS01SUMO-RI002-04-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	-54.4704	-89.2796	ECO Triplet-w	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	2800	GI03FLMB-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
CTDBP	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	15	15	4800	GS01SUMO-RI002-02-CTDBPF999	TRUE	CTDBP	CTDBPF	CTDBP	F	01	-54.4704	-89.2796	SBE 16plusV2	
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL003-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
ZPLSC	2013-10	Shore CyberPoP - Coastal Mooring Server	Mounted 2m above bottom, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF005-02-ZPLSCC999	FALSE	ZPLSC	ZPLSCC	ZPLSC	C	01	44.65	-124.1		Maybe
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00			2906	RS01SBVM-DP01A-06-DOSTAD104	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.55404	-125.35235	Optode 4831	
PHSEN	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI002-01-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	40.16666667	-70.79166667	SAMI-pH	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	2800	GI03FLMA-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
VEL3D	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	40.03333333	-70.79166667		
FLORT	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMA-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	-42.5073	-42.8905	ECO Triplet-w	
NUTNR	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["NITROPT_L1"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	50.1969	-144.7131		
OPTAA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI003-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	44.64	-124.3	AC-S	
DOSTA	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF004-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	39.91666667	-70.79166667	Optode 4831	
VADCP	2014-08	Shore CyberPoP - Regional Observatory Management System	Mounted at 200, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELTURB_L1"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-05-VADCPA101	TRUE	VADCP	VADCPA	VADCP	A	01	44.55404	-125.35235	Workhorse custom 600 kHz 5 Beam 	
PCO2W	2014-08	Shore CyberPoP - Regional Observatory Management System	200m below sea surface	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	200	200	500	CE04OSHY-PC01B-12-PCO2WA105	TRUE	PCO2W	PCO2WA	PCO2W	A	01	44.65	-124.9	SAMI-pCO2	
PCO2A	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	500	CE09OSSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	46.91	-124.95	pCO2-pro	
OBSSP	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["SGRDVEL_L1"]	2013-07-16 00:00:00	1527	1527	1554	RS03INT2-MJ03D-05-OBSSPA302	TRUE	OBSSP	OBSSPA	OBSSP	A	01	45.93567	-130.01394	Guralp (Make/Model TBD)	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	4800	GS03FLMB-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
DOSTA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI002-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.64	-124.3	Optode 4831	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	350m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	2800	GI01SUMO-RI003-10-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
VELPT	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI002-04-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	40.03333333	-70.79166667	Aquadopp 300m	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL001-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
PCO2W	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-02-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	50.1969	-144.7131		
BOTPT	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["BOTPRES_L1", "BOTSFLU_L2", "BOTTILT_L0", "BOTTILT_L1"]	2013-07-16 00:00:00	1526	1526	1584	RS03CCAL-MJ03F-05-BOTPTA302	TRUE	BOTPT	BOTPTA	BOTPT	A	01	45.97618	-130.02011	non-commercial BOTPT	
HYDBB	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-09-HYDBBA303	TRUE	HYDBB	HYDBBA	HYDBB	A	01	46.06701	-129.60316	icListen HF	
VEL3D	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF002-05-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	-42.9222	-42.5104		
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-09-CTDPFA302	TRUE	CTDPF	CTDPFA	CTDPF	A	01	46.06701	-129.60316	SBE 16plusV2	
PCO2A	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	500	CE04OSSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	44.65	-124.9	pCO2-pro	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL001-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
ADCPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted at 5m, downlooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI003-01-ADCPTC999	TRUE	ADCPT	ADCPTC	ADCPT	C	01	44.65	-124.9	WorkHorse Monitor 300khz	
CAMDS	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF005-03-CAMDSA999	TRUE	CAMDS	CAMDSA	CAMDS	A	01	46.91	-124.95	Kongsberg (Make/Model TBD)	No. Waiver 1303-00956.
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	5200	GA03FLMB-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL004-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-13-OPTAAD301	TRUE	OPTAA	OPTAAD	OPTAA	D	01	46.06701	-129.60316	AC-S	
FLORT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	450	15	520	CP02PMUO-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	39.90833333	-70.68333333	ECO Triplet	
FLORT	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	39.91666667	-70.79166667	ECO Triplet-w	
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL002-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL003-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
OPTAA	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-02-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	40.03333333	-70.79166667		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	5200	GA03FLMA-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	20	20	4800	GS01SUMO-RI003-03-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL002-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
PRESF	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["SFLPRES_L1"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF005-02-PRESFC999	TRUE	PRESF	PRESFC	PRESF	C	01	46.91	-124.95	SBE 26plus	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	350m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	4800	GS01SUMO-RI003-10-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
DOSTA		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-02-DOSTAN999	FALSE	DOSTA	DOSTAN	DOSTA	N	01			Optode 4330	
FLORT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	125	15	140	CP02PMCI-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	40.1	-70.79166667	ECO Triplet	
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	1m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	1	1	500	CE04OSSM-SB001-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	44.65	-124.9	Aquadopp 300m	
OPTAA	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI002-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	39.91666667	-70.79166667	AC-S	
VEL3D	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-06-VEL3DB304	TRUE	VEL3D	VEL3DB	VEL3D	B	01	45.93567	-130.01394	MAVS-4	
FDCHP	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["FLUXHOT_L2", "FLUXMOM_L2", "FLUXWET_L2", "MOISTUR_L0", "MOISTUR_L1", "MOTFLUX_L0", "RELHUMI_L0", "RELHUMI_L1", "TMPATUR_L0", "TMPATUR_L1", "WINDTUR_L0", "WINDTUR_L1"]	2020-01-01 00:00:00	-3	-3	80	CE02SHSM-SB001-04-FDCHPA999	TRUE	FDCHP	FDCHPA	FDCHP	A	01	44.64	-124.3	non-commercial FDCHP	No
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	60	60	4250	GP03FLMA-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	180m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	4800	GS01SUMO-RI003-08-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
VEL3D	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 200	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	2906	200	2906	RS01SBVM-DP01A-02-VEL3DA103	TRUE	VEL3D	VEL3DA	VEL3D	A	01	44.55404	-125.35235		
CTDGV	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL001-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
WAVSS	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	80	CE02SHSM-SB001-06-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	44.64	-124.3	TRIAXYS	
ZPLSC	2014-05	Shore CyberPoP - Coastal Mooring Server	Mounted 2m above bottom, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF005-02-ZPLSCC999	FALSE	ZPLSC	ZPLSCC	ZPLSC	C	01	47	-124.162		Maybe
OPTAA	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-04-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	47	-124.27		
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL001-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CAMDS	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CAMSTIL_L1"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-08-CAMDSB303	TRUE	CAMDS	CAMDSB	CAMDS	B	01	45.93567	-130.01394	Kongsberg (Make/Model TBD)	Maybe
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-03-DOSTA0999	FALSE	DOSTA	DOSTA0	DOSTA	0	01	-42.9222	-42.5104		
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	2800	GI03FLMB-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.0755	SBE 37IM	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL002-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
PREST	2014	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SFLPRES_L1"]	2020-01-01 00:00:00			807	RS01SUM1-LJ01B-10-PRESTB102	TRUE	PREST	PRESTB	PREST	B	01	44.568	-125.15	SBE 54	
HYDBB	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-11-HYDBBA105	TRUE	HYDBB	HYDBBA	HYDBB	A	01	44.65	-124.9	icListen HF	
VELPT	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI003-03-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	39.91666667	-70.79166667	Aquadopp 300m	
FLORT	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	40.03333333	-70.79166667	ECO Triplet-w	
BOTPT	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["BOTPRES_L1", "BOTSFLU_L2", "BOTTILT_L0", "BOTTILT_L1"]	2013-07-16 00:00:00			1518	RS03ECAL-MJ03E-06-BOTPTA303	TRUE	BOTPT	BOTPTA	BOTPT	A	01	45.94801	-129.98053	non-commercial BOTPT	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF004-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	-42.9222	-42.5104	SBE 52MP	
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL001-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMA-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL005-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	2800	GI03FLMA-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.4407	SBE 37IM	
METBK	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	80	CE07SHSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	47	-124.27	ASIMET	
DOSTA		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-02-DOSTAN999	FALSE	DOSTA	DOSTAN	DOSTA	N	01			Optode 4330	
VEL3D	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-02-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	44.64	-124.3		
CTDGV	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL001-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
DOFST	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-06-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	40.03333333	-70.79166667		
PCO2A	2014-06	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	2800	GI01SUMO-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	60.6136	-38.2581	pCO2-pro	
PHSEN	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI002-01-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	39.91666667	-70.79166667	SAMI-pH	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-09-OPTAAD105	TRUE	OPTAA	OPTAAD	OPTAA	D	01	44.65	-124.9	AC-S	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	250m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	4800	GS01SUMO-RI003-09-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
OBSSP	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SGRDVEL_L1"]	2013-07-16 00:00:00			1518	RS03ECAL-MJ03E-08-OBSSPA301	TRUE	OBSSP	OBSSPA	OBSSP	A	01	45.94801	-129.98053	Guralp (Make/Model TBD)	
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL002-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF002-01-FLORDL999	FALSE	FLORD	FLORDL	FLORD	L	01	50.1969	-144.7131	FLBBRTD	
CTDAV		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-03-CTDAVN999	FALSE	CTDAV	CTDAVN	CTDAV	N	01				
VEL3D	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00			2597	RS03AXVM-DP03A-02-VEL3DA303	TRUE	VEL3D	VEL3DA	VEL3D	A	01	46.06701	-129.60316		
SPKIR	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI003-04-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	40.03333333	-70.79166667	OCR507 ICSW	
METBK	2014-06	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	2800	GI01SUMO-SB001-02-METBKA999	TRUE	METBK	METBKA	METBK	A	01	60.6136	-38.2581	ASIMET	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	2800	GI03FLMB-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
OBSBK	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE		2013-07-16 00:00:00	1516	1516	1518	RS03ECAL-MJ03E-05-OBSBKA301	TRUE	OBSBK	OBSBKA	OBSBK	A	01	45.94801	-129.98053	CMG-1T/5T	
SPKIR	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI003-04-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	47	-124.27	OCR507 ICSW	
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	2906	2906	2906	RS01SBVM-LJ01A-06-DOSTAD101	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.55404	-125.35235	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	1500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	5200	GA01SUMO-RI003-14-CTDMOR999	TRUE	CTDMO	CTDMOR	CTDMO	R	01	-42.9906	-42.5104	SBE 37IM	
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	2906	2906	2906	RS01SBVM-LJ01A-07-OPTAAC103	TRUE	OPTAA	OPTAAC	OPTAA	C	01	44.55404	-125.35235	AC-S Deep	
CAMDS	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CAMSTIL_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-12-CAMDSB106	TRUE	CAMDS	CAMDSB	CAMDS	B	01	44.65	-124.9	Kongsberg (Make/Model TBD)	Maybe
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00			2597	RS03AXVM-DP03A-06-DOSTAD304	TRUE	DOSTA	DOSTAD	DOSTA	D	01	46.06701	-129.60316	Optode 4831	
PCO2W	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-05-PCO2WA301	TRUE	PCO2W	PCO2WA	PCO2W	A	01	46.06701	-129.60316	SAMI-pCO2	
ZPLSC	2014-09	Shore CyberPoP - Coastal Mooring Server	Mounted 2m above bottom, uplooking	TRUE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF005-05-ZPLSCC999	TRUE	ZPLSC	ZPLSCC	ZPLSC	C	01	40.16666667	-70.79166667		Maybe
CTDPF	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-08-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	40.16666667	-70.79166667		
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL002-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	5200	GA03FLMA-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
FLORT	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	4800	GS03FLMA-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	-54.0814	-89.6652	ECO Triplet-w	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	2400	240	2800	GI02HYPM-WF002-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	60.5732	-38.2581	Optode 4330	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	180m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	2800	GI01SUMO-RI003-08-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
ZPLSC	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted 2m above bottom, uplooking	TRUE	FALSE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF005-03-ZPLSCC999	TRUE	ZPLSC	ZPLSCC	ZPLSC	C	01	47	-124.27		Maybe
NUTNR		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-04-NUTNRN999	FALSE	NUTNR	NUTNRN	NUTNR	N	01			SUNA	
NUTNR	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-05-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	44.64	-124.3		
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL004-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	4250	GP03FLMB-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.125	-144.2097	SBE 37IM	
FLORT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	91.5	15	130	CP02PMUI-WF001-04-FLORTK999	FALSE	FLORT	FLORTK	FLORT	K	01	40.11666667	-70.68333333	ECO Triplet	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 150	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2650	150	2597	RS03AXVM-DP03A-01-CTDPFL304	TRUE	CTDPF	CTDPFL	CTDPF	L	01	46.06701	-129.60316	SBE 52MP	
VELPT	2013-10	Shore CyberPoP - Coastal Mooring Server	1m below sea surface	TRUE	TRUE	["VELPTMN_L1"]	2013-10-25 00:00:00	1	1	25	CE01ISSM-SB001-01-VELPTA999	FALSE	VELPT	VELPTA	VELPT	A	01	44.65	-124.1	Aquadopp 300m	
FLORD	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-10-FLORDD303	TRUE	FLORD	FLORDD	FLORD	D	01	46.06701	-129.60316	ECO Triplet-w	
OBSBB	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["GRNDACC_L1", "GRNDVEL_L1"]	2013-07-16 00:00:00			1584	RS03CCAL-MJ03F-06-OBSBBA302	TRUE	OBSBB	OBSBBA	OBSBB	A	01	45.97618	-130.02011	CMG-1T/5T	
VEL3D	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF005-03-VEL3DD999	FALSE	VEL3D	VEL3DD	VEL3D	D	01	44.65	-124.1	VECTOR	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-04-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	-42.9222	-42.5104		
PHSEN	2014-06	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	20	20	2800	GI01SUMO-RI003-01-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	60.6136	-38.2581	SAMI-pH	No
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMA-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
CTDPF	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF004-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	50.1969	-144.7131	SBE 52MP	
DOSTA	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 175m below surface	FALSE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	577	175	500	CE04OSHY-DP01B-06-DOSTAD105	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.9	Optode 4831	
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL002-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	4800	GS03FLMB-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
DOFST	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-02-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	47	-124.162		
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	40m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	40	40	2800	GI01SUMO-RI003-04-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL005-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
OPTAA	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-04-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	44.65	-124.1		
PHSEN	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI003-03-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	40.03333333	-70.79166667	SAMI-pH	
SPKIR	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	520	CP04OSSM-RI002-03-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	39.91666667	-70.79166667	OCR507 ICSW	
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL004-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
ADCPT	2014	Shore CyberPoP - Regional Observatory Management System	Mounted 2m above bottom, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-05-ADCPTB104	TRUE	ADCPT	ADCPTB	ADCPT	B	01	44.64	-124.3	WorkHorse Monitor 300khz	
PCO2W	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-04-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	40.16666667	-70.79166667		
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL006-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	2800	GI03FLMB-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	60.4582	-38.0755	Optode 4831	
PRESF	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["SFLPRES_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF005-04-PRESFA999	FALSE	PRESF	PRESFA	PRESF	A	01	47	-124.162	SBE 26plus	
CTDBP	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI002-05-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	44.65	-124.9	SBE 16plusV2	
ADCPA		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-05-ADCPAN999	FALSE	ADCPA	ADCPAN	ADCPA	N	01				
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL003-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	130m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	2800	GI01SUMO-RI003-07-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	130m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	5200	GA01SUMO-RI003-07-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
PHSEN	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMA-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	60.4582	-38.4407	SAMI-pH	
ADCPS	2015-01	Shore CyberPoP - Global Mooring Server	Mounted at 500m, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	4800	GS01SUMO-RI002-03-ADCPSN999	TRUE	ADCPS	ADCPSN	ADCPS	N	01	-54.4704	-89.2796	WorkHorse LongRanger Sentinel 75khz	
NUTNR	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2013-11-22 00:00:00	5	5	210	CP01CNSM-RI003-01-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	40.03333333	-70.79166667	ISUS	
FLORT	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-07-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	47	-124.27		
METBK	2015-01	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	4800	GS01SUMO-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	-54.4704	-89.2796	ASIMET	
PHSEN	2015-01	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	20	20	4800	GS01SUMO-RI003-01-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	-54.4704	-89.2796	SAMI-pH	No
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	5200	GA03FLMA-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
OBSSP	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SGRDVEL_L1"]	2013-07-16 00:00:00			1552	RS03ASHS-MJ03B-08-OBSSPA303	TRUE	OBSSP	OBSSPA	OBSSP	A	01	45.93619	-130.01417	Guralp (Make/Model TBD)	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL001-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL003-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CAMDS	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["CAMSTIL_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF005-05-CAMDSA999	FALSE	CAMDS	CAMDSA	CAMDS	A	01	47	-124.162	Kongsberg (Make/Model TBD)	No. Waiver 1303-00956.
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	350m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	2800	GI03FLMA-RI001-13-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL002-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
OPTAA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI003-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	46.91	-124.95	AC-S	
ADCPA		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-05-ADCPAN999	FALSE	ADCPA	ADCPAN	ADCPA	N	01				
FLORT	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	40	40	2800	GI03FLMB-RI001-01-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	60.4582	-38.0755	ECO Triplet-w	
FLORT	2014-06	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	15	15	2800	GI01SUMO-RI002-04-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	60.6136	-38.2581	ECO Triplet-w	
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL003-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PARAD	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	150	15	360	CP02PMCO-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	39.975	-70.79166667		
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	1m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	1	1	500	CE09OSSM-SB001-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	46.91	-124.95	Aquadopp 300m	
FLORD	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-01-FLORD0999	FALSE	FLORD	FLORD0	FLORD	0	01	50.1969	-144.7131		
NUTNR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI003-03-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	44.65	-124.9	ISUS	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	2800	GI03FLMB-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.0755	SBE 37IM	
PHSEN	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-07-PHSENA302	TRUE	PHSEN	PHSENA	PHSEN	A	01	46.06701	-129.60316	SAMI-pH	
THSPH	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["THSPHHC_L0", "THSPHHC_L2", "THSPHHS_L0", "THSPHHS_L2", "THSPHPH_L0", "THSPHPH_L2", "THSPHTE_L0", "THSPHTE_L1"]	2013-07-16 00:00:00	1520	1520	1551	RS03INT1-MJ03C-03-THSPHA301	TRUE	THSPH	THSPHA	THSPH	A	01	45.9357	-130.01533	non-commercial THSPH	No. (Waiver Pending)
OPTAA	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-13-OPTAAD101	TRUE	OPTAA	OPTAAD	OPTAA	D	01	44.55404	-125.35235	AC-S	
WAVSS	2015-01	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	0	0	5200	GA01SUMO-SB001-05-WAVSSA999	TRUE	WAVSS	WAVSSA	WAVSS	A	01	-42.9906	-42.5104	TRIAXYS	
PARAD		Shore CyberPoP - AUV Server 	Sea surface to <= 600m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV001-06-PARADN999	FALSE	PARAD	PARADN	PARAD	N	01			QSP-2150	
FLORT		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-01-FLORTN999	FALSE	FLORT	FLORTN	FLORT	N	01				
OPTAA	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI002-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	40.16666667	-70.79166667	AC-S	
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL001-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
PHSEN	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00			500	CE09OSSM-MF004-05-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	46.91	-124.95	SAMI-pH	
PARAD		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-06-PARADN999	FALSE	PARAD	PARADN	PARAD	N	01			QSP-2150	
SPKIR	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-07-SPKIRA102	TRUE	SPKIR	SPKIRA	SPKIR	A	01	44.65	-124.9	OCR507 ICSW	
FLORT		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-01-FLORTN999	FALSE	FLORT	FLORTN	FLORT	N	01				
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	2800	GI03FLMA-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.4407	SBE 37IM	
CTDBP	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF004-05-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	47	-124.27	SBE 16plusV2	
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL003-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
ADCPS	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	Bottom mount, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	450	450	520	CP04OSSM-MF005-03-ADCPSJ999	TRUE	ADCPS	ADCPSJ	ADCPS	J	01	39.91666667	-70.79166667	WorkHorse LongRanger Sentinel 75khz	
PCO2W	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF004-04-PCO2WB999	TRUE	PCO2W	PCO2WB	PCO2W	B	01	47	-124.27	SAMI-pCO2	
FLORD	2014-08	Shore CyberPoP - Regional Observatory Management System	200 below sea surface	FALSE	FALSE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-10-FLORDD103	TRUE	FLORD	FLORDD	FLORD	D	01	44.55404	-125.35235	ECO Triplet-w	
ADCPA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL003-03-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00			500	CE04OSHY-PC01B-4A-CTDPFA109	TRUE	CTDPF	CTDPFA	CTDPF	A	01	44.65	-124.9	SBE 16plusV2	
ZPLSG	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 150m, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	150	150	5200	GA02HYPM-MP003-01-ZPLSGA999	FALSE	ZPLSG	ZPLSGA	ZPLSG	A	01	-42.9222	-42.5104		Maybe
VELPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-08-VELPTD302	TRUE	VELPT	VELPTD	VELPT	D	01	46.06701	-129.60316	Aquadopp	
NUTNR	2014-08	Shore CyberPoP - Regional Observatory Management System	20m to 200m below sea surface	FALSE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	200	20	500	CE04OSHY-SF01B-04-NUTNRA102	TRUE	NUTNR	NUTNRA	NUTNR	A	01	44.65	-124.9	Deep SUNA	
CTDBP	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF004-04-CTDBPE999	TRUE	CTDBP	CTDBPE	CTDBP	E	01	39.91666667	-70.79166667	SBE 16plusV2	
VEL3D	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-11-22 00:00:00	91.5	15	130	CP02PMUI-WF001-01-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	40.11666667	-70.68333333		
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL006-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
HYDLF	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["HYDAPLF_L0", "HYDAPLF_L1"]	2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-05-HYDLFA104	TRUE	HYDLF	HYDLFA	HYDLF	A	01	44.568	-125.15	90-U	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	130	130	4250	GP03FLMB-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF002-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	-54.4068	-89.2796	Optode 4330	
VEL3D	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 175m below surface	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	577	175	500	CE04OSHY-DP01B-02-VEL3DA105	TRUE	VEL3D	VEL3DA	VEL3D	A	01	44.65	-124.9		
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-09-CTDPFA102	TRUE	CTDPF	CTDPFA	CTDPF	A	01	44.55404	-125.35235	SBE 16plusV2	
VEL3D	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-11-22 00:00:00	150	15	360	CP02PMCO-WF001-01-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	39.975	-70.79166667		
CTDGV	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GI05MOAS-GL003-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
VEL3D	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-02-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	47	-124.27		
PHSEN	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-12-PHSENA101	TRUE	PHSEN	PHSENA	PHSEN	A	01	44.55404	-125.35235	SAMI-pH	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	4800	GS03FLMB-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL003-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
CTDBP	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF005-01-CTDBPC999	FALSE	CTDBP	CTDBPC	CTDBP	C	01	47	-124.162	SBE 16plusV2	
ADCPA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL006-01-ADCPAM999	FALSE	ADCPA	ADCPAM	ADCPA	M	01			Explorer DVL 600 kHz	
DOSTA	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	40	40	2800	GI03FLMA-RI001-03-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	60.4582	-38.4407	Optode 4831	
PHSEN	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI002-03-PHSEND999	FALSE	PHSEN	PHSEND	PHSEN	D	01	44.65	-124.1	SAMI-pH	
SPKIR	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	60.5732	-38.2581		
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	500	500	4250	GP03FLMB-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
CTDPF	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-09-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	44.65	-124.1		
PHSEN	2014-08	Shore CyberPoP - Regional Observatory Management System	200m below sea surface	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	200	200	500	CE04OSHY-PC01B-05-PHSENA106	TRUE	PHSEN	PHSENA	PHSEN	A	01	44.65	-124.9	SAMI-pH	
CTDBP	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI002-05-CTDBPC999	TRUE	CTDBP	CTDBPC	CTDBP	C	01	46.91	-124.95	SBE 16plusV2	
ADCPT	2013-10	Shore CyberPoP - Coastal Mooring Server	Bottom mount, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2013-10-25 00:00:00	25	25	25	CE01ISSM-MF004-05-ADCPTM999	FALSE	ADCPT	ADCPTM	ADCPT	M	01	44.65	-124.1	WorkHorse Sentinel 600khz	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	1000	0		GA05MOAS-GL003-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
DOSTA	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI002-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	44.65	-124.9	Optode 4831	
PHSEN	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF004-05-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	40.03333333	-70.79166667	SAMI-pH	
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL005-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	250	250	4800	GS03FLMA-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
VEL3D	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF005-04-VEL3DD999	TRUE	VEL3D	VEL3DD	VEL3D	D	01	46.91	-124.95	VECTOR	
SPKIR	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI003-05-SPKIRB999	FALSE	SPKIR	SPKIRB	SPKIR	B	01	44.65	-124.1	OCR507 ICSW	
PARAD	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	450	15	520	CP02PMUO-WF001-05-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	39.90833333	-70.68333333		
CTDBP	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF004-04-CTDBPD999	TRUE	CTDBP	CTDBPD	CTDBP	D	01	40.16666667	-70.79166667	SBE 16plusV2	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	250m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	250	250	4250	GP03FLMA-RI001-12-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
OPTAA	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI003-03-OPTAAD999	FALSE	OPTAA	OPTAAD	OPTAA	D	01	44.65	-124.1	AC-S	
HYDBB	2014	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2020-01-01 00:00:00	78	78	80	CE02SHBP-LJ01D-11-HYDBBA106	TRUE	HYDBB	HYDBBA	HYDBB	A	01	44.64	-124.3	icListen HF	
OSMOI	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["PHSSAMP_L2"]	2020-01-01 00:00:00	811	811	811	RS01SUM2-MJ01B-00-OSMOIA101	TRUE	OSMOI	OSMOIA	OSMOI	A	01	44.57	-125.147	OsmoSampler	
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL004-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PARAD	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-06-PARADA301	TRUE	PARAD	PARADA	PARAD	A	01	46.06701	-129.60316	digital PAR	
PRESF	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["SFLPRES_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF005-02-PRESFB999	TRUE	PRESF	PRESFB	PRESF	B	01	40.16666667	-70.79166667	SBE 26plus	
SPKIR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI003-04-SPKIRB999	TRUE	SPKIR	SPKIRB	SPKIR	B	01	46.91	-124.95	OCR507 ICSW	
METBK	2015-01	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	4800	GS01SUMO-SB001-02-METBKA999	TRUE	METBK	METBKA	METBK	A	01	-54.4704	-89.2796	ASIMET	
PHSEN	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	200	0	2597	RS03AXVM-SF03A-12-PHSENA301	TRUE	PHSEN	PHSENA	PHSEN	A	01	46.06701	-129.60316	SAMI-pH	
VEL3D	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-11-22 00:00:00	125	15	140	CP02PMCI-WF001-01-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	40.1	-70.79166667		
OBSSP	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["SGRDVEL_L1"]	2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-08-OBSSPA103	TRUE	OBSSP	OBSSPA	OBSSP	A	01	44.568	-125.15	Guralp (Make/Model TBD)	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	2800	GI03FLMA-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
PARAD	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-10-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	40.03333333	-70.79166667		
CTDBP	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI003-01-CTDBPC999	FALSE	CTDBP	CTDBPC	CTDBP	C	01	47	-124.162	SBE 16plusV2	
PCO2W	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-09-PCO2WB104	TRUE	PCO2W	PCO2WB	PCO2W	B	01	44.65	-124.9	SAMI-pCO2	
NUTNR	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	150	0	2800	GI02HYPM-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	60.5732	-38.2581		
NUTNR	2014-09	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	130	CP03ISSM-RI003-01-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	40.16666667	-70.79166667	ISUS	
METBK	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	520	CP04OSSM-SB001-02-METBKA999	TRUE	METBK	METBKA	METBK	A	01	39.91666667	-70.79166667	ASIMET	
OPTAA	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF005-04-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	40.16666667	-70.79166667	AC-S	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2650	2650	2597	RS03AXVM-LJ03A-06-CTDPFB301	TRUE	CTDPF	CTDPFB	CTDPF	B	01	46.06701	-129.60316	SBE 16plusV2	
FLOBN	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["BENTHFL_L2"]	2020-01-01 00:00:00	811	811	811	RS01SUM2-MJ01B-00-FLOBNA101	TRUE	FLOBN	FLOBNA	FLOBN	A	01	44.57	-125.147	non-commercial FLOBN	
CTDPF	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2400	240	2800	GI02HYPM-WF002-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	60.5732	-38.2581	SBE 52MP	
CAMDS	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CAMSTIL_L1"]	2020-01-01 00:00:00			2597	RS03AXVM-PC03A-12-CAMDSC302	TRUE	CAMDS	CAMDSC	CAMDS	C	01	46.06701	-129.60316	Kongsberg (Make/Model TBD)	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF004-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	-54.4068	-89.2796	SBE 52MP	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	4250	GP03FLMA-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.4676	-144.5174	SBE 37IM	
ADCPT	2014-05	Shore CyberPoP - Coastal Mooring Server	Bottom mount, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	25	25	25	CE06ISSM-MF004-05-ADCPTM999	FALSE	ADCPT	ADCPTM	ADCPT	M	01	47	-124.162	WorkHorse Sentinel 600khz	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	60	60	5200	GA03FLMB-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	60m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	60	60	4250	GP03FLMB-RI001-08-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.125	-144.2097	SBE 37IM	
ADCPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Mounted at 200, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	200	200	2906	RS01SBVM-PC01A-13-ADCPTD102	TRUE	ADCPT	ADCPTD	ADCPT	D	01	44.55404	-125.35235	Quartermaster 150kHz	
OPTAA	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-04-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	47	-124.162		
DOSTA	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF004-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	47	-124.27	Optode 4831	
CTDBP	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF005-01-CTDBPE999	TRUE	CTDBP	CTDBPE	CTDBP	E	01	46.91	-124.95	SBE 16plusV2	
DOFST	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["DOCONCF_L2"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-01-DOFST0999	FALSE	DOFST	DOFST0	DOFST	0	01	44.64	-124.3		
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL002-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL002-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
PHSEN	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF004-02-PHSEND999	FALSE	PHSEN	PHSEND	PHSEN	D	01	44.65	-124.1	SAMI-pH	
CTDPF	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-04-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	50.1969	-144.7131		
VELPT	2014-09	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	89.5	89.5	130	CP03ISSM-MF004-03-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	40.16666667	-70.79166667	Aquadopp 300m	
DOFST	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["DOCONCF_L2"]	2013-11-22 00:00:00	91.5	15	130	CP02PMUI-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	40.11666667	-70.68333333	SBE 43F	
NUTNR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI003-03-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	44.64	-124.3	ISUS	
DOSTA	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI002-01-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	47	-124.162	Optode 4831	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	5200	GA03FLMB-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.1303	SBE 37IM	
NUTNR	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI003-03-NUTNRB999	TRUE	NUTNR	NUTNRB	NUTNR	B	01	46.91	-124.95	ISUS	
PREST	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SFLPRES_L1"]	2013-06-28 00:00:00			2906	RS01SLBS-MJ01A-07-PRESTA101	TRUE	PREST	PRESTA	PREST	A	01	44.55404	-125.35235	SBE 54	
CAMDS	2013-10	Shore CyberPoP - Coastal Mooring Server	2m above the bottom	TRUE	TRUE	["CAMSTIL_L1"]	2013-10-25 00:00:00	23	23	25	CE01ISSM-MF005-05-CAMDSA999	FALSE	CAMDS	CAMDSA	CAMDS	A	01	44.65	-124.1	Kongsberg (Make/Model TBD)	No. Waiver 1303-00956.
OPTAA	2013-08	Shore CyberPoP - Regional Observatory Management System	2m above bottom	FALSE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-08-OPTAAC104	TRUE	OPTAA	OPTAAC	OPTAA	C	01	44.65	-124.9	AC-S Deep	
PHSEN	2014-06	Shore CyberPoP - Global Mooring Server	100m below sea surface	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	100	100	2800	GI01SUMO-RI003-02-PHSENE999	TRUE	PHSEN	PHSENE	PHSEN	E	01	60.6136	-38.2581	SAMI-pH	No
FLORT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	500	CE04OSSM-RI003-05-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	44.65	-124.9	ECO Triplet-w	
OPTAA	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF005-04-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	39.91666667	-70.79166667	AC-S	
CTDGV	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL002-04-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
DOSTA	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF004-01-DOSTAD999	FALSE	DOSTA	DOSTAD	DOSTA	D	01	47	-124.162	Optode 4831	
CTDMO	2014-06	Shore CyberPoP - Global Mooring Server	20m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	20	20	2800	GI01SUMO-RI003-03-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	60.6136	-38.2581	SBE 37IM	
OPTAA	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI003-02-OPTAAD999	TRUE	OPTAA	OPTAAD	OPTAA	D	01	47	-124.27	AC-S	
VEL3D	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF005-03-VEL3DD999	FALSE	VEL3D	VEL3DD	VEL3D	D	01	47	-124.162	VECTOR	
PCO2A	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	520	CP04OSSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	39.91666667	-70.79166667	pCO2-pro	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	750m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	750	750	4250	GP03FLMA-RI001-15-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	50.4676	-144.5174	SBE 37IM	
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL005-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
ADCPT	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2013-11-22 00:00:00	91.5	91.5	130	CP02PMUI-RI001-01-ADCPTG999	FALSE	ADCPT	ADCPTG	ADCPT	G	01	40.11666667	-70.68333333	WorkHorse Monitor 150khz	
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 175m below surface	FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	577	175	500	CE04OSHY-DP01B-04-FLORTA103	TRUE	FLORT	FLORTA	FLORT	A	01	44.65	-124.9	FLNTURTD (chlorophyll and backscatter), and FLCDRTD (CDOM)	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	4800	GS03FLMB-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-88.894	SBE 37IM	
ADCPS	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	5200	GA03FLMB-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	-42.5073	-42.1303	WorkHorse LongRanger Sentinel 75khz	
ADCPT	2014-09	Shore CyberPoP - Coastal Mooring Server	Bottom mount, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	91.5	91.5	130	CP03ISSM-MF005-03-ADCPTF999	TRUE	ADCPT	ADCPTF	ADCPT	F	01	40.16666667	-70.79166667	WorkHorse Monitor 150khz	
OPTAA	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-02-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	40.16666667	-70.79166667		
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	2800	GI03FLMB-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	60.4582	-38.0755	SBE 37IM	
DOSTA	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF004-03-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	40.03333333	-70.79166667	Optode 4831	
PCO2A	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	130	CP03ISSM-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	40.16666667	-70.79166667	pCO2-pro	
SPKIR	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-07-SPKIR0999	FALSE	SPKIR	SPKIR0	SPKIR	0	01	-54.4068	-89.2796		
PARAD	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-10-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	44.65	-124.1		
BOTPT	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["BOTPRES_L1", "BOTSFLU_L2", "BOTTILT_L0", "BOTTILT_L1"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-07-BOTPTA301	TRUE	BOTPT	BOTPTA	BOTPT	A	01	45.93567	-130.01394	non-commercial BOTPT	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF002-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	-42.9222	-42.5104	SBE 52MP	
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 150	FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	2650	150	2597	RS03AXVM-DP03A-04-FLORTA302	TRUE	FLORT	FLORTA	FLORT	A	01	46.06701	-129.60316	FLNTURTD (chlorophyll and backscatter), and FLCDRTD (CDOM)	
PHSEN	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMA-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	-42.5073	-42.8905	SAMI-pH	
CTDMO	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	2800	GI03FLMA-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	60.4582	-38.4407	SBE 37IM	
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL001-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	1000	0		GS05MOAS-GL001-01-FLORDM999	FALSE	FLORD	FLORDM	FLORD	M	01			ECO Triplet	
DOSTA	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL004-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
FLORT	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-08-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	47	-124.162		
VEL3D	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2013-07-16 00:00:00	2654	2654	2654	RS03AXBS-MJ03A-06-VEL3DB301	TRUE	VEL3D	VEL3DB	VEL3D	B	01	46.10815	-129.61816	MAVS-4	
PRESF	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["SFLPRES_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF005-01-PRESFB999	TRUE	PRESF	PRESFB	PRESF	B	01	47	-124.27	SBE 26plus	
VELPT	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	15	15	5200	GA01SUMO-RI002-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	-42.9906	-42.5104	Aquadopp 300m	
DOFST	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["DOCONCF_L2"]	2013-11-22 00:00:00	450	15	520	CP04OSPM-WF001-02-DOFSTK999	FALSE	DOFST	DOFSTK	DOFST	K	01	39.91666667	-70.79166667	SBE 43F	
NUTNR	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI003-04-NUTNRB999	FALSE	NUTNR	NUTNRB	NUTNR	B	01	47	-124.162	ISUS	
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	5200	GA01SUMO-RI003-11-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
FLORT	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	15	15	5200	GA01SUMO-RI002-04-FLORTD999	TRUE	FLORT	FLORTD	FLORT	D	01	-42.9906	-42.5104	ECO Triplet-w	
DOSTA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea surface to 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-08-05 00:00:00	1000	0		GP05MOAS-GL001-02-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	130	130	4250	GP03FLMA-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
PHSEN	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMB-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	50.125	-144.2097	SAMI-pH	
ADCPT	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted at 5m, downlooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI003-01-ADCPTA999	TRUE	ADCPT	ADCPTA	ADCPT	A	01	47	-124.27	WorkHorse Monitor 150khz	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	30	30	4250	GP03FLMA-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
PCO2W	2014-05	Shore CyberPoP - Coastal Mooring Server	2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	23	23	25	CE06ISSM-MF004-04-PCO2WB999	FALSE	PCO2W	PCO2WB	PCO2W	B	01	47	-124.162	SAMI-pCO2	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	30m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	30	30	4800	GS03FLMA-RI001-06-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
FLORT	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	91.5	0	130	CP03ISSP-SP001-09-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	40.16666667	-70.79166667		
CTDPF	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-09-CTDPF0999	FALSE	CTDPF	CTDPF0	CTDPF	0	01	47	-124.162		
CAMHD	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["HDVIDEO_L1"]	2013-07-16 00:00:00			1552	RS03ASHS-ID03A-02-CAMHDA301	TRUE	CAMHD	CAMHDA	CAMHD	A	01	45.93619	-130.01417	1Cam	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-01-FLORD0999	FALSE	FLORD	FLORD0	FLORD	0	01	-42.9222	-42.5104		
FLORT	2013-10	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	5	5	25	CE01ISSM-RI003-02-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	44.65	-124.1	ECO Triplet-w	
CTDPF	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 175m below surface	FALSE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	577	175	500	CE04OSHY-DP01B-01-CTDPFL105	TRUE	CTDPF	CTDPFL	CTDPF	L	01	44.65	-124.9	SBE 52MP	
ADCPS	2013-08	Shore CyberPoP - Regional Observatory Management System	Mounted 2m above bottom, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-08-01 00:00:00	498	498	500	CE04OSBP-LJ01C-05-ADCPSI103	TRUE	ADCPS	ADCPSI	ADCPS	I	01	44.65	-124.9	WorkHorse LongRanger Monitor 75khz	
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL001-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PARAD	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-08-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	44.64	-124.3		
PARAD			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL003-05-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1500	1500	5200	GA03FLMA-RI001-17-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.8905	SBE 37IM	
FLORT	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-08-FLORT0999	FALSE	FLORT	FLORT0	FLORT	0	01	44.65	-124.1		
FLORT			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL001-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
OBSSP	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["SGRDVEL_L1"]	2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-07-OBSSPA101	TRUE	OBSSP	OBSSPA	OBSSP	A	01	44.568	-125.15	Guralp (Make/Model TBD)	
CTDPF	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	2400	240	4800	GS02HYPM-WF002-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	-54.4068	-89.2796	SBE 52MP	
ADCPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Mounted at 200, uplooking	FALSE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	200	200	2597	RS03AXVM-PC03A-10-ADCPTD302	TRUE	ADCPT	ADCPTD	ADCPT	D	01	46.06701	-129.60316	Quartermaster 150kHz	
DOSTA			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL004-04-DOSTAM999	FALSE	DOSTA	DOSTAM	DOSTA	M	01			Optode 4831	
FLORT	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL001-02-FLORTM999	FALSE	FLORT	FLORTM	FLORT	M	01			ECO Puck	
VELPT	2014-05	Shore CyberPoP - Coastal Mooring Server	1m below sea surface	TRUE	TRUE	["VELPTMN_L1"]	2020-01-01 00:00:00	1	1	25	CE06ISSM-SB001-01-VELPTA999	FALSE	VELPT	VELPTA	VELPT	A	01	47	-124.162	Aquadopp 300m	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 2400m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	4400	240	5200	GA02HYPM-WF004-03-DOSTAL999	FALSE	DOSTA	DOSTAL	DOSTA	L	01	-42.9222	-42.5104	Optode 4330	
HYDLF	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["HYDAPLF_L0", "HYDAPLF_L1"]	2013-07-16 00:00:00	2654	2654	2654	RS03AXBS-MJ03A-05-HYDLFA301	TRUE	HYDLF	HYDLFA	HYDLF	A	01	46.10815	-129.61816	90-U	
PHSEN	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	40	40	5200	GA03FLMB-RI001-02-PHSENF999	FALSE	PHSEN	PHSENF	PHSEN	F	01	-42.5073	-42.1303	SAMI-pH	
CTDGV	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL003-05-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
PCO2W	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-04-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	40.03333333	-70.79166667		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	350m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	350	350	5200	GA01SUMO-RI003-10-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-42.9906	-42.5104	SBE 37IM	
DOFST	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["DOCONCF_L2"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-09-DOFSTA102	TRUE	DOFST	DOFSTA	DOFST	A	01	44.55404	-125.35235	SBE 43	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	180	180	4250	GP03FLMA-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
VELPT	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	15	15	4800	GS01SUMO-RI002-05-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	-54.4704	-89.2796	Aquadopp 300m	
PARAD	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2020-01-01 00:00:00	23	0	25	CE06ISSP-SP001-10-PARAD0999	FALSE	PARAD	PARAD0	PARAD	0	01	47	-124.162		
ADCPS	2014-06	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 500m, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2020-01-01 00:00:00	500	500	2800	GI03FLMA-RI001-04-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	60.4582	-38.4407	WorkHorse LongRanger Sentinel 75khz	
CTDGV			Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	1000	0		CP05MOAS-GL004-03-CTDGVM999	FALSE	CTDGV	CTDGVM	CTDGV	M	01			GPCTD	
CTDAV		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV003-03-CTDAVN999	FALSE	CTDAV	CTDAVN	CTDAV	N	01				
ADCPT	2013-09	InSitu CyberPoP - Surface Mooring Platform Controller	Bottom mount, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2013-11-22 00:00:00	133	133	210	CP01CNSM-MF004-01-ADCPTF999	TRUE	ADCPT	ADCPTF	ADCPT	F	01	40.03333333	-70.79166667	WorkHorse Monitor 150khz	
METBK	2014-06	Shore CyberPoP - Global Mooring Server	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	2800	GI01SUMO-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	60.6136	-38.2581	ASIMET	
ADCPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted at 5m, downlooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	5	5	500	CE09OSSM-RI003-01-ADCPTC999	TRUE	ADCPT	ADCPTC	ADCPT	C	01	46.91	-124.95	WorkHorse Monitor 300khz	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	5200	GA03FLMA-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-42.5073	-42.8905	SBE 37IM	
FLORD	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-01-FLORD0999	FALSE	FLORD	FLORD0	FLORD	0	01	-54.4068	-89.2796		
VEL3D	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF005-05-VEL3DD999	TRUE	VEL3D	VEL3DD	VEL3D	D	01	47	-124.27	VECTOR	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	4800	GS03FLMA-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-89.6652	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	5200	GA03FLMA-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
CTDBP	2015-01	Shore CyberPoP - Global Mooring Server	15m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	15	15	5200	GA01SUMO-RI002-02-CTDBPF999	TRUE	CTDBP	CTDBPF	CTDBP	F	01	-42.9906	-42.5104	SBE 16plusV2	
PRESF	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["SFLPRES_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF005-02-PRESFC999	TRUE	PRESF	PRESFC	PRESF	C	01	39.91666667	-70.79166667	SBE 26plus	
VEL3D	2013-08	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE	["VELPTTU_L0", "VELPTTU_L1"]	2013-06-28 00:00:00	2909	2909	2906	RS01SLBS-MJ01A-06-VEL3DB101	TRUE	VEL3D	VEL3DB	VEL3D	B	01	44.55404	-125.35235	MAVS-4	
PCO2W	2014-05	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	23	0	25	CE01ISSP-SP001-03-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	44.65	-124.1		
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	1000m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	1000	1000	4800	GS03FLMA-RI001-16-CTDMOH999	FALSE	CTDMO	CTDMOH	CTDMO	H	01	-54.0814	-89.6652	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	180m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	180	180	5200	GA03FLMB-RI001-11-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	500m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	5200	GA03FLMB-RI001-14-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.1303	SBE 37IM	
NUTNR	2014	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	78	0	80	CE07SHSP-SP001-05-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	47	-124.27		
PARAD	2013-10	Shore CyberPoP - Coastal Glider Dock Server	Sea surface to near seafloor or <= 1000m	TRUE	TRUE	["OPTPARW_L0", "OPTPARW_L1"]	2013-10-25 00:00:00	1000	0		CE05MOAS-GL001-01-PARADM999	FALSE	PARAD	PARADM	PARAD	M	01			QSP-2155	
DOSTA		Shore CyberPoP - AUV Server	Sea surface to <= 600m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	600	0		CP05MOAS-AV002-02-DOSTAN999	FALSE	DOSTA	DOSTAN	DOSTA	N	01			Optode 4330	
VELPT	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-08-VELPTD102	TRUE	VELPT	VELPTD	VELPT	D	01	44.55404	-125.35235	Aquadopp	
NUTNR	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["NITROPT_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-11-NUTNRA101	TRUE	NUTNR	NUTNRA	NUTNR	A	01	44.55404	-125.35235	Deep SUNA	
OPTAA	2014-07	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2020-01-01 00:00:00	78	0	80	CE02SHSP-SP001-04-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	44.64	-124.3		
PCO2A	2015-01	Shore CyberPoP - Global Mooring Server	Sea Surface	TRUE	FALSE	["CO2FLUX_L2", "PCO2ATM_L1", "PCO2SSW_L1", "PRESAIR_L0", "XCO2ATM_L0", "XCO2SSW_L0"]	2020-01-01 00:00:00	0	0	4800	GS01SUMO-SB001-03-PCO2AA999	TRUE	PCO2A	PCO2AA	PCO2A	A	01	-54.4704	-89.2796	pCO2-pro	
VEL3D	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["VELPTTU_L0", "VELPTTU_L1"]	2013-11-22 00:00:00	450	15	520	CP02PMUO-WF001-01-VEL3D0999	FALSE	VEL3D	VEL3D0	VEL3D	0	01	39.90833333	-70.68333333		
CTDMO	2015-01	Shore CyberPoP - Global Mooring Server	500m below sea surface	TRUE	FALSE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	500	500	4800	GS01SUMO-RI003-11-CTDMOQ999	TRUE	CTDMO	CTDMOQ	CTDMO	Q	01	-54.4704	-89.2796	SBE 37IM	
OBSSP	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["SGRDVEL_L1"]	2013-07-16 00:00:00			1518	RS03ECAL-MJ03E-07-OBSSPA304	TRUE	OBSSP	OBSSPA	OBSSP	A	01	45.94801	-129.98053	Guralp (Make/Model TBD)	
ZPLSG	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Mounted at 150m, uplooking	TRUE	TRUE	["SONBSCA_L0", "SONBSCA_L1"]	2020-01-01 00:00:00	150	150	4800	GS02HYPM-MP003-01-ZPLSGA999	FALSE	ZPLSG	ZPLSGA	ZPLSG	A	01	-54.4068	-89.2796		Maybe
NUTNR	2014-09	Shore CyberPoP - Coastal Mooring Server	Sea surface to 2m above bottom	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	133	0	210	CP01CNSP-SP001-03-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	40.03333333	-70.79166667		
NUTNR	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["NITROPT_L1"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-06-NUTNR0999	FALSE	NUTNR	NUTNR0	NUTNR	0	01	-42.9222	-42.5104		
CTDPF	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	~240m below sea surface to 3900m	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	3900	240	4250	GP02HYPM-WF002-04-CTDPFL999	FALSE	CTDPF	CTDPFL	CTDPF	L	01	50.1969	-144.7131	SBE 52MP	
CTDPF	2013-09	Shore CyberPoP - Coastal Mooring Server	15m below sea surface to near bottom	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-11-22 00:00:00	150	15	360	CP02PMCO-WF001-03-CTDPFK999	FALSE	CTDPF	CTDPFK	CTDPF	K	01	39.975	-70.79166667	SBE 52MP	
METBK	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	~3m above sea surface	TRUE	FALSE	["BARPRES_L0", "BARPRES_L1", "CONDSRF_L0", "CONDSRF_L1", "FRSHFLX_L2", "HEATFLX_L2", "LATNFLX_L2", "LONGIRR_L0", "LONGIRR_L1", "MOMMFLX_L2", "NETLIRR_L2", "NETSIRR_L2", "PRECIPM_L0", "PRECIPM_L1", "RAINFLX_L2", "RAINRTE_L2", "RELHUMI_L0", "RELHUMI_L1", "SALSURF_L2", "SENSFLX_L2", "SHRTIRR_L0", "SHRTIRR_L1", "SPECHUM_L2", "SPHUM2M_L2", "TEMPA2M_L2", "TEMPAIR_L0", "TEMPAIR_L1", "TEMPSRF_L0", "TEMPSRF_L1", "WIND10M_L2", "WINDAVG_L0", "WINDAVG_L1"]	2020-01-01 00:00:00	-3	-3	500	CE09OSSM-SB001-01-METBKA999	TRUE	METBK	METBKA	METBK	A	01	46.91	-124.95	ASIMET	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	130m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	130	130	5200	GA03FLMA-RI001-10-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-42.5073	-42.8905	SBE 37IM	
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00			2906	RS01SBVM-SF01A-10-FLORTD101	TRUE	FLORT	FLORTD	FLORT	D	01	44.55404	-125.35235	ECO Triplet-w	
OBSBK	2014	Shore CyberPoP - Regional Observatory Management System	Bottom	FALSE	FALSE		2020-01-01 00:00:00	807	807	807	RS01SUM1-LJ01B-05-OBSBKA101	TRUE	OBSBK	OBSBKA	OBSBK	A	01	44.568	-125.15	CMG-1T/5T	
CTDMO	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	90m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2020-01-01 00:00:00	90	90	4800	GS03FLMB-RI001-09-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	-54.0814	-88.894	SBE 37IM	
ADCPT	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	Mounted 2m above bottom, uplooking	TRUE	FALSE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1", "WAVSTAT_L0", "WAVSTAT_L2"]	2020-01-01 00:00:00	78	78	80	CE07SHSM-MF005-04-ADCPTC999	TRUE	ADCPT	ADCPTC	ADCPT	C	01	47	-124.27	WorkHorse Monitor 300khz	
DOSTA	2014-05	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	5	5	80	CE07SHSM-RI002-01-DOSTAD999	TRUE	DOSTA	DOSTAD	DOSTA	D	01	47	-124.27	Optode 4831	
OPTAA	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["OPTABSN_L2", "OPTATTN_L2", "OPTCREF_L0", "OPTCSIG_L0", "OPTTEMP_L0"]	2013-08-05 00:00:00	150	0	4250	GP02HYPM-SP001-05-OPTAA0999	FALSE	OPTAA	OPTAA0	OPTAA	0	01	50.1969	-144.7131		
ADCPS	2013-09	Shore CyberPoP - Coastal Mooring Server	Mounted 20m above bottom, uplooking	TRUE	TRUE	["ECHOINT_L0", "ECHOINT_L1", "VELPROF_L0", "VELPROF_L1"]	2013-11-22 00:00:00	430	430	520	CP02PMUO-RI001-01-ADCPSL999	FALSE	ADCPS	ADCPSL	ADCPS	L	01	39.90833333	-70.68333333	WorkHorse LongRanger Sentinel 75khz	
PHSEN	2014-09	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["ABSTHRM_L0", "PH434SI_L0", "PH578SI_L0", "PHWATER_L1"]	2020-01-01 00:00:00	448	448	520	CP04OSSM-MF004-05-PHSEND999	TRUE	PHSEN	PHSEND	PHSEN	D	01	39.91666667	-70.79166667	SAMI-pH	
RASFL	2013-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["PHSSAMP_L2", "TEMPVNT_L0", "TEMPVNT_L1"]	2013-07-16 00:00:00			1554	RS03INT2-MJ03D-10-RASFLA301	TRUE	RASFL	RASFLA	RASFL	A	01	45.93567	-130.01394	non-commercial RASFL	
CTDMO	2013-08	Shore CyberPoP - Open Ocean Glider Dock Server	40m below sea surface	TRUE	TRUE	["CONDWAT_L0", "CONDWAT_L1", "DENSITY_L2", "PRACSAL_L2", "PRESWAT_L0", "PRESWAT_L1", "TEMPWAT_L0", "TEMPWAT_L1"]	2013-08-05 00:00:00	40	40	4250	GP03FLMA-RI001-07-CTDMOG999	FALSE	CTDMO	CTDMOG	CTDMO	G	01	50.4676	-144.5174	SBE 37IM	
HYDBB	2014-08	Shore CyberPoP - Regional Observatory Management System		FALSE	FALSE	["HYDAPBB_L0", "HYDAPBB_L1", "HYDFRBB_L0", "HYDFRBB_L1"]	2020-01-01 00:00:00			2597	RS03AXVM-LJ03A-09-HYDBBA302	TRUE	HYDBB	HYDBBA	HYDBB	A	01	46.06701	-129.60316	icListen HF	
SPKIR	2014-08	Shore CyberPoP - Regional Observatory Management System	Near sea surface to 200	FALSE	FALSE	["OPTATTS_L2", "SPECTIR_L0", "SPECTIR_L1"]	2020-01-01 00:00:00	200	0	2906	RS01SBVM-SF01A-07-SPKIRA101	TRUE	SPKIR	SPKIRA	SPKIR	A	01	44.55404	-125.35235	OCR507 ICSW	
DOSTA	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["DOCONCS_L0", "DOCONCS_L2"]	2020-01-01 00:00:00	150	0	4800	GS02HYPM-SP001-03-DOSTA0999	FALSE	DOSTA	DOSTA0	DOSTA	0	01	-54.4068	-89.2796		
FLORT	2014-05	Shore CyberPoP - Coastal Mooring Server	5m below sea surface	TRUE	TRUE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	5	5	25	CE06ISSM-RI003-02-FLORTD999	FALSE	FLORT	FLORTD	FLORT	D	01	47	-124.162	ECO Triplet-w	
VELPT	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	5m below sea surface	TRUE	FALSE	["VELPTMN_L1"]	2020-01-01 00:00:00	5	5	80	CE02SHSM-RI002-02-VELPTA999	TRUE	VELPT	VELPTA	VELPT	A	01	44.64	-124.3	Aquadopp 300m	
PCO2W	2014-10	InSitu CyberPoP - Surface Mooring Platform Controller	2m above bottom	TRUE	FALSE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	498	498	500	CE09OSSM-MF004-03-PCO2WB999	TRUE	PCO2W	PCO2WB	PCO2W	B	01	46.91	-124.95	SAMI-pCO2	
PCO2W	2015-01	Shore CyberPoP - Open Ocean Glider Dock Server	Sea Surface to 150m	TRUE	TRUE	["CO2ABS1_L0", "CO2ABS2_L0", "CO2THRM_L0", "PCO2WAT_L1"]	2020-01-01 00:00:00	150	0	5200	GA02HYPM-SP001-02-PCO2W0999	FALSE	PCO2W	PCO2W0	PCO2W	0	01	-42.9222	-42.5104		
FLORT	2014-08	Shore CyberPoP - Regional Observatory Management System	Near bottom to 200	FALSE	FALSE	["CDOMFLO_L0", "CDOMFLO_L1", "CHLAFLO_L0", "CHLAFLO_L1", "FLUBSCT_L0", "FLUBSCT_L1"]	2020-01-01 00:00:00	2906	200	2906	RS01SBVM-DP01A-04-FLORTA102	TRUE	FLORT	FLORTA	FLORT	A	01	44.55404	-125.35235	FLNTURTD (chlorophyll and backscatter), and FLCDRTD (CDOM)	
\.


--
-- Data for Name: spiketests; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY spiketests (instrument_array, instrument_class, reference_designator, data_products, units, accuracy, spike_n, spike_l) FROM stdin;
CE	DOSTA	CE01ISSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE01ISSM-MF004-02-PHSEND999	PHWATER		\N	\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE01ISSM-MF004-03-OPTAA0999	OPTTEMP		\N	\N	\N
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE01ISSM-MF004-04-PCO2WB999	PCO2WAT		\N	\N	\N
CE	ADCPT	CE01ISSM-MF004-05-ADCPTM999	ECHOINT		\N	\N	\N
CE	ADCPT	CE01ISSM-MF004-05-ADCPTM999	VELPROF		\N	\N	\N
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE01ISSM-MF005-01-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ZPLSC	CE01ISSM-MF005-02-ZPLSCC999	SONBSCA		\N	\N	\N
CE	VEL3D	CE01ISSM-MF005-03-VEL3DD999	VELPTTU		\N	\N	\N
CE	PRESF	CE01ISSM-MF005-04-PRESFA999	SFLPRES		\N	\N	\N
CE	CAMDS	CE01ISSM-MF005-05-CAMDSA999	CAMSTIL		\N	\N	\N
CE	DOSTA	CE01ISSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE01ISSM-RI002-02-VELPTA999	VELPTMN		\N	\N	\N
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE01ISSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE01ISSM-RI002-05-PCO2WB999	PCO2WAT		\N	\N	\N
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE01ISSM-RI003-01-CTDBPC999	TEMPWAT		\N	\N	\N
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE01ISSM-RI003-02-FLORT0999	FLUBSCT		\N	\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE01ISSM-RI003-03-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE01ISSM-RI003-04-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE01ISSM-RI003-05-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE01ISSM-RI003-05-SPKIRB999	SPECTIR		\N	\N	\N
CE	VELPT	CE01ISSM-SB001-01-VELPTA999	VELPTMN		\N	\N	\N
CE	DOFST	CE01ISSP-SP001-02-DOFST0999	DOCONCF		\N	\N	\N
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	CO2THRM		\N	\N	\N
CE	PCO2W	CE01ISSP-SP001-03-PCO2W0999	PCO2WAT		\N	\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE01ISSP-SP001-04-OPTAA0999	OPTTEMP		\N	\N	\N
CE	VEL3D	CE01ISSP-SP001-05-VEL3D0999	VELPTTU		\N	\N	\N
CE	NUTNR	CE01ISSP-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
CE	SPKIR	CE01ISSP-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
CE	SPKIR	CE01ISSP-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE01ISSP-SP001-08-FLORT0999	FLUBSCT		\N	\N	\N
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	CONDWAT		\N	\N	\N
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	DENSITY		\N	\N	\N
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	PRACSAL		\N	\N	\N
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	PRESWAT		\N	\N	\N
CE	CTDPF	CE01ISSP-SP001-09-CTDPF0999	TEMPWAT		\N	\N	\N
CE	PARAD	CE01ISSP-SP001-10-PARAD0999	OPTPARW		\N	\N	\N
CE	ADCPT	CE02SHBP-LJ01D-05-ADCPTB104	ECHOINT		\N	\N	\N
CE	ADCPT	CE02SHBP-LJ01D-05-ADCPTB104	VELPROF		\N	\N	\N
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	CONDWAT		\N	\N	\N
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	DENSITY		\N	\N	\N
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	PRACSAL		\N	\N	\N
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	PRESWAT		\N	\N	\N
CE	CTDBP	CE02SHBP-LJ01D-06-CTDBPN106	TEMPWAT		\N	\N	\N
CE	DOSTA	CE02SHBP-LJ01D-06-DOSTAD106	DOCONCS		\N	\N	\N
CE	VEL3D	CE02SHBP-LJ01D-07-VEL3DC108	VELPTTU		\N	\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTABSN		\N	\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTATTN		\N	\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTCREF		\N	\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTCSIG		\N	\N	\N
CE	OPTAA	CE02SHBP-LJ01D-08-OPTAAC106	OPTTEMP		\N	\N	\N
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2ABS1		\N	\N	\N
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2ABS2		\N	\N	\N
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	CO2THRM		\N	\N	\N
CE	PCO2W	CE02SHBP-LJ01D-09-PCO2WB103	PCO2WAT		\N	\N	\N
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	ABSTHRM		\N	\N	\N
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PH434SI		\N	\N	\N
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PH578SI		\N	\N	\N
CE	PHSEN	CE02SHBP-LJ01D-10-PHSEND103	PHWATER		\N	\N	\N
CE	HYDBB	CE02SHBP-LJ01D-11-HYDBBA106	HYDACPR		\N	\N	\N
CE	HYDBB	CE02SHBP-LJ01D-11-HYDBBA106	HYDFREQ		\N	\N	\N
CE	CAMDS	CE02SHBP-LJ01D-12-CAMDSB107	CAMSTIL		\N	\N	\N
CE	ZPLSC	CE02SHBP-MJ01C-07-ZPLSCB101	SONBSCA		\N	\N	\N
CE	DOSTA	CE02SHSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE02SHSM-RI002-02-VELPTA999	VELPTMN		\N	\N	\N
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE02SHSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE02SHSM-RI002-05-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ADCPT	CE02SHSM-RI003-01-ADCPTA999	ECHOINT		\N	\N	\N
CE	ADCPT	CE02SHSM-RI003-01-ADCPTA999	VELPROF		\N	\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE02SHSM-RI003-02-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE02SHSM-RI003-03-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE02SHSM-RI003-04-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE02SHSM-RI003-04-SPKIRB999	SPECTIR		\N	\N	\N
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE02SHSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CE	METBK	CE02SHSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CE	PCO2A	CE02SHSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
CE	FDCHP	CE02SHSM-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
CE	VELPT	CE02SHSM-SB001-05-VELPTA999	VELPTMN		\N	\N	\N
CE	WAVSS	CE02SHSM-SB001-06-WAVSSA999	WAVSTAT		\N	\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	CONDWAT		\N	\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	DENSITY		\N	\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	PRACSAL		\N	\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	PRESWAT		\N	\N	\N
CE	CTDPF	CE02SHSP-SP001-01-CTDPF0999	TEMPWAT		\N	\N	\N
CE	DOFST	CE02SHSP-SP001-01-DOFST0999	DOCONCF		\N	\N	\N
CE	VEL3D	CE02SHSP-SP001-02-VEL3D0999	VELPTTU		\N	\N	\N
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	CO2THRM		\N	\N	\N
CE	PCO2W	CE02SHSP-SP001-03-PCO2W0999	PCO2WAT		\N	\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE02SHSP-SP001-04-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE02SHSP-SP001-05-NUTNR0999	NITROPT		\N	\N	\N
CE	SPKIR	CE02SHSP-SP001-06-SPKIR0999	OPTATTS		\N	\N	\N
CE	SPKIR	CE02SHSP-SP001-06-SPKIR0999	SPECTIR		\N	\N	\N
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE02SHSP-SP001-07-FLORT0999	FLUBSCT		\N	\N	\N
CE	PARAD	CE02SHSP-SP001-08-PARAD0999	OPTPARW		\N	\N	\N
CE	ADCPS	CE04OSBP-LJ01C-05-ADCPSI103	ECHOINT		\N	\N	\N
CE	ADCPS	CE04OSBP-LJ01C-05-ADCPSI103	VELPROF		\N	\N	\N
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	CONDWAT		\N	\N	\N
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	DENSITY		\N	\N	\N
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	PRACSAL		\N	\N	\N
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	PRESWAT		\N	\N	\N
CE	CTDBP	CE04OSBP-LJ01C-06-CTDBPO108	TEMPWAT		\N	\N	\N
CE	DOSTA	CE04OSBP-LJ01C-06-DOSTAD108	DOCONCS		\N	\N	\N
CE	VEL3D	CE04OSBP-LJ01C-07-VEL3DC107	VELPTTU		\N	\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTABSN		\N	\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTATTN		\N	\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTCREF		\N	\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTCSIG		\N	\N	\N
CE	OPTAA	CE04OSBP-LJ01C-08-OPTAAC104	OPTTEMP		\N	\N	\N
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2ABS1		\N	\N	\N
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2ABS2		\N	\N	\N
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	CO2THRM		\N	\N	\N
CE	PCO2W	CE04OSBP-LJ01C-09-PCO2WB104	PCO2WAT		\N	\N	\N
CE	HYDBB	CE04OSBP-LJ01C-10-HYDBBA105	HYDACPR		\N	\N	\N
CE	HYDBB	CE04OSBP-LJ01C-10-HYDBBA105	HYDFREQ		\N	\N	\N
CE	CAMDS	CE04OSBP-LJ01C-11-CAMDSB106	CAMSTIL		\N	\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	CONDWAT		\N	\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	DENSITY		\N	\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	PRACSAL		\N	\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	PRESWAT		\N	\N	\N
CE	CTDPF	CE04OSHY-DP01B-01-CTDPFA105	TEMPWAT		\N	\N	\N
CE	VEL3D	CE04OSHY-DP01B-02-VEL3DA105	VELPTTU		\N	\N	\N
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	CDOMFLO		\N	\N	\N
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	CHLAFLO		\N	\N	\N
CE	FLORT	CE04OSHY-DP01B-04-FLORTA103	FLUBSCT		\N	\N	\N
CE	DOFST	CE04OSHY-DP01B-06-DOFSTA105	DOCONCF		\N	\N	\N
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	ABSTHRM		\N	\N	\N
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PH434SI		\N	\N	\N
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PH578SI		\N	\N	\N
CE	PHSEN	CE04OSHY-PC01B-05-PHSENB106	PHWATER		\N	\N	\N
CE	ZPLSC	CE04OSHY-PC01B-08-ZPLSCB102	SONBSCA		\N	\N	\N
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2ABS1		\N	\N	\N
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2ABS2		\N	\N	\N
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	CO2THRM		\N	\N	\N
CE	PCO2W	CE04OSHY-PC01B-12-PCO2WA105	PCO2WAT		\N	\N	\N
CE	VEL3D	CE04OSHY-SF01B-02-VEL3DA106	VELPTTU		\N	\N	\N
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	CDOMFLO		\N	\N	\N
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	CHLAFLO		\N	\N	\N
CE	FLORT	CE04OSHY-SF01B-03-FLORTA104	FLUBSCT		\N	\N	\N
CE	NUTNR	CE04OSHY-SF01B-04-NUTNRA102	NITROPT		\N	\N	\N
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2ABS1		\N	\N	\N
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2ABS2		\N	\N	\N
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	CO2THRM		\N	\N	\N
CE	PCO2W	CE04OSHY-SF01B-05-PCO2WA102	PCO2WAT		\N	\N	\N
CE	PARAD	CE04OSHY-SF01B-06-PARADA102	OPTPARW		\N	\N	\N
CE	SPKIR	CE04OSHY-SF01B-07-SPKIRA102	OPTATTS		\N	\N	\N
CE	SPKIR	CE04OSHY-SF01B-07-SPKIRA102	SPECTIR		\N	\N	\N
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	CONDWAT		\N	\N	\N
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	DENSITY		\N	\N	\N
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	PRACSAL		\N	\N	\N
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	PRESWAT		\N	\N	\N
CE	CTDPF	CE04OSHY-SF01B-08-CTDPFA107	TEMPWAT		\N	\N	\N
CE	DOFST	CE04OSHY-SF01B-08-DOFSTA107	DOCONCF		\N	\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTABSN		\N	\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTATTN		\N	\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTCREF		\N	\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTCSIG		\N	\N	\N
CE	OPTAA	CE04OSHY-SF01B-09-OPTAAA105	OPTTEMP		\N	\N	\N
CE	DOSTA	CE04OSSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE04OSSM-RI002-02-VELPTB999	VELPTMN		\N	\N	\N
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE04OSSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE04OSSM-RI002-05-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ADCPT	CE04OSSM-RI003-01-ADCPTC999	ECHOINT		\N	\N	\N
CE	ADCPT	CE04OSSM-RI003-01-ADCPTC999	VELPROF		\N	\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE04OSSM-RI003-02-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE04OSSM-RI003-03-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE04OSSM-RI003-04-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE04OSSM-RI003-04-SPKIRB999	SPECTIR		\N	\N	\N
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE04OSSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CE	METBK	CE04OSSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CE	PCO2A	CE04OSSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
CE	FDCHP	CE04OSSM-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
CE	VELPT	CE04OSSM-SB001-05-VELPTA999	VELPTMN		\N	\N	\N
CE	WAVSS	CE04OSSM-SB001-06-WAVSSA999	WAVSTAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL001-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL001-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL001-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL001-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL001-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL001-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL002-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL002-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL002-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL002-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL002-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL002-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL003-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL003-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL003-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL003-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL003-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL003-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL004-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL004-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL004-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL004-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL004-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL004-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL005-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL005-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL005-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL005-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL005-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL005-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	PARAD	CE05MOAS-GL006-01-PARADM999	OPTPARW		\N	\N	\N
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	CDOMFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	CHLAFLO		\N	\N	\N
CE	FLORT	CE05MOAS-GL006-02-FLORTM999	FLUBSCT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL006-03-ADCPAM999	ECHOINT		\N	\N	\N
CE	ADCPA	CE05MOAS-GL006-03-ADCPAM999	VELPROF		\N	\N	\N
CE	DOSTA	CE05MOAS-GL006-04-DOSTAM999	DOCONCS		\N	\N	\N
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	CONDWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	DENSITY		\N	\N	\N
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	PRACSAL		\N	\N	\N
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	PRESWAT		\N	\N	\N
CE	CTDGV	CE05MOAS-GL006-05-CTDGVM999	TEMPWAT		\N	\N	\N
CE	DOSTA	CE06ISSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE06ISSM-MF004-02-PHSEND999	PHWATER		\N	\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE06ISSM-MF004-03-OPTAA0999	OPTTEMP		\N	\N	\N
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE06ISSM-MF004-04-PCO2WB999	PCO2WAT		\N	\N	\N
CE	ADCPT	CE06ISSM-MF004-05-ADCPTM999	ECHOINT		\N	\N	\N
CE	ADCPT	CE06ISSM-MF004-05-ADCPTM999	VELPROF		\N	\N	\N
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE06ISSM-MF005-01-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ZPLSC	CE06ISSM-MF005-02-ZPLSCC999	SONBSCA		\N	\N	\N
CE	VEL3D	CE06ISSM-MF005-03-VEL3DD999	VELPTTU		\N	\N	\N
CE	PRESF	CE06ISSM-MF005-04-PRESFA999	SFLPRES		\N	\N	\N
CE	CAMDS	CE06ISSM-MF005-05-CAMDSA999	CAMSTIL		\N	\N	\N
CE	DOSTA	CE06ISSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE06ISSM-RI002-02-VELPTA999	VELPTMN		\N	\N	\N
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE06ISSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE06ISSM-RI002-05-PCO2WB999	PCO2WAT		\N	\N	\N
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE06ISSM-RI003-01-CTDBPC999	TEMPWAT		\N	\N	\N
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE06ISSM-RI003-02-FLORT0999	FLUBSCT		\N	\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE06ISSM-RI003-03-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE06ISSM-RI003-04-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE06ISSM-RI003-05-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE06ISSM-RI003-05-SPKIRB999	SPECTIR		\N	\N	\N
CE	VELPT	CE06ISSM-SB001-01-VELPTA999	VELPTMN		\N	\N	\N
CE	DOFST	CE06ISSP-SP001-02-DOFST0999	DOCONCF		\N	\N	\N
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	CO2THRM		\N	\N	\N
CE	PCO2W	CE06ISSP-SP001-03-PCO2W0999	PCO2WAT		\N	\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE06ISSP-SP001-04-OPTAA0999	OPTTEMP		\N	\N	\N
CE	VEL3D	CE06ISSP-SP001-05-VEL3D0999	VELPTTU		\N	\N	\N
CE	NUTNR	CE06ISSP-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
CE	SPKIR	CE06ISSP-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
CE	SPKIR	CE06ISSP-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE06ISSP-SP001-08-FLORT0999	FLUBSCT		\N	\N	\N
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	CONDWAT		\N	\N	\N
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	DENSITY		\N	\N	\N
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	PRACSAL		\N	\N	\N
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	PRESWAT		\N	\N	\N
CE	CTDPF	CE06ISSP-SP001-09-CTDPF0999	TEMPWAT		\N	\N	\N
CE	PARAD	CE06ISSP-SP001-10-PARAD0999	OPTPARW		\N	\N	\N
CE	DOSTA	CE07SHSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE07SHSM-MF004-02-PHSEND999	PHWATER		\N	\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE07SHSM-MF004-03-OPTAA0999	OPTTEMP		\N	\N	\N
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE07SHSM-MF004-04-PCO2WB999	PCO2WAT		\N	\N	\N
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE07SHSM-MF004-05-CTDBPC999	TEMPWAT		\N	\N	\N
CE	PRESF	CE07SHSM-MF005-01-PRESFB999	SFLPRES		\N	\N	\N
CE	CAMDS	CE07SHSM-MF005-02-CAMDSA999	CAMSTIL		\N	\N	\N
CE	ZPLSC	CE07SHSM-MF005-03-ZPLSCC999	SONBSCA		\N	\N	\N
CE	ADCPT	CE07SHSM-MF005-04-ADCPTC999	ECHOINT		\N	\N	\N
CE	ADCPT	CE07SHSM-MF005-04-ADCPTC999	VELPROF		\N	\N	\N
CE	VEL3D	CE07SHSM-MF005-05-VEL3DD999	VELPTTU		\N	\N	\N
CE	DOSTA	CE07SHSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE07SHSM-RI002-02-VELPTA999	VELPTMN		\N	\N	\N
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE07SHSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE07SHSM-RI002-05-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ADCPT	CE07SHSM-RI003-01-ADCPTA999	ECHOINT		\N	\N	\N
CE	ADCPT	CE07SHSM-RI003-01-ADCPTA999	VELPROF		\N	\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE07SHSM-RI003-02-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE07SHSM-RI003-03-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE07SHSM-RI003-04-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE07SHSM-RI003-04-SPKIRB999	SPECTIR		\N	\N	\N
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE07SHSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CE	METBK	CE07SHSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CE	PCO2A	CE07SHSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
CE	FDCHP	CE07SHSM-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
CE	VELPT	CE07SHSM-SB001-05-VELPTA999	VELPTMN		\N	\N	\N
CE	WAVSS	CE07SHSM-SB001-06-WAVSSA999	WAVSTAT		\N	\N	\N
CE	DOFST	CE07SHSP-SP001-01-DOFST0999	DOCONCF		\N	\N	\N
CE	VEL3D	CE07SHSP-SP001-02-VEL3D0999	VELPTTU		\N	\N	\N
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	CO2THRM		\N	\N	\N
CE	PCO2W	CE07SHSP-SP001-03-PCO2W0999	PCO2WAT		\N	\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE07SHSP-SP001-04-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE07SHSP-SP001-05-NUTNR0999	NITROPT		\N	\N	\N
CE	SPKIR	CE07SHSP-SP001-06-SPKIR0999	OPTATTS		\N	\N	\N
CE	SPKIR	CE07SHSP-SP001-06-SPKIR0999	SPECTIR		\N	\N	\N
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE07SHSP-SP001-07-FLORT0999	FLUBSCT		\N	\N	\N
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	CONDWAT		\N	\N	\N
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	DENSITY		\N	\N	\N
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	PRACSAL		\N	\N	\N
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	PRESWAT		\N	\N	\N
CE	CTDPF	CE07SHSP-SP001-08-CTDPF0999	TEMPWAT		\N	\N	\N
CE	PARAD	CE07SHSP-SP001-09-PARAD0999	OPTPARW		\N	\N	\N
CE	VEL3D	CE09OSPM-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CE	DOFST	CE09OSPM-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CE	CTDPF	CE09OSPM-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE09OSPM-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CE	PARAD	CE09OSPM-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CE	DOSTA	CE09OSSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE09OSSM-MF004-02-OPTAA0999	OPTTEMP		\N	\N	\N
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2ABS1		\N	\N	\N
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2ABS2		\N	\N	\N
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	CO2THRM		\N	\N	\N
CE	PCO2W	CE09OSSM-MF004-03-PCO2WB999	PCO2WAT		\N	\N	\N
CE	ADCPS	CE09OSSM-MF004-04-ADCPSJ999	ECHOINT		\N	\N	\N
CE	ADCPS	CE09OSSM-MF004-04-ADCPSJ999	VELPROF		\N	\N	\N
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	CONDWAT		\N	\N	\N
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	DENSITY		\N	\N	\N
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	PRACSAL		\N	\N	\N
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	PRESWAT		\N	\N	\N
CE	CTDBP	CE09OSSM-MF005-01-CTDBPE999	TEMPWAT		\N	\N	\N
CE	PRESF	CE09OSSM-MF005-02-PRESFC999	SFLPRES		\N	\N	\N
CE	CAMDS	CE09OSSM-MF005-03-CAMDSA999	CAMSTIL		\N	\N	\N
CE	VEL3D	CE09OSSM-MF005-04-VEL3DD999	VELPTTU		\N	\N	\N
CE	DOSTA	CE09OSSM-RI002-01-DOSTAD999	DOCONCS		\N	\N	\N
CE	VELPT	CE09OSSM-RI002-02-VELPTB999	VELPTMN		\N	\N	\N
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	ABSTHRM		\N	\N	\N
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PH434SI		\N	\N	\N
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PH578SI		\N	\N	\N
CE	PHSEN	CE09OSSM-RI002-03-PHSEND999	PHWATER		\N	\N	\N
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	CONDWAT		\N	\N	\N
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	DENSITY		\N	\N	\N
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	PRACSAL		\N	\N	\N
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	PRESWAT		\N	\N	\N
CE	CTDBP	CE09OSSM-RI002-05-CTDBPC999	TEMPWAT		\N	\N	\N
CE	ADCPT	CE09OSSM-RI003-01-ADCPTC999	ECHOINT		\N	\N	\N
CE	ADCPT	CE09OSSM-RI003-01-ADCPTC999	VELPROF		\N	\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTABSN		\N	\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTATTN		\N	\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTCREF		\N	\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTCSIG		\N	\N	\N
CE	OPTAA	CE09OSSM-RI003-02-OPTAA0999	OPTTEMP		\N	\N	\N
CE	NUTNR	CE09OSSM-RI003-03-NUTNRB999	NITROPT		\N	\N	\N
CE	SPKIR	CE09OSSM-RI003-04-SPKIRB999	OPTATTS		\N	\N	\N
CE	SPKIR	CE09OSSM-RI003-04-SPKIRB999	SPECTIR		\N	\N	\N
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CE	FLORT	CE09OSSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CE	METBK	CE09OSSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CE	PCO2A	CE09OSSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
CE	FDCHP	CE09OSSM-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
CE	VELPT	CE09OSSM-SB001-05-VELPTA999	VELPTMN		\N	\N	\N
CE	WAVSS	CE09OSSM-SB001-06-WAVSSA999	WAVSTAT		\N	\N	\N
CP	ADCPT	CP01CNSM-MF004-01-ADCPTF999	ECHOINT		\N	\N	\N
CP	ADCPT	CP01CNSM-MF004-01-ADCPTF999	VELPROF		\N	\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP01CNSM-MF004-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	DOSTA	CP01CNSM-MF004-03-DOSTAD999	DOCONCS		\N	\N	\N
CP	VELPT	CP01CNSM-MF004-04-VELPTA999	VELPTMN		\N	\N	\N
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2ABS1		\N	\N	\N
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2ABS2		\N	\N	\N
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	CO2THRM		\N	\N	\N
CP	PCO2W	CP01CNSM-MF005-01-PCO2WB999	PCO2WAT		\N	\N	\N
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	CONDWAT		\N	\N	\N
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	DENSITY		\N	\N	\N
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	PRACSAL		\N	\N	\N
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	PRESWAT		\N	\N	\N
CP	CTDBP	CP01CNSM-MF005-02-CTDBPD999	TEMPWAT		\N	\N	\N
CP	ZPLSC	CP01CNSM-MF005-03-ZPLSCC999	SONBSCA		\N	\N	\N
CP	PRESF	CP01CNSM-MF005-04-PRESFB999	SFLPRES		\N	\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP01CNSM-RI002-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	CONDWAT		\N	\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	DENSITY		\N	\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	PRACSAL		\N	\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	PRESWAT		\N	\N	\N
CP	CTDBP	CP01CNSM-RI002-03-CTDBPC999	TEMPWAT		\N	\N	\N
CP	VELPT	CP01CNSM-RI002-04-VELPTA999	VELPTMN		\N	\N	\N
CP	NUTNR	CP01CNSM-RI003-01-NUTNRB999	NITROPT		\N	\N	\N
CP	DOSTA	CP01CNSM-RI003-02-DOSTAD999	DOCONCS		\N	\N	\N
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	ABSTHRM		\N	\N	\N
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PH434SI		\N	\N	\N
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PH578SI		\N	\N	\N
CP	PHSEN	CP01CNSM-RI003-03-PHSEND999	PHWATER		\N	\N	\N
CP	SPKIR	CP01CNSM-RI003-04-SPKIRB999	OPTATTS		\N	\N	\N
CP	SPKIR	CP01CNSM-RI003-04-SPKIRB999	SPECTIR		\N	\N	\N
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP01CNSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CP	METBK	CP01CNSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	BARPRES		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	CONDSRF		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	LONGIRR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	PRECIPM		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	RELHUMI		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	SHRTIRR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	SPECHUM		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	TEMPAIR		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	TEMPSRF		\N	\N	\N
CP	METBK	CP01CNSM-SB001-02-METBKA999	WINDAVG		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CP	PCO2A	CP01CNSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CP	WAVSS	CP01CNSM-SB001-04-WAVSSA999	WAVSTAT		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXHOT		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXMOM		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	FLUXWET		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	MOISTUR		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	MOTFLUX		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	TMPATUR		\N	\N	\N
CP	FDCLP	CP01CNSM-SB001-05-FDCLP0999	WINDTUR		\N	\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP01CNSP-SP001-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	NUTNR	CP01CNSP-SP001-03-NUTNR0999	NITROPT		\N	\N	\N
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2ABS1		\N	\N	\N
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2ABS2		\N	\N	\N
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	CO2THRM		\N	\N	\N
CP	PCO2W	CP01CNSP-SP001-04-PCO2W0999	PCO2WAT		\N	\N	\N
CP	VEL3D	CP01CNSP-SP001-05-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP01CNSP-SP001-06-DOFST0999	DOCONCF		\N	\N	\N
CP	SPKIR	CP01CNSP-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
CP	SPKIR	CP01CNSP-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP01CNSP-SP001-08-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP01CNSP-SP001-09-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP01CNSP-SP001-10-PARAD0999	OPTPARW		\N	\N	\N
CP	ADCPT	CP02PMCI-RI001-01-ADCPTG999	ECHOINT		\N	\N	\N
CP	ADCPT	CP02PMCI-RI001-01-ADCPTG999	VELPROF		\N	\N	\N
CP	VEL3D	CP02PMCI-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP02PMCI-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP02PMCI-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP02PMCI-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP02PMCI-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CP	ADCPT	CP02PMCO-RI001-01-ADCPTG999	ECHOINT		\N	\N	\N
CP	ADCPT	CP02PMCO-RI001-01-ADCPTG999	VELPROF		\N	\N	\N
CP	VEL3D	CP02PMCO-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP02PMCO-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP02PMCO-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP02PMCO-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP02PMCO-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CP	ADCPT	CP02PMUI-RI001-01-ADCPTG999	ECHOINT		\N	\N	\N
CP	ADCPT	CP02PMUI-RI001-01-ADCPTG999	VELPROF		\N	\N	\N
CP	VEL3D	CP02PMUI-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP02PMUI-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP02PMUI-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP02PMUI-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP02PMUI-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CP	ADCPS	CP02PMUO-RI001-01-ADCPSL999	ECHOINT		\N	\N	\N
CP	ADCPS	CP02PMUO-RI001-01-ADCPSL999	VELPROF		\N	\N	\N
CP	VEL3D	CP02PMUO-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP02PMUO-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP02PMUO-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP02PMUO-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP02PMUO-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CP	DOSTA	CP03ISSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CP	VELPT	CP03ISSM-MF004-03-VELPTA999	VELPTMN		\N	\N	\N
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	CONDWAT		\N	\N	\N
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	DENSITY		\N	\N	\N
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	PRACSAL		\N	\N	\N
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	PRESWAT		\N	\N	\N
CP	CTDBP	CP03ISSM-MF004-04-CTDBPD999	TEMPWAT		\N	\N	\N
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	ABSTHRM		\N	\N	\N
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PH434SI		\N	\N	\N
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PH578SI		\N	\N	\N
CP	PHSEN	CP03ISSM-MF004-05-PHSEND999	PHWATER		\N	\N	\N
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2ABS1		\N	\N	\N
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2ABS2		\N	\N	\N
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	CO2THRM		\N	\N	\N
CP	PCO2W	CP03ISSM-MF005-01-PCO2WB999	PCO2WAT		\N	\N	\N
CP	PRESF	CP03ISSM-MF005-02-PRESFB999	SFLPRES		\N	\N	\N
CP	ADCPT	CP03ISSM-MF005-03-ADCPTF999	ECHOINT		\N	\N	\N
CP	ADCPT	CP03ISSM-MF005-03-ADCPTF999	VELPROF		\N	\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP03ISSM-MF005-04-OPTAA0999	OPTTEMP		\N	\N	\N
CP	ZPLSC	CP03ISSM-MF005-05-ZPLSCC999	SONBSCA		\N	\N	\N
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	ABSTHRM		\N	\N	\N
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PH434SI		\N	\N	\N
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PH578SI		\N	\N	\N
CP	PHSEN	CP03ISSM-RI002-01-PHSEND999	PHWATER		\N	\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP03ISSM-RI002-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	SPKIR	CP03ISSM-RI002-03-SPKIRB999	OPTATTS		\N	\N	\N
CP	SPKIR	CP03ISSM-RI002-03-SPKIRB999	SPECTIR		\N	\N	\N
CP	DOSTA	CP03ISSM-RI002-04-DOSTAD999	DOCONCS		\N	\N	\N
CP	NUTNR	CP03ISSM-RI003-01-NUTNRB999	NITROPT		\N	\N	\N
CP	VELPT	CP03ISSM-RI003-03-VELPTA999	VELPTMN		\N	\N	\N
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	CONDWAT		\N	\N	\N
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	DENSITY		\N	\N	\N
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	PRACSAL		\N	\N	\N
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	PRESWAT		\N	\N	\N
CP	CTDBP	CP03ISSM-RI003-04-CTDBPC999	TEMPWAT		\N	\N	\N
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP03ISSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	BARPRES		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	CONDSRF		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	LONGIRR		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	PRECIPM		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	RELHUMI		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	SPECHUM		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
CP	METBK	CP03ISSM-SB001-01-METBKA999	WINDAVG		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXHOT		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXMOM		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	FLUXWET		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	MOISTUR		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	MOTFLUX		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	TMPATUR		\N	\N	\N
CP	FDCLP	CP03ISSM-SB001-02-FDCLP0999	WINDTUR		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CP	PCO2A	CP03ISSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP03ISSP-SP001-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	NUTNR	CP03ISSP-SP001-03-NUTNR0999	NITROPT		\N	\N	\N
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2ABS1		\N	\N	\N
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2ABS2		\N	\N	\N
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	CO2THRM		\N	\N	\N
CP	PCO2W	CP03ISSP-SP001-04-PCO2W0999	PCO2WAT		\N	\N	\N
CP	VEL3D	CP03ISSP-SP001-05-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP03ISSP-SP001-06-DOFST0999	DOCONCF		\N	\N	\N
CP	SPKIR	CP03ISSP-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
CP	SPKIR	CP03ISSP-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP03ISSP-SP001-08-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP03ISSP-SP001-09-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP03ISSP-SP001-10-PARAD0999	OPTPARW		\N	\N	\N
CP	VEL3D	CP04OSPM-WF001-01-VEL3D0999	VELPTTU		\N	\N	\N
CP	DOFST	CP04OSPM-WF001-02-DOFST0999	DOCONCF		\N	\N	\N
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	CONDWAT		\N	\N	\N
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	DENSITY		\N	\N	\N
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	PRACSAL		\N	\N	\N
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	PRESWAT		\N	\N	\N
CP	CTDPF	CP04OSPM-WF001-03-CTDPF0999	TEMPWAT		\N	\N	\N
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP04OSPM-WF001-04-FLORT0999	FLUBSCT		\N	\N	\N
CP	PARAD	CP04OSPM-WF001-05-PARAD0999	OPTPARW		\N	\N	\N
CP	DOSTA	CP04OSSM-MF004-01-DOSTAD999	DOCONCS		\N	\N	\N
CP	VELPT	CP04OSSM-MF004-03-VELPTB999	VELPTMN		\N	\N	\N
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	CONDWAT		\N	\N	\N
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	DENSITY		\N	\N	\N
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	PRACSAL		\N	\N	\N
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	PRESWAT		\N	\N	\N
CP	CTDBP	CP04OSSM-MF004-04-CTDBPE999	TEMPWAT		\N	\N	\N
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2ABS1		\N	\N	\N
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2ABS2		\N	\N	\N
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	CO2THRM		\N	\N	\N
CP	PCO2W	CP04OSSM-MF005-01-PCO2WB999	PCO2WAT		\N	\N	\N
CP	PRESF	CP04OSSM-MF005-02-PRESFC999	SFLPRES		\N	\N	\N
CP	ADCPS	CP04OSSM-MF005-03-ADCPSJ999	ECHOINT		\N	\N	\N
CP	ADCPS	CP04OSSM-MF005-03-ADCPSJ999	VELPROF		\N	\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP04OSSM-MF005-04-OPTAA0999	OPTTEMP		\N	\N	\N
CP	ZPLSC	CP04OSSM-MF005-05-ZPLSCC999	SONBSCA		\N	\N	\N
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	ABSTHRM		\N	\N	\N
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PH434SI		\N	\N	\N
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PH578SI		\N	\N	\N
CP	PHSEN	CP04OSSM-RI002-01-PHSEND999	PHWATER		\N	\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTABSN		\N	\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTATTN		\N	\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTCREF		\N	\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTCSIG		\N	\N	\N
CP	OPTAA	CP04OSSM-RI002-02-OPTAA0999	OPTTEMP		\N	\N	\N
CP	SPKIR	CP04OSSM-RI002-03-SPKIRB999	OPTATTS		\N	\N	\N
CP	SPKIR	CP04OSSM-RI002-03-SPKIRB999	SPECTIR		\N	\N	\N
CP	DOSTA	CP04OSSM-RI002-04-DOSTAD999	DOCONCS		\N	\N	\N
CP	NUTNR	CP04OSSM-RI003-01-NUTNRB999	NITROPT		\N	\N	\N
CP	VELPT	CP04OSSM-RI003-03-VELPTB999	VELPTMN		\N	\N	\N
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	CONDWAT		\N	\N	\N
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	DENSITY		\N	\N	\N
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	PRACSAL		\N	\N	\N
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	PRESWAT		\N	\N	\N
CP	CTDBP	CP04OSSM-RI003-04-CTDBPC999	TEMPWAT		\N	\N	\N
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	CDOMFLO		\N	\N	\N
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	CHLAFLO		\N	\N	\N
CP	FLORT	CP04OSSM-RI003-05-FLORT0999	FLUBSCT		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXHOT		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXMOM		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	FLUXWET		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	MOISTUR		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	MOTFLUX		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	TMPATUR		\N	\N	\N
CP	FDCLP	CP04OSSM-SB001-01-FDCLP0999	WINDTUR		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	BARPRES		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	CONDSRF		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	LONGIRR		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	PRECIPM		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	RELHUMI		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	SHRTIRR		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	SPECHUM		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	TEMPAIR		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	TEMPSRF		\N	\N	\N
CP	METBK	CP04OSSM-SB001-02-METBKA999	WINDAVG		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
CP	PCO2A	CP04OSSM-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV001-01-FLORTN999	FLUBSCT		\N	\N	\N
CP	DOSTA	CP05MOAS-AV001-02-DOSTAN999	DOCONCS		\N	\N	\N
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	CONDWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	DENSITY		\N	\N	\N
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	PRACSAL		\N	\N	\N
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	PRESWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV001-03-CTDAVN999	TEMPWAT		\N	\N	\N
CP	NUTNR	CP05MOAS-AV001-04-NUTNRN999	NITROPT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV001-05-ADCPAN999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV001-05-ADCPAN999	VELPROF		\N	\N	\N
CP	PARAD	CP05MOAS-AV001-06-PARADN999	OPTPARW		\N	\N	\N
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV002-01-FLORTN999	FLUBSCT		\N	\N	\N
CP	DOSTA	CP05MOAS-AV002-02-DOSTAN999	DOCONCS		\N	\N	\N
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	CONDWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	DENSITY		\N	\N	\N
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	PRACSAL		\N	\N	\N
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	PRESWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV002-03-CTDAVN999	TEMPWAT		\N	\N	\N
CP	NUTNR	CP05MOAS-AV002-04-NUTNRN999	NITROPT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV002-05-ADCPAN999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV002-05-ADCPAN999	VELPROF		\N	\N	\N
CP	PARAD	CP05MOAS-AV002-06-PARADN999	OPTPARW		\N	\N	\N
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-AV003-01-FLORTN999	FLUBSCT		\N	\N	\N
CP	DOSTA	CP05MOAS-AV003-02-DOSTAN999	DOCONCS		\N	\N	\N
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	CONDWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	DENSITY		\N	\N	\N
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	PRACSAL		\N	\N	\N
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	PRESWAT		\N	\N	\N
CP	CTDAV	CP05MOAS-AV003-03-CTDAVN999	TEMPWAT		\N	\N	\N
CP	NUTNR	CP05MOAS-AV003-04-NUTNRN999	NITROPT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV003-05-ADCPAN999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-AV003-05-ADCPAN999	VELPROF		\N	\N	\N
CP	PARAD	CP05MOAS-AV003-06-PARADN999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL001-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL001-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL001-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL001-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL001-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL001-05-PARADM999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL002-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL002-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL002-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL002-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL002-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL002-05-PARADM999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL003-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL003-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL003-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL003-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL003-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL003-05-PARADM999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL004-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL004-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL004-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL004-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL004-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL004-05-PARADM999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL005-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL005-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL005-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL005-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL005-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL005-05-PARADM999	OPTPARW		\N	\N	\N
CP	ADCPA	CP05MOAS-GL006-01-ADCPAM999	ECHOINT		\N	\N	\N
CP	ADCPA	CP05MOAS-GL006-01-ADCPAM999	VELPROF		\N	\N	\N
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	CDOMFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	CHLAFLO		\N	\N	\N
CP	FLORT	CP05MOAS-GL006-02-FLORTM999	FLUBSCT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	CONDWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	DENSITY		\N	\N	\N
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	PRACSAL		\N	\N	\N
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	PRESWAT		\N	\N	\N
CP	CTDGV	CP05MOAS-GL006-03-CTDGVM999	TEMPWAT		\N	\N	\N
CP	DOSTA	CP05MOAS-GL006-04-DOSTAM999	DOCONCS		\N	\N	\N
CP	PARAD	CP05MOAS-GL006-05-PARADM999	OPTPARW		\N	\N	\N
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	CONDWAT		\N	\N	\N
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	DENSITY		\N	\N	\N
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	PRACSAL		\N	\N	\N
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	PRESWAT		\N	\N	\N
GA	CTDBP	GA01SUMO-RI002-02-CTDBPF999	TEMPWAT		\N	\N	\N
GA	ADCPS	GA01SUMO-RI002-03-ADCPSN999	ECHOINT		\N	\N	\N
GA	ADCPS	GA01SUMO-RI002-03-ADCPSN999	VELPROF		\N	\N	\N
GA	FLORD	GA01SUMO-RI002-04-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA01SUMO-RI002-04-FLORD0999	FLUBSCT		\N	\N	\N
GA	VELPT	GA01SUMO-RI002-05-VELPTB999	VELPTMN		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	ABSTHRM		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PH434SI		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PH578SI		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-01-PHSENG999	PHWATER		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	ABSTHRM		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PH434SI		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PH578SI		\N	\N	\N
GA	PHSEN	GA01SUMO-RI003-02-PHSENG999	PHWATER		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-12-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-13-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	CONDWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	DENSITY		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	PRESWAT		\N	\N	\N
GA	CTDMO	GA01SUMO-RI003-14-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	METBK	GA01SUMO-SB001-01-METBKA999	BARPRES		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	CONDSRF		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	LONGIRR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	PRECIPM		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	RELHUMI		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	SPECHUM		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
GA	METBK	GA01SUMO-SB001-01-METBKA999	WINDAVG		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	BARPRES		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	CONDSRF		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	LONGIRR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	PRECIPM		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	RELHUMI		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	SHRTIRR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	SPECHUM		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	TEMPAIR		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	TEMPSRF		\N	\N	\N
GA	METBK	GA01SUMO-SB001-02-METBKA999	WINDAVG		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
GA	PCO2A	GA01SUMO-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
GA	FDCHP	GA01SUMO-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
GA	WAVSS	GA01SUMO-SB001-05-WAVSSA999	WAVSTAT		\N	\N	\N
GA	ZPLSG	GA02HYPM-MP003-01-ZPLSGA999	SONBSCA		\N	\N	\N
GA	FLORD	GA02HYPM-SP001-01-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA02HYPM-SP001-01-FLORD0999	FLUBSCT		\N	\N	\N
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2ABS1		\N	\N	\N
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2ABS2		\N	\N	\N
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	CO2THRM		\N	\N	\N
GA	PCO2W	GA02HYPM-SP001-02-PCO2W0999	PCO2WAT		\N	\N	\N
GA	DOSTA	GA02HYPM-SP001-03-DOSTA0999	DOCONCS		\N	\N	\N
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	CONDWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	DENSITY		\N	\N	\N
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	PRACSAL		\N	\N	\N
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	PRESWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-SP001-04-CTDPF0999	TEMPWAT		\N	\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTABSN		\N	\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTATTN		\N	\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTCREF		\N	\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTCSIG		\N	\N	\N
GA	OPTAA	GA02HYPM-SP001-05-OPTAA0999	OPTTEMP		\N	\N	\N
GA	NUTNR	GA02HYPM-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
GA	SPKIR	GA02HYPM-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
GA	SPKIR	GA02HYPM-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
GA	FLORD	GA02HYPM-WF002-01-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA02HYPM-WF002-01-FLORD0999	FLUBSCT		\N	\N	\N
GA	DOSTA	GA02HYPM-WF002-03-DOSTA0999	DOCONCS		\N	\N	\N
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	CONDWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	DENSITY		\N	\N	\N
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	PRACSAL		\N	\N	\N
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	PRESWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-WF002-04-CTDPF0999	TEMPWAT		\N	\N	\N
GA	VEL3D	GA02HYPM-WF002-05-VEL3D0999	VELPTTU		\N	\N	\N
GA	FLORD	GA02HYPM-WF004-01-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA02HYPM-WF004-01-FLORD0999	FLUBSCT		\N	\N	\N
GA	DOSTA	GA02HYPM-WF004-03-DOSTA0999	DOCONCS		\N	\N	\N
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	CONDWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	DENSITY		\N	\N	\N
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	PRACSAL		\N	\N	\N
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	PRESWAT		\N	\N	\N
GA	CTDPF	GA02HYPM-WF004-04-CTDPF0999	TEMPWAT		\N	\N	\N
GA	VEL3D	GA02HYPM-WF004-05-VEL3D0999	VELPTTU		\N	\N	\N
GA	FLORD	GA03FLMA-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA03FLMA-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GA	PHSEN	GA03FLMA-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GA	DOSTA	GA03FLMA-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GA	ADCPS	GA03FLMA-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GA	ADCPS	GA03FLMA-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMA-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	FLORD	GA03FLMB-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GA	FLORD	GA03FLMB-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GA	PHSEN	GA03FLMB-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GA	DOSTA	GA03FLMB-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GA	ADCPS	GA03FLMB-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GA	ADCPS	GA03FLMB-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GA	CTDMO	GA03FLMB-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GA	FLORD	GA05MOAS-GL001-01-FLORDM999	CHLAFLO		\N	\N	\N
GA	FLORD	GA05MOAS-GL001-01-FLORDM999	FLUBSCT		\N	\N	\N
GA	DOSTA	GA05MOAS-GL001-02-DOSTAM999	DOCONCS		\N	\N	\N
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	CONDWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	DENSITY		\N	\N	\N
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	PRACSAL		\N	\N	\N
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	PRESWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL001-04-CTDGVM999	TEMPWAT		\N	\N	\N
GA	FLORD	GA05MOAS-GL002-01-FLORDM999	CHLAFLO		\N	\N	\N
GA	FLORD	GA05MOAS-GL002-01-FLORDM999	FLUBSCT		\N	\N	\N
GA	DOSTA	GA05MOAS-GL002-02-DOSTAM999	DOCONCS		\N	\N	\N
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	CONDWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	DENSITY		\N	\N	\N
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	PRACSAL		\N	\N	\N
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	PRESWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL002-04-CTDGVM999	TEMPWAT		\N	\N	\N
GA	FLORD	GA05MOAS-GL003-01-FLORDM999	CHLAFLO		\N	\N	\N
GA	FLORD	GA05MOAS-GL003-01-FLORDM999	FLUBSCT		\N	\N	\N
GA	DOSTA	GA05MOAS-GL003-02-DOSTAM999	DOCONCS		\N	\N	\N
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	CONDWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	DENSITY		\N	\N	\N
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	PRACSAL		\N	\N	\N
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	PRESWAT		\N	\N	\N
GA	CTDGV	GA05MOAS-GL003-04-CTDGVM999	TEMPWAT		\N	\N	\N
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	CONDWAT		\N	\N	\N
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	DENSITY		\N	\N	\N
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	PRACSAL		\N	\N	\N
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	PRESWAT		\N	\N	\N
GI	CTDBP	GI01SUMO-RI002-02-CTDBPF999	TEMPWAT		\N	\N	\N
GI	ADCPS	GI01SUMO-RI002-03-ADCPSN999	ECHOINT		\N	\N	\N
GI	ADCPS	GI01SUMO-RI002-03-ADCPSN999	VELPROF		\N	\N	\N
GI	FLORD	GI01SUMO-RI002-04-FLORD0999	CHLAFLO		\N	\N	\N
GI	FLORD	GI01SUMO-RI002-04-FLORD0999	FLUBSCT		\N	\N	\N
GI	VELPT	GI01SUMO-RI002-05-VELPTB999	VELPTMN		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	ABSTHRM		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PH434SI		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PH578SI		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-01-PHSENG999	PHWATER		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	ABSTHRM		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PH434SI		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PH578SI		\N	\N	\N
GI	PHSEN	GI01SUMO-RI003-02-PHSENG999	PHWATER		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-12-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-13-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	CONDWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	DENSITY		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	PRESWAT		\N	\N	\N
GI	CTDMO	GI01SUMO-RI003-14-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	METBK	GI01SUMO-SB001-01-METBKA999	BARPRES		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	CONDSRF		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	LONGIRR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	PRECIPM		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	RELHUMI		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	SPECHUM		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
GI	METBK	GI01SUMO-SB001-01-METBKA999	WINDAVG		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	BARPRES		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	CONDSRF		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	LONGIRR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	PRECIPM		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	RELHUMI		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	SHRTIRR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	SPECHUM		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	TEMPAIR		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	TEMPSRF		\N	\N	\N
GI	METBK	GI01SUMO-SB001-02-METBKA999	WINDAVG		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
GI	PCO2A	GI01SUMO-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
GI	FDCHP	GI01SUMO-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
GI	WAVSS	GI01SUMO-SB001-05-WAVSSA999	WAVSTAT		\N	\N	\N
GI	ZPLSG	GI02HYPM-MP003-01-ZPLSGA999	SONBSCA		\N	\N	\N
GI	FLORD	GI02HYPM-SP001-01-FLORD0999	CHLAFLO		\N	\N	\N
GI	FLORD	GI02HYPM-SP001-01-FLORD0999	FLUBSCT		\N	\N	\N
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2ABS1		\N	\N	\N
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2ABS2		\N	\N	\N
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	CO2THRM		\N	\N	\N
GI	PCO2W	GI02HYPM-SP001-02-PCO2W0999	PCO2WAT		\N	\N	\N
GI	DOSTA	GI02HYPM-SP001-03-DOSTA0999	DOCONCS		\N	\N	\N
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	CONDWAT		\N	\N	\N
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	DENSITY		\N	\N	\N
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	PRACSAL		\N	\N	\N
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	PRESWAT		\N	\N	\N
GI	CTDPF	GI02HYPM-SP001-04-CTDPF0999	TEMPWAT		\N	\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTABSN		\N	\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTATTN		\N	\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTCREF		\N	\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTCSIG		\N	\N	\N
GI	OPTAA	GI02HYPM-SP001-05-OPTAA0999	OPTTEMP		\N	\N	\N
GI	NUTNR	GI02HYPM-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
GI	SPKIR	GI02HYPM-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
GI	SPKIR	GI02HYPM-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
GI	FLORD	GI02HYPM-WF002-01-FLORD0999	CHLAFLO		\N	\N	\N
GI	FLORD	GI02HYPM-WF002-01-FLORD0999	FLUBSCT		\N	\N	\N
GI	DOSTA	GI02HYPM-WF002-03-DOSTA0999	DOCONCS		\N	\N	\N
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	CONDWAT		\N	\N	\N
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	DENSITY		\N	\N	\N
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	PRACSAL		\N	\N	\N
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	PRESWAT		\N	\N	\N
GI	CTDPF	GI02HYPM-WF002-04-CTDPF0999	TEMPWAT		\N	\N	\N
GI	VEL3D	GI02HYPM-WF002-05-VEL3D0999	VELPTTU		\N	\N	\N
GI	FLORD	GI03FLMA-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GI	FLORD	GI03FLMA-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GI	PHSEN	GI03FLMA-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GI	DOSTA	GI03FLMA-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GI	ADCPS	GI03FLMA-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GI	ADCPS	GI03FLMA-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMA-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	FLORD	GI03FLMB-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GI	FLORD	GI03FLMB-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GI	PHSEN	GI03FLMB-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GI	DOSTA	GI03FLMB-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GI	ADCPS	GI03FLMB-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GI	ADCPS	GI03FLMB-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GI	CTDMO	GI03FLMB-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GI	FLORD	GI05MOAS-GL001-01-FLORDM999	CHLAFLO		\N	\N	\N
GI	FLORD	GI05MOAS-GL001-01-FLORDM999	FLUBSCT		\N	\N	\N
GI	DOSTA	GI05MOAS-GL001-02-DOSTAM999	DOCONCS		\N	\N	\N
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	CONDWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	DENSITY		\N	\N	\N
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	PRACSAL		\N	\N	\N
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	PRESWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL001-04-CTDGVM999	TEMPWAT		\N	\N	\N
GI	FLORD	GI05MOAS-GL002-01-FLORDM999	CHLAFLO		\N	\N	\N
GI	FLORD	GI05MOAS-GL002-01-FLORDM999	FLUBSCT		\N	\N	\N
GI	DOSTA	GI05MOAS-GL002-02-DOSTAM999	DOCONCS		\N	\N	\N
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	CONDWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	DENSITY		\N	\N	\N
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	PRACSAL		\N	\N	\N
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	PRESWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL002-04-CTDGVM999	TEMPWAT		\N	\N	\N
GI	FLORD	GI05MOAS-GL003-01-FLORDM999	CHLAFLO		\N	\N	\N
GI	FLORD	GI05MOAS-GL003-01-FLORDM999	FLUBSCT		\N	\N	\N
GI	DOSTA	GI05MOAS-GL003-02-DOSTAM999	DOCONCS		\N	\N	\N
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	CONDWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	DENSITY		\N	\N	\N
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	PRACSAL		\N	\N	\N
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	PRESWAT		\N	\N	\N
GI	CTDGV	GI05MOAS-GL003-04-CTDGVM999	TEMPWAT		\N	\N	\N
GP	ZPLSG	GP02HYPM-MP003-01-ZPLSGA999	SONBSCA		\N	\N	\N
GP	FLORD	GP02HYPM-SP001-01-FLORD0999	CHLAFLO		\N	\N	\N
GP	FLORD	GP02HYPM-SP001-01-FLORD0999	FLUBSCT		\N	\N	\N
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2ABS1		\N	\N	\N
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2ABS2		\N	\N	\N
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	CO2THRM		\N	\N	\N
GP	PCO2W	GP02HYPM-SP001-02-PCO2W0999	PCO2WAT		\N	\N	\N
GP	DOSTA	GP02HYPM-SP001-03-DOSTA0999	DOCONCS		\N	\N	\N
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	CONDWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	DENSITY		\N	\N	\N
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRACSAL		\N	\N	\N
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRESWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	TEMPWAT		\N	\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTABSN		\N	\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTATTN		\N	\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTCREF		\N	\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTCSIG		\N	\N	\N
GP	OPTAA	GP02HYPM-SP001-05-OPTAA0999	OPTTEMP		\N	\N	\N
GP	NUTNR	GP02HYPM-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
GP	SPKIR	GP02HYPM-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
GP	SPKIR	GP02HYPM-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
GP	FLORD	GP02HYPM-WF002-01-FLORD0999	CHLAFLO		\N	\N	\N
GP	FLORD	GP02HYPM-WF002-01-FLORD0999	FLUBSCT		\N	\N	\N
GP	DOSTA	GP02HYPM-WF002-03-DOSTA0999	DOCONCS		\N	\N	\N
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	CONDWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	DENSITY		\N	\N	\N
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRACSAL		\N	\N	\N
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRESWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	TEMPWAT		\N	\N	\N
GP	VEL3D	GP02HYPM-WF002-05-VEL3D0999	VELPTTU		\N	\N	\N
GP	FLORD	GP02HYPM-WF004-01-FLORD0999	CHLAFLO		\N	\N	\N
GP	FLORD	GP02HYPM-WF004-01-FLORD0999	FLUBSCT		\N	\N	\N
GP	DOSTA	GP02HYPM-WF004-03-DOSTA0999	DOCONCS		\N	\N	\N
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	CONDWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	DENSITY		\N	\N	\N
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRACSAL		\N	\N	\N
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRESWAT		\N	\N	\N
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	TEMPWAT		\N	\N	\N
GP	VEL3D	GP02HYPM-WF004-05-VEL3D0999	VELPTTU		\N	\N	\N
GP	FLORD	GP03FLMA-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GP	FLORD	GP03FLMA-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GP	PHSEN	GP03FLMA-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GP	DOSTA	GP03FLMA-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GP	ADCPS	GP03FLMA-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GP	ADCPS	GP03FLMA-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	FLORD	GP03FLMB-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GP	FLORD	GP03FLMB-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GP	PHSEN	GP03FLMB-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GP	DOSTA	GP03FLMB-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GP	ADCPS	GP03FLMB-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GP	ADCPS	GP03FLMB-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GP	FLORD	GP05MOAS-GL001-01-FLORDM999	CHLAFLO		\N	\N	\N
GP	FLORD	GP05MOAS-GL001-01-FLORDM999	FLUBSCT		\N	\N	\N
GP	DOSTA	GP05MOAS-GL001-02-DOSTAM999	DOCONCS		\N	\N	\N
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	CONDWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	DENSITY		\N	\N	\N
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRACSAL		\N	\N	\N
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRESWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	TEMPWAT		\N	\N	\N
GP	FLORD	GP05MOAS-GL002-01-FLORDM999	CHLAFLO		\N	\N	\N
GP	FLORD	GP05MOAS-GL002-01-FLORDM999	FLUBSCT		\N	\N	\N
GP	DOSTA	GP05MOAS-GL002-02-DOSTAM999	DOCONCS		\N	\N	\N
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	CONDWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	DENSITY		\N	\N	\N
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRACSAL		\N	\N	\N
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRESWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	TEMPWAT		\N	\N	\N
GP	FLORD	GP05MOAS-GL003-01-FLORDM999	CHLAFLO		\N	\N	\N
GP	FLORD	GP05MOAS-GL003-01-FLORDM999	FLUBSCT		\N	\N	\N
GP	DOSTA	GP05MOAS-GL003-02-DOSTAM999	DOCONCS		\N	\N	\N
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	CONDWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	DENSITY		\N	\N	\N
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRACSAL		\N	\N	\N
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRESWAT		\N	\N	\N
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	TEMPWAT		\N	\N	\N
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	CONDWAT		\N	\N	\N
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	DENSITY		\N	\N	\N
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	PRACSAL		\N	\N	\N
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	PRESWAT		\N	\N	\N
GS	CTDBP	GS01SUMO-RI002-02-CTDBPF999	TEMPWAT		\N	\N	\N
GS	ADCPS	GS01SUMO-RI002-03-ADCPSN999	ECHOINT		\N	\N	\N
GS	ADCPS	GS01SUMO-RI002-03-ADCPSN999	VELPROF		\N	\N	\N
GS	FLORD	GS01SUMO-RI002-04-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS01SUMO-RI002-04-FLORD0999	FLUBSCT		\N	\N	\N
GS	VELPT	GS01SUMO-RI002-05-VELPTB999	VELPTMN		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	ABSTHRM		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PH434SI		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PH578SI		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-01-PHSENG999	PHWATER		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	ABSTHRM		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PH434SI		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PH578SI		\N	\N	\N
GS	PHSEN	GS01SUMO-RI003-02-PHSENG999	PHWATER		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-03-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-04-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-05-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-06-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-07-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-08-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-09-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-10-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-11-CTDMOQ999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-12-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-13-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	CONDWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	DENSITY		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	PRESWAT		\N	\N	\N
GS	CTDMO	GS01SUMO-RI003-14-CTDMOR999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	METBK	GS01SUMO-SB001-01-METBKA999	BARPRES		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	CONDSRF		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	LONGIRR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	PRECIPM		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	RELHUMI		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	SHRTIRR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	SPECHUM		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	TEMPAIR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	TEMPSRF		\N	\N	\N
GS	METBK	GS01SUMO-SB001-01-METBKA999	WINDAVG		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	BARPRES		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	CONDSRF		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	LONGIRR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	PRECIPM		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	RELHUMI		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	SHRTIRR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	SPECHUM		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	TEMPAIR		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	TEMPSRF		\N	\N	\N
GS	METBK	GS01SUMO-SB001-02-METBKA999	WINDAVG		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	CO2FLUX		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PCO2ATM		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PCO2SSW		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	PRESAIR		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	XCO2ATM		\N	\N	\N
GS	PCO2A	GS01SUMO-SB001-03-PCO2AA999	XCO2SSW		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXHOT		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXMOM		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	FLUXWET		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	MOISTUR		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	MOTFLUX		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	RELHUMI		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	TMPATUR		\N	\N	\N
GS	FDCHP	GS01SUMO-SB001-04-FDCHP0999	WINDTUR		\N	\N	\N
GS	WAVSS	GS01SUMO-SB001-05-WAVSSA999	WAVSTAT		\N	\N	\N
GS	ZPLSG	GS02HYPM-MP003-01-ZPLSGA999	SONBSCA		\N	\N	\N
GS	FLORD	GS02HYPM-SP001-01-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS02HYPM-SP001-01-FLORD0999	FLUBSCT		\N	\N	\N
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2ABS1		\N	\N	\N
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2ABS2		\N	\N	\N
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	CO2THRM		\N	\N	\N
GS	PCO2W	GS02HYPM-SP001-02-PCO2W0999	PCO2WAT		\N	\N	\N
GS	DOSTA	GS02HYPM-SP001-03-DOSTA0999	DOCONCS		\N	\N	\N
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	CONDWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	DENSITY		\N	\N	\N
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	PRACSAL		\N	\N	\N
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	PRESWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-SP001-04-CTDPF0999	TEMPWAT		\N	\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTABSN		\N	\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTATTN		\N	\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTCREF		\N	\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTCSIG		\N	\N	\N
GS	OPTAA	GS02HYPM-SP001-05-OPTAA0999	OPTTEMP		\N	\N	\N
GS	NUTNR	GS02HYPM-SP001-06-NUTNR0999	NITROPT		\N	\N	\N
GS	SPKIR	GS02HYPM-SP001-07-SPKIR0999	OPTATTS		\N	\N	\N
GS	SPKIR	GS02HYPM-SP001-07-SPKIR0999	SPECTIR		\N	\N	\N
GS	FLORD	GS02HYPM-WF002-01-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS02HYPM-WF002-01-FLORD0999	FLUBSCT		\N	\N	\N
GS	DOSTA	GS02HYPM-WF002-03-DOSTA0999	DOCONCS		\N	\N	\N
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	CONDWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	DENSITY		\N	\N	\N
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	PRACSAL		\N	\N	\N
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	PRESWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-WF002-04-CTDPF0999	TEMPWAT		\N	\N	\N
GS	VEL3D	GS02HYPM-WF002-05-VEL3D0999	VELPTTU		\N	\N	\N
GS	FLORD	GS02HYPM-WF004-01-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS02HYPM-WF004-01-FLORD0999	FLUBSCT		\N	\N	\N
GS	DOSTA	GS02HYPM-WF004-03-DOSTA0999	DOCONCS		\N	\N	\N
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	CONDWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	DENSITY		\N	\N	\N
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	PRACSAL		\N	\N	\N
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	PRESWAT		\N	\N	\N
GS	CTDPF	GS02HYPM-WF004-04-CTDPF0999	TEMPWAT		\N	\N	\N
GS	VEL3D	GS02HYPM-WF004-05-VEL3D0999	VELPTTU		\N	\N	\N
GS	FLORD	GS03FLMA-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS03FLMA-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GS	PHSEN	GS03FLMA-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GS	DOSTA	GS03FLMA-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GS	ADCPS	GS03FLMA-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GS	ADCPS	GS03FLMA-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMA-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	FLORD	GS03FLMB-RI001-01-FLORD0999	CHLAFLO		\N	\N	\N
GS	FLORD	GS03FLMB-RI001-01-FLORD0999	FLUBSCT		\N	\N	\N
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	ABSTHRM		\N	\N	\N
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PH434SI		\N	\N	\N
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PH578SI		\N	\N	\N
GS	PHSEN	GS03FLMB-RI001-02-PHSENF999	PHWATER		\N	\N	\N
GS	DOSTA	GS03FLMB-RI001-03-DOSTAD999	DOCONCS		\N	\N	\N
GS	ADCPS	GS03FLMB-RI001-04-ADCPSL999	ECHOINT		\N	\N	\N
GS	ADCPS	GS03FLMB-RI001-04-ADCPSL999	VELPROF		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-06-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-07-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-08-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-09-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-10-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-11-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-12-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-13-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-14-CTDMOG999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-15-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-16-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	CONDWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	DENSITY		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	PRACSAL	N/A	0.0050000000000000001	11	15
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	PRESWAT		\N	\N	\N
GS	CTDMO	GS03FLMB-RI001-17-CTDMOH999	TEMPWAT	degC	0.00200000000000000004	11	15
GS	FLORD	GS05MOAS-GL001-01-FLORDM999	CHLAFLO		\N	\N	\N
GS	FLORD	GS05MOAS-GL001-01-FLORDM999	FLUBSCT		\N	\N	\N
GS	DOSTA	GS05MOAS-GL001-02-DOSTAM999	DOCONCS		\N	\N	\N
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	CONDWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	DENSITY		\N	\N	\N
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	PRACSAL		\N	\N	\N
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	PRESWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL001-04-CTDGVM999	TEMPWAT		\N	\N	\N
GS	FLORD	GS05MOAS-GL002-01-FLORDM999	CHLAFLO		\N	\N	\N
GS	FLORD	GS05MOAS-GL002-01-FLORDM999	FLUBSCT		\N	\N	\N
GS	DOSTA	GS05MOAS-GL002-02-DOSTAM999	DOCONCS		\N	\N	\N
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	CONDWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	DENSITY		\N	\N	\N
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	PRACSAL		\N	\N	\N
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	PRESWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL002-04-CTDGVM999	TEMPWAT		\N	\N	\N
GS	FLORD	GS05MOAS-GL003-01-FLORDM999	CHLAFLO		\N	\N	\N
GS	FLORD	GS05MOAS-GL003-01-FLORDM999	FLUBSCT		\N	\N	\N
GS	DOSTA	GS05MOAS-GL003-02-DOSTAM999	DOCONCS		\N	\N	\N
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	CONDWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	DENSITY		\N	\N	\N
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	PRACSAL		\N	\N	\N
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	PRESWAT		\N	\N	\N
GS	CTDGV	GS05MOAS-GL003-04-CTDGVM999	TEMPWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	CONDWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	DENSITY		\N	\N	\N
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	PRACSAL		\N	\N	\N
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	PRESWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-DP01A-01-CTDPFA104	TEMPWAT		\N	\N	\N
RS	VEL3D	RS01SBVM-DP01A-02-VEL3DA103	VELPTTU		\N	\N	\N
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	CDOMFLO		\N	\N	\N
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	CHLAFLO		\N	\N	\N
RS	FLORT	RS01SBVM-DP01A-04-FLORTA102	FLUBSCT		\N	\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTABSN		\N	\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTATTN		\N	\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTCREF		\N	\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTCSIG		\N	\N	\N
RS	OPTAA	RS01SBVM-DP01A-05-OPTAAA102	OPTTEMP		\N	\N	\N
RS	DOSTA	RS01SBVM-DP01A-06-DOSTAA104	DOCONCS		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IES_HEF		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IES_WPP		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESAHWV		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESHEAT		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESPRES		\N	\N	\N
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESRATT		\N	\N	\N
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	CONDWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	DENSITY		\N	\N	\N
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	PRACSAL		\N	\N	\N
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	PRESWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-LJ01A-06-CTDPFA101	TEMPWAT		\N	\N	\N
RS	DOSTA	RS01SBVM-LJ01A-06-DOSTAA101	DOCONCS		\N	\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTABSN		\N	\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTATTN		\N	\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTCREF		\N	\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTCSIG		\N	\N	\N
RS	OPTAA	RS01SBVM-LJ01A-07-OPTAAA103	OPTTEMP		\N	\N	\N
RS	HYDBB	RS01SBVM-LJ01A-09-HYDBBA102	HYDACPR		\N	\N	\N
RS	HYDBB	RS01SBVM-LJ01A-09-HYDBBA102	HYDFREQ		\N	\N	\N
RS	ADCPT	RS01SBVM-LJ01A-10-ADCPTA101	ECHOINT		\N	\N	\N
RS	ADCPT	RS01SBVM-LJ01A-10-ADCPTA101	VELPROF		\N	\N	\N
RS	VADCP	RS01SBVM-PC01A-05-VADCPA101	ECHOINT		\N	\N	\N
RS	VADCP	RS01SBVM-PC01A-05-VADCPA101	VELTURB		\N	\N	\N
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	CONDWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	DENSITY		\N	\N	\N
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	PRACSAL		\N	\N	\N
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	PRESWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-PC01A-06-CTDPFA103	TEMPWAT		\N	\N	\N
RS	DOSTA	RS01SBVM-PC01A-06-DOSTAA103	DOCONCS		\N	\N	\N
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	ABSTHRM		\N	\N	\N
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PH434SI		\N	\N	\N
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PH578SI		\N	\N	\N
RS	PHSEN	RS01SBVM-PC01A-07-PHSENA102	PHWATER		\N	\N	\N
RS	HYDBB	RS01SBVM-PC01A-09-HYDBBA103	HYDACPR		\N	\N	\N
RS	HYDBB	RS01SBVM-PC01A-09-HYDBBA103	HYDFREQ		\N	\N	\N
RS	FLORD	RS01SBVM-PC01A-10-FLORDA103	CHLAFLO		\N	\N	\N
RS	FLORD	RS01SBVM-PC01A-10-FLORDA103	FLUBSCT		\N	\N	\N
RS	CAMDS	RS01SBVM-PC01A-12-CAMDSA102	CAMSTIL		\N	\N	\N
RS	ADCPT	RS01SBVM-PC01A-13-ADCPTA102	ECHOINT		\N	\N	\N
RS	ADCPT	RS01SBVM-PC01A-13-ADCPTA102	VELPROF		\N	\N	\N
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2ABS1		\N	\N	\N
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2ABS2		\N	\N	\N
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	CO2THRM		\N	\N	\N
RS	PCO2W	RS01SBVM-SF01A-05-PCO2WA101	PCO2WAT		\N	\N	\N
RS	PARAD	RS01SBVM-SF01A-06-PARADA101	OPTPARW		\N	\N	\N
RS	SPKIR	RS01SBVM-SF01A-07-SPKIRA101	OPTATTS		\N	\N	\N
RS	SPKIR	RS01SBVM-SF01A-07-SPKIRA101	SPECTIR		\N	\N	\N
RS	VEL3D	RS01SBVM-SF01A-08-VEL3DA102	VELPTTU		\N	\N	\N
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	CONDWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	DENSITY		\N	\N	\N
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	PRACSAL		\N	\N	\N
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	PRESWAT		\N	\N	\N
RS	CTDPF	RS01SBVM-SF01A-09-CTDPFA102	TEMPWAT		\N	\N	\N
RS	DOFST	RS01SBVM-SF01A-09-DOFSTA102	DOCONCF		\N	\N	\N
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	CDOMFLO		\N	\N	\N
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	CHLAFLO		\N	\N	\N
RS	FLORT	RS01SBVM-SF01A-10-FLORTA101	FLUBSCT		\N	\N	\N
RS	NUTNR	RS01SBVM-SF01A-11-NUTNRA101	NITROPT		\N	\N	\N
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	ABSTHRM		\N	\N	\N
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PH434SI		\N	\N	\N
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PH578SI		\N	\N	\N
RS	PHSEN	RS01SBVM-SF01A-12-PHSENA101	PHWATER		\N	\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTABSN		\N	\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTATTN		\N	\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTCREF		\N	\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTCSIG		\N	\N	\N
RS	OPTAA	RS01SBVM-SF01A-13-OPTAAA101	OPTTEMP		\N	\N	\N
RS	HYDLF	RS01SLBS-MJ01A-05-HYDLFA101	HYDACPR		\N	\N	\N
RS	OBSBB	RS01SLBS-MJ01A-05-OBSBBA101	GRNDACC		\N	\N	\N
RS	OBSBB	RS01SLBS-MJ01A-05-OBSBBA101	GRNDVEL		\N	\N	\N
RS	VEL3D	RS01SLBS-MJ01A-06-VEL3DA101	VELPTTU		\N	\N	\N
RS	PREST	RS01SLBS-MJ01A-07-PRESTA101	SFLPRES		\N	\N	\N
RS	HYDLF	RS01SUM1-LJ01B-05-HYDLFA104	HYDACPR		\N	\N	\N
RS	OBSSP	RS01SUM1-LJ01B-06-OBSSPA102	SGRDVEL		\N	\N	\N
RS	OBSSP	RS01SUM1-LJ01B-07-OBSSPA101	SGRDVEL		\N	\N	\N
RS	OBSSP	RS01SUM1-LJ01B-08-OBSSPA103	SGRDVEL		\N	\N	\N
RS	VEL3D	RS01SUM1-LJ01B-09-VEL3DA104	VELPTTU		\N	\N	\N
RS	PREST	RS01SUM1-LJ01B-10-PRESTA102	SFLPRES		\N	\N	\N
RS	FLOBN	RS01SUM2-MJ01B-00-FLOBNA101	BENTHFL		\N	\N	\N
RS	OSMOI	RS01SUM2-MJ01B-00-OSMOIA101	PHSSAMP		\N	\N	\N
RS	ADCPS	RS01SUM2-MJ01B-05-ADCPSA101	ECHOINT		\N	\N	\N
RS	ADCPS	RS01SUM2-MJ01B-05-ADCPSA101	VELPROF		\N	\N	\N
RS	MASSP	RS01SUM2-MJ01B-07-MASSPA101	MASSPEC		\N	\N	\N
RS	CAMDS	RS01SUM2-MJ01B-08-CAMDSA103	CAMSTIL		\N	\N	\N
RS	CAMHD	RS03ASHS-ID03A-02-CAMHDA301	HDVIDEO		\N	\N	\N
RS	OSMOI	RS03ASHS-MJ03B-00-OSMOIA301	PHSSAMP		\N	\N	\N
RS	TMPSF	RS03ASHS-MJ03B-05-TMPSFA301	TEMPSFL		\N	\N	\N
RS	OBSSP	RS03ASHS-MJ03B-06-OBSSPA305	SGRDVEL		\N	\N	\N
RS	OBSSP	RS03ASHS-MJ03B-08-OBSSPA303	SGRDVEL		\N	\N	\N
RS	HYDLF	RS03AXBS-MJ03A-05-HYDLFA301	HYDACPR		\N	\N	\N
RS	OBSBB	RS03AXBS-MJ03A-05-OBSBBA301	GRNDACC		\N	\N	\N
RS	OBSBB	RS03AXBS-MJ03A-05-OBSBBA301	GRNDVEL		\N	\N	\N
RS	VEL3D	RS03AXBS-MJ03A-06-VEL3DA301	VELPTTU		\N	\N	\N
RS	PREST	RS03AXBS-MJ03A-07-PRESTA301	SFLPRES		\N	\N	\N
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	CONDWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	DENSITY		\N	\N	\N
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	PRACSAL		\N	\N	\N
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	PRESWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-DP03A-01-CTDPFA304	TEMPWAT		\N	\N	\N
RS	VEL3D	RS03AXVM-DP03A-02-VEL3DA303	VELPTTU		\N	\N	\N
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	CDOMFLO		\N	\N	\N
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	CHLAFLO		\N	\N	\N
RS	FLORT	RS03AXVM-DP03A-04-FLORTA302	FLUBSCT		\N	\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTABSN		\N	\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTATTN		\N	\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTCREF		\N	\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTCSIG		\N	\N	\N
RS	OPTAA	RS03AXVM-DP03A-05-OPTAAA302	OPTTEMP		\N	\N	\N
RS	DOSTA	RS03AXVM-DP03A-06-DOSTAA304	DOCONCS		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IES_HEF		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IES_WPP		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESAHWV		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESHEAT		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESPRES		\N	\N	\N
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESRATT		\N	\N	\N
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	CONDWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	DENSITY		\N	\N	\N
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	PRACSAL		\N	\N	\N
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	PRESWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-LJ03A-06-CTDPFA301	TEMPWAT		\N	\N	\N
RS	DOSTA	RS03AXVM-LJ03A-06-DOSTAA301	DOCONCS		\N	\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTABSN		\N	\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTATTN		\N	\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTCREF		\N	\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTCSIG		\N	\N	\N
RS	OPTAA	RS03AXVM-LJ03A-07-OPTAAA303	OPTTEMP		\N	\N	\N
RS	HYDBB	RS03AXVM-LJ03A-09-HYDBBA302	HYDACPR		\N	\N	\N
RS	HYDBB	RS03AXVM-LJ03A-09-HYDBBA302	HYDFREQ		\N	\N	\N
RS	ADCPT	RS03AXVM-LJ03A-10-ADCPTA301	ECHOINT		\N	\N	\N
RS	ADCPT	RS03AXVM-LJ03A-10-ADCPTA301	VELPROF		\N	\N	\N
RS	VADCP	RS03AXVM-PC03A-05-VADCPA301	ECHOINT		\N	\N	\N
RS	VADCP	RS03AXVM-PC03A-05-VADCPA301	VELTURB		\N	\N	\N
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	CONDWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	DENSITY		\N	\N	\N
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	PRACSAL		\N	\N	\N
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	PRESWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-PC03A-06-CTDPFA303	TEMPWAT		\N	\N	\N
RS	DOSTA	RS03AXVM-PC03A-06-DOSTAA303	DOCONCS		\N	\N	\N
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	ABSTHRM		\N	\N	\N
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PH434SI		\N	\N	\N
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PH578SI		\N	\N	\N
RS	PHSEN	RS03AXVM-PC03A-07-PHSENA302	PHWATER		\N	\N	\N
RS	HYDBB	RS03AXVM-PC03A-09-HYDBBA303	HYDACPR		\N	\N	\N
RS	HYDBB	RS03AXVM-PC03A-09-HYDBBA303	HYDFREQ		\N	\N	\N
RS	ADCPT	RS03AXVM-PC03A-10-ADCPTA302	ECHOINT		\N	\N	\N
RS	ADCPT	RS03AXVM-PC03A-10-ADCPTA302	VELPROF		\N	\N	\N
RS	FLORD	RS03AXVM-PC03A-10-FLORDA303	CHLAFLO		\N	\N	\N
RS	FLORD	RS03AXVM-PC03A-10-FLORDA303	FLUBSCT		\N	\N	\N
RS	CAMDS	RS03AXVM-PC03A-12-CAMDSA302	CAMSTIL		\N	\N	\N
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2ABS1		\N	\N	\N
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2ABS2		\N	\N	\N
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	CO2THRM		\N	\N	\N
RS	PCO2W	RS03AXVM-SF03A-05-PCO2WA301	PCO2WAT		\N	\N	\N
RS	PARAD	RS03AXVM-SF03A-06-PARADA301	OPTPARW		\N	\N	\N
RS	SPKIR	RS03AXVM-SF03A-07-SPKIRA301	OPTATTS		\N	\N	\N
RS	SPKIR	RS03AXVM-SF03A-07-SPKIRA301	SPECTIR		\N	\N	\N
RS	VEL3D	RS03AXVM-SF03A-08-VEL3DA302	VELPTTU		\N	\N	\N
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	CONDWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	DENSITY		\N	\N	\N
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	PRACSAL		\N	\N	\N
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	PRESWAT		\N	\N	\N
RS	CTDPF	RS03AXVM-SF03A-09-CTDPFA302	TEMPWAT		\N	\N	\N
RS	DOFST	RS03AXVM-SF03A-09-DOFSTA302	DOCONCF		\N	\N	\N
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	CDOMFLO		\N	\N	\N
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	CHLAFLO		\N	\N	\N
RS	FLORT	RS03AXVM-SF03A-10-FLORTA301	FLUBSCT		\N	\N	\N
RS	NUTNR	RS03AXVM-SF03A-11-NUTNRA301	NITROPT		\N	\N	\N
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	ABSTHRM		\N	\N	\N
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PH434SI		\N	\N	\N
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PH578SI		\N	\N	\N
RS	PHSEN	RS03AXVM-SF03A-12-PHSENA301	PHWATER		\N	\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTABSN		\N	\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTATTN		\N	\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTCREF		\N	\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTCSIG		\N	\N	\N
RS	OPTAA	RS03AXVM-SF03A-13-OPTAAA301	OPTTEMP		\N	\N	\N
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTPRES		\N	\N	\N
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTSFLU		\N	\N	\N
RS	BOTPT	RS03CCAL-MJ03F-05-BOTPTA302	BOTTILT		\N	\N	\N
RS	HYDLF	RS03CCAL-MJ03F-06-HYDLFA305	HYDACPR		\N	\N	\N
RS	OBSBB	RS03CCAL-MJ03F-06-OBSBBA302	GRNDACC		\N	\N	\N
RS	OBSBB	RS03CCAL-MJ03F-06-OBSBBA302	GRNDVEL		\N	\N	\N
RS	HYDLF	RS03ECAL-MJ03E-05-HYDLFA304	HYDACPR		\N	\N	\N
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTPRES		\N	\N	\N
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTSFLU		\N	\N	\N
RS	BOTPT	RS03ECAL-MJ03E-06-BOTPTA303	BOTTILT		\N	\N	\N
RS	OBSSP	RS03ECAL-MJ03E-07-OBSSPA304	SGRDVEL		\N	\N	\N
RS	OBSSP	RS03ECAL-MJ03E-08-OBSSPA301	SGRDVEL		\N	\N	\N
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHHC		\N	\N	\N
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHHS		\N	\N	\N
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHPH		\N	\N	\N
RS	THSPH	RS03INT1-MJ03C-03-THSPHA301	THSPHTE		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHCC		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHEH		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR1		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR2		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHR3		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHTE		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVC		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVO		\N	\N	\N
RS	TRHPH	RS03INT1-MJ03C-04-TRHPHA301	TRHPHVS		\N	\N	\N
RS	OBSSP	RS03INT2-MJ03D-05-OBSSPA302	SGRDVEL		\N	\N	\N
RS	VEL3D	RS03INT2-MJ03D-06-VEL3DA304	VELPTTU		\N	\N	\N
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTPRES		\N	\N	\N
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTSFLU		\N	\N	\N
RS	BOTPT	RS03INT2-MJ03D-07-BOTPTA301	BOTTILT		\N	\N	\N
RS	CAMDS	RS03INT2-MJ03D-08-CAMDSA303	CAMSTIL		\N	\N	\N
RS	MASSP	RS03INT2-MJ03D-09-MASSPA301	MASSPEC		\N	\N	\N
RS	PPSDN	RS03INT2-MJ03D-10-PPSDNA301	DNASAMP		\N	\N	\N
RS	RASFL	RS03INT2-MJ03D-10-RASFLA301	PHSSAMP		\N	\N	\N
RS	RASFL	RS03INT2-MJ03D-10-RASFLA301	TEMPVNT		\N	\N	\N
\.


--
-- Data for Name: streamdefinitions; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY streamdefinitions (scenario, id, comment, org_ids, name, description, pdict_name, available_fields) FROM stdin;
BETA	StreamDef11		MF_3	SeabirdSim_raw demo		raw	
BETA	StreamDef12		MF_3	SeabirdSim_parsed demo		ctd_parsed_param_dict	
BETA	StreamDef13		MF_3	DPD1_out_conductivity_L0 demo		ctd_parsed_param_dict	
BETA	StreamDef14		MF_3	DPD1_out_temp_L0 demo		ctd_parsed_param_dict	
BETA	StreamDef15		MF_3	DPD1_out_pressure_L0 demo		ctd_parsed_param_dict	
BETA	StreamDef16		MF_3	DPD2_out_conductivity_L1 demo		ctd_parsed_param_dict	
BETA	StreamDef17		MF_3	DPD3_out_temp_L1 demo		ctd_parsed_param_dict	
BETA	StreamDef18		MF_3	DPD4_out_pressure_L1 demo		ctd_parsed_param_dict	
BETA	StreamDef19		MF_3	DPD5_out_practical_salinity_L2 demo		ctd_parsed_param_dict	
BETA	StreamDef20		MF_3	DPD6_out_density_L2 demo		ctd_parsed_param_dict	
R2_DEMO	StreamDef21		MF_3	GoogleDT_out		google_dt	
R2_DEMO	StreamDef22		MF_3	Matplotlib graphs		graph_image_param_dict	
BETA	StreamDef23		MF_3	Raw Stream for any instrument		raw	
DEVS	StreamDef24	https://confluence.oceanobservatories.org/display/instruments/PARAD+Driver	MF_3	Parsed Photosynthetically Active Radiation		parad_parsed	
BETA	StreamDef25	https://confluence.oceanobservatories.org/display/instruments/PRESF+Driver	MF_3	PRESF Parsed Tide Measurements	Includes Seafloor Pressure (SFLPRES_L0) from tide measurements	presf_tide_measurement	
BETA	SD_PLATFORM1		MF_3	Platform Engineering Data		platform_eng_parsed	
DEVS	StreamDef26		MF_3	Parsed TRHPH		trhph_parsed	
DEVS	StreamDef28		MF_3	Parsed VELPT		velpt_parsed	
DEVS	StreamDef29		MF_3	Parsed NUTNR		nutnr_parsed	
BETA	StreamDef30		MF_3	Seabird37SMP_raw		raw	
BETA	StreamDef31		MF_3	Seabird37SMP_parsed		ctd_parsed_param_dict	
IDK	SD_IDK_RAW		IDK_ORG	IDK raw stream def		raw	
IDK	SD_IDK_PARSED		IDK_ORG	IDK parsed stream def		UNKNOWN	
BETA	StreamDef32		MF_3	PRESF Operating Status		presf_operating_status	
BETA	StreamDef33		MF_3	PRESF Calibration Coefficients		presf_calibration_coefficients	
BETA	StreamDef34		MF_3	PRESF L1 Seafloor Pressure from Tide Measurements	Seafloor Pressure (SFLPRES_L1) from tide measurements	presf_tide_converted	
BETA	StreamDef35	CTDBP-CDEF	MF_3	CTDBP-C,D,E,F Sample		ctdbp_cdef_sample	
BETA	StreamDef36	CTDBP-CDEF	MF_3	CTDBP-C,D,E,F Operating Status		ctdbp_cdef_status	
BETA	StreamDef37	CTDBP-CDEF	MF_3	CTDBP-C,D,E,F Calibration Coefficients		ctdbp_cdef_calibration_coefficients	
SP_TEST	StreamDef38	CTDBP-NO	MF_3	CTDBP-N,O Sample		ctdbp_no_sample	
SP_TEST	StreamDef39	CTDBP-NO	MF_3	CTDBP-N,O Hardware		ctdbp_no_hardware	
SP_TEST	StreamDef40	CTDBP-NO	MF_3	CTDBP-N,O Calibration Coefficients		ctdbp_no_calibration_coefficients	
SP_TEST	StreamDef41	CTDBP-NO	MF_3	CTDBP-N,O Status		ctdbp_no_status	
SP_TEST	StreamDef42	CTDBP-NO	MF_3	CTDBP-N,O Configuration		ctdbp_no_configuration	
SP_TEST	StreamDef43		MF_3	PARAD-SA Sample		parad_sa_sample	
SP_TEST	StreamDef44		MF_3	TRHPH Sample		trhph_sample	
SP_TEST	StreamDef45		MF_3	TMPSF Sample		tmpsf_sample	
SP_TEST	StreamDef46		MF_3	TMPSF Engineering		tmpsf_engineering	
VEL3D_B	StreamDef47		MF_3	VEL3D-B Sample	includes VELPTTU from Mavs4\n	vel3d_b_sample	
VEL3D_B	StreamDef48		MF_3	VEL3D-B Engineering		vel3d_b_engineering	
BETA	StreamDef49		MF_3	PREST Realtime Data		prest_real_time	
BETA	StreamDef50		MF_3	PREST Reference Oscillator		prest_reference_oscillator	
BETA	StreamDef51		MF_3	PREST Configuration Data		prest_configuration_data	
BETA	StreamDef52		MF_3	PREST Device Status		prest_device_status	
BETA	StreamDef53		MF_3	PREST Event Counter		prest_event_counter	
BETA	StreamDef54		MF_3	PREST Hardware Data		prest_hardware_data	
CW_TEST	StreamDef55		MF_3	NUTNR Sample Data		nutnr_b_sample	
CW_TEST	StreamDef56		MF_3	NUTNR Status Data		nutnr_b_status	
CW_TEST	StreamDef57		MF_3	PCO2W Control Record		pco2w_b_control_record	
CW_TEST	StreamDef58		MF_3	PCO2W Data Record		pco2w_b_data_record	
CW_TEST	StreamDef59		MF_3	PCO2W Immediate Status		pco2w_b_immediate_status	
CW_TEST	StreamDef60		MF_3	PCO2W Regular Status		pco2w_b_regular_status	
CW_TEST	StreamDef61		MF_3	PCO2W Configuration String		pco2w_b_configuration	
CW_TEST	StreamDef62		MF_3	VELPT Hardware Configuration		velpt_hardware_configuration	
CW_TEST	StreamDef63		MF_3	VELPT Head Configuration		velpt_head_configuration	
CW_TEST	StreamDef64		MF_3	VELPT User Configuration		velpt_user_configuration	
CW_TEST	StreamDef65		MF_3	VELPT Velocity Data		velpt_velocity_data	
CW_TEST	StreamDef66		MF_3	VELPT Diagnostics Header		velpt_diagostics_header	
CW_TEST	StreamDef67		MF_3	VELPT Diagnostics Data		velpt_diagnostics_data	
CW_TEST	StreamDef68		MF_3	VEL3D-C,D Hardware Configuration		vel3d_cd_hardware_configuration	
CW_TEST	StreamDef69		MF_3	VEL3D-C,D Head Configuration		vel3d_cd_head_configuration	
CW_TEST	StreamDef70		MF_3	VEL3D-C,D User Configuration		vel3d_cd_user_configuration	
CW_TEST	StreamDef71		MF_3	OPTAA Sample Data		optaa_sample	
CW_TEST	StreamDef72		MF_3	OPTAA Startup Status Message		optaa_status	
CW_TEST	StreamDef73		MF_3	ADCP PD0 Data		adcp_pd0_parsed	
CW_TEST	StreamDef74		MF_3	ADCP PD12 Data		adcp_pd12_parsed	
CW_TEST	StreamDef75		MF_3	ADCP Waves Packet Data		adcp_waves_parsed	
CW_TEST	StreamDef76		MF_3	ADCP Active Compass Calibration		adcp_compass_calibration	
CW_TEST	StreamDef77		MF_3	ADCP System Configuration		adcp_system_configuration	
CW_TEST	StreamDef78		MF_3	VEL3D-C,D Data Header		vel3d_cd_data_header	
CW_TEST	StreamDef79		MF_3	VEL3D-C,D Velocity Data		vel3d_cd_velocity_data	
CW_TEST	StreamDef80		MF_3	VEL3D-C,D System Data		vel3d_cd_system_data	
CW_TEST	StreamDef81		MF_3	VEL3D-C,D Clock Data		vel3d_cd_clock_data	
CW_TEST	StreamDef82		MF_3	VEL3D-C,D Battery Voltage		vel3d_cd_battery_voltage	
CW_TEST	StreamDef83		MF_3	VEL3D-C,D Identification String		vel3d_cd_identification_string	
CW_TEST	StreamDef84		MF_3	VELPT Clock Data		velpt_clock_data	
CW_TEST	StreamDef85		MF_3	VELPT Battery Voltage		velpt_battery_voltage	
CW_TEST	StreamDef86		MF_3	VELPT Identification String		velpt_identification_string	
BETA	StreamDef87		MF_3	PRESF Wave Bursts		presf_wave_burst	
BETA	StreamDef88		MF_3	PRESF Wave Statistics		presf_wave_statistics	
BETA	StreamDef89		MF_3	PREST L1 Seafloor Pressure	Seafloor Pressure (SFLPRES_L1) from PREST	prest_l1_pressure	
SP_TEST	StreamDef90		MF_3	BOTPT NANO Sample	includes BOTPRES_L1	botpt_nano_sample	
SP_TEST	StreamDef91		MF_3	BOTPT LILY Sample	includes BOTTILT_L1	botpt_lily_sample	
SP_TEST	StreamDef92		MF_3	BOTPT IRIS Sample		botpt_iris_sample	
SP_TEST	StreamDef93		MF_3	BOTPT HEAT Sample		botpt_heat_sample	
BETA	StreamDef94		MF_3	CTDBP-C,D,E,F L0		ctdbp_cdef_L0	
BETA	StreamDef95		MF_3	CTDBP-C,D,E,F L1		ctdbp_cdef_L1	
BETA	StreamDef96		MF_3	CTDBP-C,D,E,F L2 pracsal		ctdbp_cdef_L2_pracsal	
BETA	StreamDef97		MF_3	CTDBP-C,D,E,F L2 density		ctdbp_cdef_L2_density	
SP_TEST	StreamDef98		MF_3	VEL3D-B L0	VELPTTU_L0\n	vel3d_b_L0	
SP_TEST	StreamDef99		MF_3	VEL3D-B L1	VELPTTU_L1\n	vel3d_b_L1	
SP_TEST	StreamDef100		MF_3	CTDBP-N,O L0		ctdbp_no_L0	
SP_TEST	StreamDef101		MF_3	CTDBP-N,O L1		ctdbp_no_L1	
SP_TEST	StreamDef102		MF_3	TMPSF_L1	TMPSFL_L1	tmpsf_L1	
TMPSF	StreamDef103		MF_3	TMPSF_SAMPLE		tmpsf_sample	
TMPSF	StreamDef104		MF_3	TMPSF_ENG		tmpsf_engineering	
LC_TEST	StreamDef105		MF_3	Extended CTD LC_TEST		ctd_LC_TEST	
NOSE	SD_NOSE		MF_3	StreamDef for nose tests		raw	
BETA	StreamDef106		MF_3	StreamDef for external CTD+oxy		ctd_external_dataset	
\.


--
-- Data for Name: stuckvaluetests; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY stuckvaluetests (instrument_array, instrument_class, reference_designator, data_products, units, resolution_r, number_n) FROM stdin;
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDPF	GP02HYPM-SP001-04-CTDPF0999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDPF	GP02HYPM-WF002-04-CTDPF0999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDPF	GP02HYPM-WF004-04-CTDPF0999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-06-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-07-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-08-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-09-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-10-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-11-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-12-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-13-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-14-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-15-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-16-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMA-RI001-17-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-06-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-07-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-08-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-09-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-10-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-11-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-12-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-13-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-14-CTDMOG999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-15-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-16-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDMO	GP03FLMB-RI001-17-CTDMOH999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDGV	GP05MOAS-GL001-04-CTDGVM999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDGV	GP05MOAS-GL002-04-CTDGVM999	TEMPWAT	deg C	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRACSAL	n/a	0.000100000000000000005	20
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	PRESWAT	dbar	0.0100000000000000002	20
GP	CTDGV	GP05MOAS-GL003-04-CTDGVM999	TEMPWAT	deg C	0.000100000000000000005	20
\.


--
-- Data for Name: trendtests; Type: TABLE DATA; Schema: public; Owner: luke
--

COPY trendtests (instrument_array, instrument_class, reference_designator, data_products, time_interval, polynomial_order, standard_deviation) FROM stdin;
RS	HPIES	RS01SBVM-LJ01A-05-HPIESA101	IESPRES	90	1	5
RS	HPIES	RS03AXVM-LJ03A-05-HPIESA301	IESPRES	90	1	5
\.


--
-- Name: alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY constraints
    ADD CONSTRAINT constraints_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: coordinatesystems_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY coordinatesystems
    ADD CONSTRAINT coordinatesystems_pkey PRIMARY KEY (id);


--
-- Name: dataprocessdefinitions_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY dataprocessdefinitions
    ADD CONSTRAINT dataprocessdefinitions_pkey PRIMARY KEY (id);


--
-- Name: dataprocesses_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY dataprocesses
    ADD CONSTRAINT dataprocesses_pkey PRIMARY KEY (id);


--
-- Name: dataproductlinks_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY dataproductlinks
    ADD CONSTRAINT dataproductlinks_pkey PRIMARY KEY (id);


--
-- Name: dataproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY dataproducts
    ADD CONSTRAINT dataproducts_pkey PRIMARY KEY (id);


--
-- Name: deployments_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY deployments
    ADD CONSTRAINT deployments_pkey PRIMARY KEY (id);


--
-- Name: externaldataproviders_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY externaldataproviders
    ADD CONSTRAINT externaldataproviders_pkey PRIMARY KEY (id);


--
-- Name: externaldatasetagentinstances_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY externaldatasetagentinstances
    ADD CONSTRAINT externaldatasetagentinstances_pkey PRIMARY KEY (id);


--
-- Name: externaldatasetagents_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY externaldatasetagents
    ADD CONSTRAINT externaldatasetagents_pkey PRIMARY KEY (id);


--
-- Name: externaldatasetmodels_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY externaldatasetmodels
    ADD CONSTRAINT externaldatasetmodels_pkey PRIMARY KEY (id);


--
-- Name: externaldatasets_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY externaldatasets
    ADD CONSTRAINT externaldatasets_pkey PRIMARY KEY (id);


--
-- Name: grts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY grts
    ADD CONSTRAINT grts_pkey PRIMARY KEY (reference_designator, data_products);


--
-- Name: instrumentagentinstances_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY instrumentagentinstances
    ADD CONSTRAINT instrumentagentinstances_pkey PRIMARY KEY (scenario, id);


--
-- Name: instrumentagents_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY instrumentagents
    ADD CONSTRAINT instrumentagents_pkey PRIMARY KEY (id);


--
-- Name: instrumentdevices_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY instrumentdevices
    ADD CONSTRAINT instrumentdevices_pkey PRIMARY KEY (id);


--
-- Name: instrumentmodels_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY instrumentmodels
    ADD CONSTRAINT instrumentmodels_pkey PRIMARY KEY (id);


--
-- Name: instrumentsites_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY instrumentsites
    ADD CONSTRAINT instrumentsites_pkey PRIMARY KEY (id);


--
-- Name: parametercontexts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY parametercontexts
    ADD CONSTRAINT parametercontexts_pkey PRIMARY KEY (id);


--
-- Name: parameterdictionaries_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY parameterdictionaries
    ADD CONSTRAINT parameterdictionaries_pkey PRIMARY KEY (id);


--
-- Name: parameterfunctions_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY parameterfunctions
    ADD CONSTRAINT parameterfunctions_pkey PRIMARY KEY (id);


--
-- Name: parameterrelations_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY parameterrelations
    ADD CONSTRAINT parameterrelations_pkey PRIMARY KEY (parameter_id, pdict_id);


--
-- Name: safdataproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY safdataproducts
    ADD CONSTRAINT safdataproducts_pkey PRIMARY KEY (id);


--
-- Name: safinstrumentdevices_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY safinstrumentdevices
    ADD CONSTRAINT safinstrumentdevices_pkey PRIMARY KEY (id);


--
-- Name: spiketests_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY spiketests
    ADD CONSTRAINT spiketests_pkey PRIMARY KEY (reference_designator, data_products);


--
-- Name: streamdefinitions_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY streamdefinitions
    ADD CONSTRAINT streamdefinitions_pkey PRIMARY KEY (id);


--
-- Name: stuckvaluetests_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY stuckvaluetests
    ADD CONSTRAINT stuckvaluetests_pkey PRIMARY KEY (reference_designator, data_products);


--
-- Name: trendtests_pkey; Type: CONSTRAINT; Schema: public; Owner: luke; Tablespace: 
--

ALTER TABLE ONLY trendtests
    ADD CONSTRAINT trendtests_pkey PRIMARY KEY (reference_designator, data_products);


--
-- Name: public; Type: ACL; Schema: -; Owner: luke
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM luke;
GRANT ALL ON SCHEMA public TO luke;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

