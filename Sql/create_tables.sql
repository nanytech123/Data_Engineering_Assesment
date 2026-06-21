CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(100),
    signup_date DATE
);

COPY customers
FROM 'U:\Data Engineer\Data\customers.csv'
DELIMITER ','
CSV HEADER
NULL '';

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price NUMERIC(10,2)
);

COPY products
FROM 'U:\Data Engineer\Data\products.csv'
DELIMITER ','
CSV HEADER
NULL '';

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK(quantity > 0),
    order_date DATE,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY(product_id)
        REFERENCES products(product_id)
);

COPY orders
FROM 'U:\Data Engineer\Data\orders.csv'
DELIMITER ','
CSV HEADER
NULL '';

select * from orders;
select * from products;
select * from customers;