#!/bin/sh

# Data Retrieval
# Download
wget https://offshoreleaks-data.icij.org/offshoreleaks/csv/csv_paradise_papers.2017-11-17.zip
# Extract to import directory.
tar -xzvf csv_paradise_papers.2017-11-17.zip -C import

# Data Preparation
# Nodes
for NODES_FILE in import/*.nodes.*.csv
do
    # Header Rows
    head -n 1 $NODES_FILE |
        sed "s/labels(n)/\:LABEL/" |
        sed "s/n\.node_id/node_id\:ID/" |
        sed "s/\"//g" |
        sed "s/n\.//g" > $NODES_FILE.refined
    # Detail Rows
    tail -n +2 $NODES_FILE |
        sed "s/\[\"\"//" |
        sed "s/\"\"\]//" >> $NODES_FILE.refined
done

# Relationships
for EDGES_FILE in import/*.edges.csv
do
    # Header Rows
    head -n 1 $EDGES_FILE |
        sed "s/node_1/\:START_ID/" |
        sed "s/node_2/\:END_ID/" |
        sed "s/rel_type/\:TYPE/" |
        sed "s/\"//g" |
        sed "s/r\.//g" > $EDGES_FILE.refined
    # Detail Rows
    tail -n +2 $EDGES_FILE >> $EDGES_FILE.refined
done

# Import
# Clean graph.db directory.
rm -d -r data/databases/graph.db
mkdir data/databases/graph.db
# Import
bin/neo4j-admin import \
    --nodes import/paradise_papers.nodes.address.csv.refined \
    --nodes import/paradise_papers.nodes.entity.csv.refined \
    --nodes import/paradise_papers.nodes.intermediary.csv.refined \
    --nodes import/paradise_papers.nodes.officer.csv.refined \
    --nodes import/paradise_papers.nodes.other.csv.refined \
    --relationships import/paradise_papers.edges.csv.refined \
    --quote "\""

# Clean import directory
rm import/*
