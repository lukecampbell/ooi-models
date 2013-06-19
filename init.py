from model.csv_model import CSVModel, Base
from model.views import initialize_view, drop_view
from utils.utils import xls_parse_from_url
from sqlalchemy import create_engine
from sqlalchemy.exc import ArgumentError
from sqlalchemy.orm import sessionmaker
from utils.log import log
engine = create_engine('postgresql+psycopg2://luke@localhost/work')
Session = sessionmaker()
Session.configure(bind=engine)
session = Session()
MASTER_DOC = "https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE&output=xls"


# Global for models
models = {}


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
    from model.refs import ParameterRef

    log.info('Dropping view')
    drop_view(engine)
    CSVModel.drop_all(engine)
    CSVModel.create_all(engine)
    log.info('Creating view')
    initialize_view(engine)

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
    pdicts = session.query(models['ParameterDictionary']).all()
    log.info("Loaded ParameterDictionary into memory")
    params = {p.id: p for p in session.query(models['ParameterDefs']).all()}
    log.info("Loaded Parameters into Memory")
    for pdict in pdicts:
        pids = pdict.parameter_ids.replace(' ', '') # strip white space
        pids = pids.split(',')
        for pid in pids:
            if pid not in params:
                log.error("Couldn't find %s in parameters" % pid)
                continue
            parameter = params[pid]
            pref = ParameterRef(pdict_id=pdict.id, pdict_scenario=pdict.scenario, param_id=parameter.id, param_scenario=parameter.scenario)
            session.add(pref)
            try:
                session.commit()
            except:
                log.exception("Couldn't load reference")
                session.rollback()

def initialize_saf(database='data/objects_20130619_152029.xls'):

    global models

    CSVModel.clear()

    csv_docs = xls_parse_from_url(database)
    log.info('Loaded %s' % database)

    model_instances = {}
    for k,doc in csv_docs.iteritems():
        try:
            csv_model = CSVModel(doc).create_model('saf_%s' % k)
            models[csv_model.__name__] = csv_model
            model_instances[k] = csv_model.from_csv(doc)
            log.info("Parsed sheet %s" % k)
        except ArgumentError:
            log.exception("Couldn't load %s" % k)
            continue
        except TypeError:
            log.exception("Couldn't load %s" % k)
            continue

    CSVModel.drop_all(engine)
    CSVModel.create_all(engine)
    
    for k,v in model_instances.iteritems():
        for inst in v:
            session.add(inst)
            try:
                session.commit()
            except Exception as e:
                session.rollback()
                from traceback import print_exc
                print_exc(e)
        log.info('Initialized %s' % k)
    log.info('Initialized SAF Data instances')

if __name__ == '__main__':
    #initialize_database()
    initialize_saf()
    session.close()

