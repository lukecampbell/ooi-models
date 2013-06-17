
from utils.pluralize import pluralize
from sqlalchemy.ext.declarative import declarative_base
from csv import DictReader
import os
import re
Base = declarative_base()

from sqlalchemy import Column, Integer, String
class CSVModel:
    csv=None

    def __init__(self, csv):
        if isinstance(csv, list):
            self.csv = csv
        elif isinstance(csv, basestring):
            if os.path.exists(csv):
                with open(csv) as f:
                    buf = f.read()
                self.csv = buf.split('\n')
            elif csv.startswith('http') and csv.endswith('csv'):
                response = requests.get(csv)
                if response.status_code == 200:
                    self.csv = response.content.split('\n')
                else:
                    raise IOError('Failed to download %s' % csv)
        else:
            raise IOError('Unable to parse CSV')

    def create_model(self, name):
        columns = self.csv[0].split(',')
        
        type_map = {'extend_existing':True}
        if name.endswith('s'):
            type_map['__tablename__'] = name.lower()
        else:
            type_map['__tablename__'] = pluralize(name).lower()
        for column in columns:
            if column.lower() == 'id':
                type_map['id'] = Column(String, primary_key=True)
            elif column.lower() == 'scenario':
                type_map['scenario'] = Column(String, primary_key=True)
            else:
                col = re.sub(r'[/ ]', '_', column.lower())
                type_map[col] = Column(String)

        
        def from_csv(cls,csv):
            dr = DictReader(self.csv, delimiter=',')
            retval = []
            for row in dr:
                if 'ID' in row and not row['ID']:
                    continue
                if 'Scenario' in row:
                    if row['Scenario'].lower() == 'skip':
                        continue
                    if row['Scenario'].lower() == 'void':
                        continue
                    if row['Scenario'].lower() == 'null':
                        continue
                    if 'stop' in row['Scenario'].lower():
                        continue
                    if 'nose' in row['Scenario'].lower():
                        continue
                    if 'doc' in row['Scenario'].lower():
                        continue
                init_map = {}
                for k,v in row.iteritems():
                    if k is None:
                        continue
                    name = re.sub(r'[/ ]', '_', k.lower())
                    init_map[name] = v
                retval.append(cls(**init_map))
            return retval
        type_map['from_csv'] = classmethod(from_csv)

        model = type(name, (Base,), dict(**type_map))

        return model

    @classmethod
    def create_all(cls,engine):
        Base.metadata.create_all(engine)

    @classmethod
    def drop_all(cls, engine):
        Base.metadata.drop_all(engine)
