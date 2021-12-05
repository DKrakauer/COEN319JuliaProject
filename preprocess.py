#!/usr/bin/python3
"""
Preprocess the dataset into operable graph representations
Author: Colin Rioux <crioux@scu.edu>
"""

import csv
import glob
import os

def find_files(dir):
    return glob.glob(dir + "/**/*.csv", recursive=True)

print("Preprocessing files in ./data")
print("Outputs will be in the root of ./data")
for file_path in find_files("./data"):
    print(file_path)

    fields_lst = []
    with open(file_path, "r") as csv_file:
        csv_reader = csv.reader(csv_file)

        fields_lst = next(csv_reader)
        # Leverage python"s dictionary for O(1) fetch given field id
        fields_dict = {key:val for val,key in enumerate(fields_lst)}

        airport_group_idx = fields_dict["AirportGroup"]
        origin_idx = fields_dict["Origin"]
        dest_idx = fields_dict["Dest"]
        fare_idx = fields_dict["MktFare"]

        fares = dict()
        nodes = set()
        for row in csv_reader:
            airport_group = row[airport_group_idx]

            # Convert connecting flights into direct flights
            if airport_group.count(":") > 1:
                airports = airport_group.split(":")
                airport_group = airports[0] + ":" + airports[len(airports) - 1]

            fare = row[fare_idx]
            # Skip if fare is less than $40
            if float(fare) < 40:
                continue

            # Take minimum fare for the route
            if airport_group in fares:
                fares[airport_group] = min(fares[airport_group], float(fare))
            else:
                fares[airport_group] = float(fare)

            # Add origin/dest to node set if doesn"t already exist
            nodes.add(row[origin_idx])
            nodes.add(row[dest_idx])

        print("n edges=", len(fares))
        print("n nodes=", len(nodes))

        # Build graph and store
        with open("./data/" + os.path.basename(file_path) + ".graph", "w") as graph_file:
            # Write num nodes to top of file
            graph_file.write(str(len(nodes)) + "\n")
            
            for src in nodes:
                row = []
                for dest in nodes:
                    fare_idx = src + ":" + dest
                    if fare_idx in fares:
                        row.append(str(fares[fare_idx]))
                    else:
                        row.append("inf")
                row_str = " ".join(row) + "\n"
                graph_file.write(row_str)

