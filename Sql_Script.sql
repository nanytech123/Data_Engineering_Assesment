

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(100),
    signup_date DATE
);

COPY customers
FROM 'U:\Data Engineer\customers.csv'
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
FROM 'U:\Data Engineer\products.csv'
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
FROM 'U:\Data Engineer\orders.csv'
DELIMITER ','
CSV HEADER
NULL '';

select * from orders;
select * from products;
select * from customers;

-- Order Details

SELECT
o.order_id,
c.customer_name,
c.city,
p.product_name,
p.category,
o.quantity,
o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id
ORDER BY o.order_date;
 
-- Total Orders per Product

SELECT
p.product_name,
COUNT(*) AS total_orders
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC;


-- Total qualtity sold

SELECT
p.product_name,
SUM(o.quantity) AS quantity_sold
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY quantity_sold DESC;


-- Total orders per Customer

SELECT
c.customer_name,
COUNT(*) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

-- Revenue by Product

SELECT
p.product_name,
SUM(
o.quantity * p.price
) AS revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Revenue by customer

SELECT
c.customer_name,
SUM(
o.quantity * p.price
) AS revenue
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

-- Top 10 Products

SELECT
p.product_name,
COUNT(*) total_orders
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 10;


-- latest order per customer


SELECT *
FROM
(
SELECT
c.customer_name,
p.product_name,
o.order_date,

ROW_NUMBER()
OVER(
PARTITION BY c.customer_id
ORDER BY o.order_date DESC
) rn

FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id

) t

WHERE rn = 1;


-- Customer spending rank

SELECT
customer_name,
revenue,

RANK()
OVER(
ORDER BY revenue DESC
) spending_rank

FROM
(
SELECT
c.customer_name,

SUM(
o.quantity * p.price
) revenue

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id

GROUP BY c.customer_name

) x;


