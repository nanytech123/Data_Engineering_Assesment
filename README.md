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

```text
data/
│
├── customers.csv
├── products.csv
├── orders.csv
└── customers_cleaned.csv

sql/
│
├── create_tables.sql
└── queries.sql

python/
│
├── load_data.py
└── clean_data.py

README.md
```

---

## Technologies Used

* PostgreSQL
* Python
* Pandas
* SQLAlchemy
* Git
* GitHub

---

## Database Setup

### Create Database

```sql
CREATE DATABASE ecommerce_db;
```

### Create Tables

Run:

```sql
\i sql/create_tables.sql
```

This creates:

* customers
* products
* orders

---

## Load CSV Data

Install required packages:

```bash
pip install pandas sqlalchemy psycopg2-binary
```

Run:

```bash
python python/load_data.py
```

This loads the CSV files into PostgreSQL tables.

---

## Verify Data Load

Run:

```sql
SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;
```

The row counts should match the CSV files.

---

## SQL Analysis

Run:

```sql
\i sql/queries.sql
```

Queries included:

* JOIN Operations
* Aggregation Queries
* Top Products Analysis
* Revenue Analysis
* Window Functions

---

## Data Cleaning

Run:

```bash
python python/clean_data.py
```

The script:

* Removes duplicate rows
* Removes rows with missing values
* Standardizes text formatting
* Creates a cleaned CSV file

Output:

```text
customers_cleaned.csv
```

---

## Expected Output

After running all scripts:

* PostgreSQL tables are created successfully
* CSV data is loaded successfully
* SQL queries execute successfully
* Cleaned CSV file is generated
* Data cleaning summary is displayed

---

## Author

Nandini Bawane
