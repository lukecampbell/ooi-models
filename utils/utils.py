#!/usr/bin/env python
import requests
from xlsparser import XLSParser

def xls_parse_from_url(url):
    response = requests.get(url)
    xls_doc = None
    if response.status_code == 200:
        xls_doc = response.content
    else:
        raise IOError('Error fetching URL %s' % url)

    csv_docs = XLSParser().extract_csvs(xls_doc)

    return csv_docs


