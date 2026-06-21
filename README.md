# Data Engineering Assessment

## Project Overview

This project demonstrates:

* PostgreSQL database creation
* CSV data loading into PostgreSQL
* SQL JOINs and Aggregations
* Window Functions
* Python Data Cleaning
* Git & GitHub Version Control

---

## Project Structure

Data/
│
├── customers.csv
├── orders.csv
└── Products.csv

Cleaned_csv/
│
└── customers_cleaned.csv

Sql/
│
├── schema.sql
└── Queries.sql

python_script.ipynb
README.md

---

## Technologies Used

* PostgreSQL
* Python
* Pandas
* Git
* GitHub

---

## Database Setup

### Create Database

CREATE DATABASE ecommerce_db;

### Create Tables

Run:

psql -d ecommerce_db -f Sql/schema.sql

This creates:

* customers
* orders
* products

---

## Load CSV Data

Load the CSVs directly using psql:

psql -d ecommerce_db -c "\copy customers FROM 'Data/customers.csv' DELIMITER ',' CSV HEADER"
psql -d ecommerce_db -c "\copy orders FROM 'Data/orders.csv' DELIMITER ',' CSV HEADER"
psql -d ecommerce_db -c "\copy products FROM 'Data/Products.csv' DELIMITER ',' CSV HEADER"

---

## Verify Data Load

Run:

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM products;

The row counts should match the CSV files.

---

## SQL Analysis

Run:

psql -d ecommerce_db -f Sql/Queries.sql

Queries included:

* JOIN Operations
* Aggregation Queries
* Top Products / Most Played Analysis
* Window Functions (e.g. RANK / ROW_NUMBER)

---

## Data Cleaning

1. Install dependencies:

pip install pandas

2. Open and run the notebook:

jupyter notebook python_script.ipynb

Run all cells top to bottom. Make sure Jupyter is launched from the project root folder so relative paths resolve correctly.

The script:

* Removes duplicate rows
* Removes rows with missing values in critical fields
* Standardizes text formatting (name/city casing, lowercase email)
* Creates a cleaned CSV file

Output:

Cleaned_csv/customers_cleaned.csv

---

## Expected Output

After running all scripts:

* PostgreSQL tables are created successfully
* CSV data is loaded successfully
* SQL queries execute successfully
* Cleaned CSV file is generated
* Data cleaning summary is displayed in the notebook output

---

## Author

Nandini Bawane
