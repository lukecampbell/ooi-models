from model.csv_model import CSVModel, Base
from model.views import initialize_view, drop_view, initialize_saf_instrument_view, drop_saf_instrument_view, drop_dp_view, initialize_dp_view
from model.views import drop_qc_view, initialize_qc_view
from utils.utils import xls_parse_from_url
from sqlalchemy import create_engine
from sqlalchemy.exc import ArgumentError
from sqlalchemy.orm import sessionmaker
from utils.log import log
import os
import sys
import signal
#conn_string = 'sqlite:///:memory:'
conn_string = 'postgresql+psycopg2://luke@localhost/work'

engine = create_engine(conn_string)
Session = sessionmaker()
Session.configure(bind=engine)
session = Session()
MASTER_DOC = "https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE&output=xls"


# Global for models
models = {}
child_pids = []


def initialize_database(path=MASTER_DOC):
    global models 

    CSVModel.clear()

    csv_docs = xls_parse_from_url(path)
    log.info('Downloaded %s' % path)
    model_instances = {}
    for k,doc in csv_docs.iteritems():
        if k in ['IDMap', 'AllScenarios']:
            continue
        try:
            csv_model = CSVModel(doc).create_model(k)
            models[csv_model.__name__] = csv_model
            model_instances[k] = csv_model.from_csv(doc)
            log.info("Parsed sheet %s" % k)
        except ArgumentError:
            log.exception("Couldn't load %s" % k)
            continue
        except TypeError:
            log.exception("Couldn't load %s" % k)
            continue
    # We want a late load so that the order is preserved and deterministic
    from model.refs.parameter_ref import ParameterRef

    log.info('Dropping view')
    drop_dp_view(engine)
    drop_view(engine)
    CSVModel.drop_all(engine)
    CSVModel.create_all(engine)
    log.info('Creating view')
    initialize_view(engine)
    initialize_dp_view(engine)

    for k,v in model_instances.iteritems():
        for inst in v:
            session.add(inst)
            try:
                session.commit()
            except Exception as e:
                session.rollback()
                from traceback import print_exc
                print_exc(e)
        log.info("Initialized %s" % k)
    log.info("Initializing Parameter References and Associations")
    pdicts = [(pdict.scenario, pdict.id, pdict.parameter_ids) for pdict in model_instances['ParameterDictionary']]
    log.info("Loaded ParameterDictionary into memory")
    params = {p.id : p.scenario for p in model_instances['ParameterDefs']}
    log.info("Loaded Parameters into Memory")
    if engine.name == 'postgresql':
        speedy_parameter_load(pdicts, params)
    else:
        linear_parameter_load(pdicts, params, session)

def linear_parameter_load(pdicts, params, session):
    from model.refs.parameter_ref import ParameterRef
    for pdict_scenario, pdict_id, pdict_parameter_ids in pdicts:
        param_ids = pdict_parameter_ids.replace(' ', '') # strip white space,
        param_ids = param_ids.split(',')
        for param_id in param_ids:
            param_scenario = params[param_id]
            pref = ParameterRef(pdict_id=pdict_id, pdict_scenario=pdict_scenario, param_id=param_id, param_scenario=param_scenario)
            session.add(pref)
            try:
                session.commit()
            except:
                log.exception("Couldn't load reference")
                session.rollback()

def speedy_parameter_load(pdicts, params):
    global child_pids
    assert len(pdicts) > 4
    signal.signal(signal.SIGINT, signal_handler)
    for i in xrange(4):
        sample = pdicts[i*len(pdicts)/4 : (i+1)*len(pdicts)/4]
        cpid = os.fork()
        if cpid:
            child_pids.append(cpid)
        else:
            log.info('Child Process Launched')
            engine = create_engine(conn_string)
            Session = sessionmaker()
            Session.configure(bind=engine)
            session = Session()
            linear_parameter_load(sample, params, session)
            session.close()
            sys.exit(0)
    for i,cpid in enumerate(child_pids):
        os.waitpid(cpid, 0)
        log.info('Child %s Finished' % i)

    child_pids = []


def initialize_saf(database='data/objects_20131126_112742.xls'):
    global models

    CSVModel.clear()

    csv_docs = xls_parse_from_url(database)
    log.info('Loaded %s' % database)

    model_instances = {}
    for k,doc in csv_docs.iteritems():
        try:
            csv_model = CSVModel(doc).create_model('saf_%s' % k)
            models[csv_model.__name__] = csv_model
            model_instances[csv_model.__name__] = csv_model.from_csv(doc)
            log.info("Parsed sheet %s" % k)
        except ArgumentError:
            log.exception("Couldn't load %s" % k)
            continue
        except TypeError:
            log.exception("Couldn't load %s" % k)
            continue
    from model.refs.saf_instrument_ref import SAFInstrumentRef

    log.info("Dropping SAF Views")
    drop_saf_instrument_view(engine)
    drop_qc_view(engine)
    log.info("Dropping SAF Models")
    CSVModel.drop_all(engine)
    log.info("Creating SAF Models")
    CSVModel.create_all(engine)
    log.info("Creating SAF Views")
    initialize_saf_instrument_view(engine)
    initialize_qc_view(engine)
    
    for k,v in model_instances.iteritems():
        for inst in v:
            session.add(inst)
            try:
                session.commit()
            except Exception as e:
                session.rollback()
                from traceback import print_exc
                print_exc(e)
                raise
        log.info('Initialized %s' % k)
    log.info('Initialized SAF Data instances')
    instruments = model_instances['saf_instrument']
    instruments = [(i.id, i.data_product_list) for i in instruments]
    log.info("Loaded instruments into memory")
    if engine.name == 'postgresql':
        speedy_saf_ref(instruments)
    else:
        linear_saf_ref(instruments, session)
    


def linear_saf_ref(instances,session):
    from model.refs.saf_instrument_ref import SAFInstrumentRef
    for i_id, dp_ids in instances:
        dp_ids.replace(' ', '')
        dp_ids = dp_ids.split(',')
        for dp_id in dp_ids:
            inst_ref = SAFInstrumentRef(instrument_id=i_id, data_product_id=dp_id)
            session.add(inst_ref)
            try:
                session.commit()
            except:
                log.exception("Couldn't load reference")
                session.rollback()

def speedy_saf_ref(instances):
    global child_pids
    assert len(instances) > 4
    signal.signal(signal.SIGINT, signal_handler)
    for i in xrange(4): # Spawn four children
        sample = instances[i*len(instances)/4 : (i+1)*len(instances)/4]
        cpid = os.fork()
        if cpid:
            child_pids.append(cpid)
        else:
            log.info('Child Process Launched')
            engine = create_engine(conn_string)
            Session = sessionmaker()
            Session.configure(bind=engine)
            session = Session()
            linear_saf_ref(sample, session)
            session.close()
            sys.exit(0)

    for i,cpid in enumerate(child_pids):
        os.waitpid(cpid,0)
        log.info('Child %s Finished' % i)
    child_pids = []


def signal_handler(s, frame):
    global child_pids
    for c_pid in child_pids:
        os.kill(c_pid, signal.SIGINT)
    sys.exit(0)

if __name__ == '__main__':
    initialize_database()
    initialize_saf()
    session.close()

