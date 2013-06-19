#!/usr/bin/env python
from model.csv_model import Base, BaseModel
from sqlalchemy import Column, Integer, String, ForeignKey, ForeignKeyConstraint

class ParameterRef(Base,BaseModel):
    __tablename__ = 'parameterrefs'
    id = Column(Integer, primary_key=True)
    pdict_scenario = Column(String)
    pdict_id = Column(String)
    param_scenario = Column(String)
    param_id = Column(String)

    __table_args__ = (ForeignKeyConstraint(['pdict_scenario', 'pdict_id'], ['parameterdictionaries.scenario', 'parameterdictionaries.id']), 
            ForeignKeyConstraint(['param_scenario', 'param_id'], ['parameterdefs.scenario', 'parameterdefs.id']),
            {})

