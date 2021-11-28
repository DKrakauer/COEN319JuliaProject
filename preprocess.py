#!/usr/bin/python
"""
Preprocess the dataset into operable graph representations
Author: Colin Rioux <crioux@scu.edu>
"""

import csv
import glob

def find_files(dir):
    return glob.glob(dir + '/**/*.csv', recursive=True)

for file_path in find_files('./data'):
    print(file_path)

    fields_lst = []
    with open(file_path, 'r') as csv_file:
        csv_reader = csv.reader(csv_file)

        fields_lst = next(csv_reader)
        # Leverage python's dictionary for O(1) fetch given field id
        fields_dict = {key:val for val,key in enumerate(fields_lst)}

        airport_group_idx = fields_dict['AirportGroup']
        for row in csv_reader:
            airport_group = row[airport_group_idx]
            
