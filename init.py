from model.csv_model import CSVModel
from utils.utils import xls_parse_from_url
from sqlalchemy import create_engine
from sqlalchemy.exc import ArgumentError
from sqlalchemy.orm import sessionmaker
from logging import getLogger
log = getLogger(__name__)
engine = create_engine('postgresql+psycopg2://luke@localhost/work')
Session = sessionmaker()
Session.configure(bind=engine)
session = Session()
MASTER_DOC = "https://docs.google.com/spreadsheet/pub?key=0AttCeOvLP6XMdG82NHZfSEJJOGdQTkgzb05aRjkzMEE&output=xls"


def initialize_database(path=MASTER_DOC):

    csv_docs = xls_parse_from_url(path)
    log.info('Downloaded %s' % path)
    model_instances = {}
    for k,doc in csv_docs.iteritems():
        if k in ['IDMap', 'AllScenarios']:
            continue
        try:
            csv_model = CSVModel(doc).create_model(k)
            model_instances[k] = csv_model.from_csv(doc)
        except ArgumentError:
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

if __name__ == '__main__':
    initialize_database()

