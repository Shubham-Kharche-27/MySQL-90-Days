# Customer Table
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(10),
city VARCHAR(15)
);

INSERT INTO customers(customer_id,name,city) VALUES
(1,"Alice","Delhi"),
(2,"Bob","Mumbai"),
(3,"Charlie","Bangalore"),
(4,"David","Mumbai");

SELECT * FROM customers;

#Orders Table
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date VARCHAR(10),
amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders(order_id,customer_id,order_date,amount) VALUES
(101,1,"2024-06-01",500),
(102,2,"2024-06-03",1200),
(103,1,"2024-06-10",700),
(104,3,"2024-06-15",400);

SELECT * FROM orders;

#Products
CREATE TABLE products(
product_id INT PRIMARY KEY,
name VARCHAR(15),
price INT
);

INSERT INTO products(product_id,name,price) VALUES
(201,"Laptop",55000),
(202,"Mouse",500),
(203,"Keyboard",1000);

#Order Items
CREATE TABLE order_items(
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items(order_id,product_id,quantity) VALUES
(101,201,1),
(101,202,2),
(102,203,1),
(103,202,1),
(104,203,3);

SELECT * FROM order_items;


# 1st Question ans 
#Get the total number of order placed by each customer

SELECT name,COUNT(o.customer_id) FROM customers as c
INNER JOIN orders as o
ON c.customer_id=o.customer_id
GROUP BY name;


# 2nd Question ans
#Find all customers who have not placed any orders

SELECT name FROM customers as c
LEFT JOIN orders as o
ON c.customer_id=o.customer_id
WHERE o.customer_id IS null;



# 3rd Question ans
#List all products with their total quantities sold

SELECT name,SUM(o.quantity) FROM products as p
INNER JOIN order_items as o
ON p.product_id=o.product_id
GROUP BY name;


# 4th Question ans 
#Find the total order amount for each customer

SELECT name,SUM(o.amount) FROM customers as c
INNER JOIN orders as o
ON c.customer_id=o.customer_id
GROUP BY name;


# 5th Question ans
#Show the most expensive product in each order

SELECT oi.order_id,p.name AS product_name,p.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN(SELECT oi.order_id,MAX(p.price) AS max_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id) max_products
ON oi.order_id = max_products.order_id 
AND p.price = max_products.max_price
ORDER BY oi.order_id;





