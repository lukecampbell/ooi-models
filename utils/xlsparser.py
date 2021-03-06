#!/usr/bin/env python

"""Parsing of XLS files"""

__author__ = 'Michael Meisinger'

import csv
import StringIO
import xlrd
import re
import cjson


class XLSParser(object):
    """Class that transforms an XLS file into a dict of csv files (str)"""

    @classmethod
    def extract_csvs(cls, file_content):
        sheets = cls.extract_worksheets(file_content)
        csv_docs = {}
        for sheet_name, sheet in sheets.iteritems():
            csv_doc = cls.dumps_csv(sheet)
            if isinstance(sheet_name, unicode):
                sheet_name = sheet_name.encode('ascii', 'ignore')
            csv_docs[sheet_name] = csv_doc.splitlines()
        return csv_docs

    @classmethod
    def extract_worksheets(cls, file_content):
        book = xlrd.open_workbook(file_contents=file_content)
        sheets = {}
        formatter = lambda(t,v): cls.format_excelval(book,t,v,False)

        for sheet_name in book.sheet_names():
            raw_sheet = book.sheet_by_name(sheet_name)
            data = []
            for row in range(raw_sheet.nrows):
                (types, values) = (raw_sheet.row_types(row), raw_sheet.row_values(row))
                data.append(map(formatter, zip(types, values)))
            sheets[sheet_name] = data
        return sheets

    @classmethod
    def dumps_csv(cls, sheet):
        stream = StringIO.StringIO()
        csvout = csv.writer(stream, delimiter=',', doublequote=False, escapechar='\\')
        csvout.writerows( map(cls.utf8ize, sheet) )
        csv_doc = stream.getvalue()
        stream.close()
        return csv_doc

    @classmethod
    def dumps_csv_list(cls, sheet):
        cvs_lines = []
        for line in sheet:
            stream = StringIO.StringIO()
            csvout = csv.writer(stream, delimiter=',', doublequote=False, escapechar='\\')
            csvout.writerow(cls.utf8ize(line))
            csv_doc = stream.getvalue()
            stream.close()
            cvs_lines.append(csv_doc)
        return cvs_lines

    @classmethod
    def tupledate_to_isodate(cls, tupledate):
        (y,m,d, hh,mm,ss) = tupledate
        nonzero = lambda n: n!=0
        date = "%04d-%02d-%02d"  % (y,m,d)    if filter(nonzero, (y,m,d))                else ''
        time = "T%02d:%02d:%02d" % (hh,mm,ss) if filter(nonzero, (hh,mm,ss)) or not date else ''
        return date+time

    @classmethod
    def format_excelval(cls, book, type, value, wanttupledate):
        if   type == 2: # TEXT
            if value == int(value): value = int(value)
        elif type == 3: # NUMBER
            datetuple = xlrd.xldate_as_tuple(value, book.datemode)
            value = datetuple if wanttupledate else cls.tupledate_to_isodate(datetuple)
        elif type == 5: # ERROR
            value = xlrd.error_text_from_code[value]
        if isinstance(value, basestring):
            value = re.sub(r'\n','',value)
            stripped = value.strip()
            if stripped.startswith('[') and stripped.endswith(']'): #Maybe a list?
                try:
                    tmp = cjson.decode(value)
                    value = ','.join(tmp)
                except:
                    return value
        return value

    @classmethod
    def utf8ize(cls, l):
        return [unicode(s).encode("utf-8") if hasattr(s,'encode') else s for s in l]


