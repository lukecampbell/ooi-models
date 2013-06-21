#!/usr/bin/env python
from model.csv_model import Base, BaseModel
from sqlalchemy import Column, Integer, String, ForeignKey, ForeignKeyConstraint

class SAFInstrumentRef(Base,BaseModel):
    __tablename__ = 'saf_instrument_refs'
    id = Column(Integer, primary_key=True)
    instrument_id = Column(String, ForeignKey('saf_instruments.id'))
    data_product_id = Column(String, ForeignKey('saf_data_products.id'))

