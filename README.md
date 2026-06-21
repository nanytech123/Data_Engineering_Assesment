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
* pgAdmin
* Python
* Pandas
* Git
* GitHub
---
## Database Setup
### Create Database
1. Open pgAdmin and connect to your PostgreSQL server.
2. Right-click **Databases** → **Create** → **Database**.
3. Name it `ecommerce_db` and click **Save**.

### Create Tables
1. Right-click on `ecommerce_db` → **Query Tool**.
2. Open `Sql/schema.sql`, copy its contents into the Query Tool.
3. Click **Execute** (or press F5).

This creates:
* customers
* orders
* products
---
## Load CSV Data
For each table, load the corresponding CSV using pgAdmin's import feature:
1. In pgAdmin, expand `ecommerce_db` → **Schemas** → **public** → **Tables**.
2. Right-click the target table (e.g. `customers`) → **Import/Export Data**.
3. Toggle to **Import**, select the matching file from `Data/` (e.g. `Data/customers.csv`).
4. Under **Options**, enable **Header** and set Delimiter to `,`.
5. Click **OK** to run the import.
6. Repeat for `orders` (Data/orders.csv) and `products` (Data/Products.csv).
---
## Verify Data Load
In the pgAdmin Query Tool, run:
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM products;

The row counts should match the CSV files.
---
## SQL Analysis
1. Open `Sql/Queries.sql` in the pgAdmin Query Tool.
2. Run each query individually (or all together) and review the results grid.

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
* CSV data is loaded successfully via pgAdmin
* SQL queries execute successfully
* Cleaned CSV file is generated
* Data cleaning summary is displayed in the notebook output
---
## Author
Nandini Bawane
