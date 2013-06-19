#!/usr/bin/env python
import requests
from xlsparser import XLSParser
import os

def xls_parse_from_url(url):
    if url.startswith('http'):
        response = requests.get(url)
        xls_doc = None
        if response.status_code == 200:
            xls_doc = response.content
        else:
            raise IOError('Error fetching URL %s' % url)
    elif os.path.exists(url):
        with open(url) as f:
            xls_doc = f.read()
    else:
        raise IOError("Couldn't parse and load %s" % url)

    csv_docs = XLSParser.extract_csvs(xls_doc)

    return csv_docs


