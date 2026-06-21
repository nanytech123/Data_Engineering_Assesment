# Data Engineer Assessment — Nandini Bawane

## Overview
This repo contains my submission for the Data Engineer Fresher assessment:
PostgreSQL setup, SQL querying, and a Python data cleaning script.

## Tech Stack
- PostgreSQL 
- Python (pandas)
- Jupyter Notebook

## Project Structure
Sql/            -> schema.sql, Queries.sql
python_script   -> Jupyter notebook with data cleaning logic
Data/           -> raw CSVs (customers.csv, orders.csv, Products.csv)
Cleaned_csv/    -> cleaned output (customers_cleaned.csv)
README.md       -> this file

## 1. Database Setup

1. Install PostgreSQL locally and ensure the server is running.
2. Create a database:
   createdb song_db
3. Run the schema script to create tables:
   psql -d song_db -f Sql/schema.sql

## 2. Loading Data

Load the sample CSVs into the tables:
psql -d song_db -c "\copy customers FROM 'Data/customers.csv' DELIMITER ',' CSV HEADER"
psql -d song_db -c "\copy orders FROM 'Data/orders.csv' DELIMITER ',' CSV HEADER"
psql -d song_db -c "\copy products FROM 'Data/Products.csv' DELIMITER ',' CSV HEADER"

Verify row counts match the source CSVs:
psql -d song_db -c "SELECT COUNT(*) FROM customers;"

## 3. Running SQL Queries

All queries (joins, aggregations, window function) are in Sql/Queries.sql. Run them with:
psql -d song_db -f Sql/Queries.sql

## 4. Running the Python Cleaning Script

1. Install dependencies:
   pip install pandas psycopg2-binary jupyter
2. Open and run the notebook:
   jupyter notebook python_script.ipynb
   Run all cells top to bottom.
3. Output: a cleaned CSV in Cleaned_csv/customers_cleaned.csv and a console/cell output summary of rows before/after, duplicates removed, and nulls removed.
