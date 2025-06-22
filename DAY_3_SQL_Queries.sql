# DAY 3
/*
 Sample Table: `orders`
 | order_id | customer_id | order_date | amount  | status   |
 |----------|-------------|------------|---------|----------|
 | 1        | 101         | 2025-06-01 | 250.00  | Shipped  |
 | 2        | 102         | 2025-06-02 | 150.00  | Pending  |
 | 3        | 101         | 2025-06-05 | 300.00  | Shipped  |
 | 4        | 103         | 2025-06-06 | 200.00  | Cancelled|
 | 5        | 104         | 2025-06-07 | 450.00  | Shipped  |
 Practice Exercises on Aggregation and Grouping
 1. Find the total amount spent by each customer.
 2. Count the number of orders for each order status.
 3. Find the average order amount for orders with status 'Shipped'.
 4. Identify the customer who spent the maximum total amount.
 5. Show the total sales amount per day (group by order_date).
*/

#Order Table
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT NOT NULL,
order_date VARCHAR(15),
amount DOUBLE NOT NULL,
status VARCHAR(15) NOT NULL
);

INSERT INTO orders(order_id,customer_id,order_date,amount,status) VALUES
(1,101,"2025-06-01",250.00,"Shipped"),
(2,102,"2025-06-02",150.00,"Pending"),
(3,101,"2025-06-05",300.00,"Shipped"),
(4,103,"2025-06-06",200.00,"Cancelled"),
(5,104,"2025-06-07",450.00,"Shipped");

SELECT * FROM orders;


#Question 1 Ans
SELECT customer_id,SUM(amount) 
FROM orders
GROUP BY customer_id;

#Question 2 Ans
SELECT status,COUNT(customer_id)
FROM orders
GROUP BY status;

#Question 3 Ans
SELECT status,AVG(amount)
FROM orders
WHERE status="Shipped";

#Question 4 Ans
SELECT customer_id,SUM(amount)
FROM orders
GROUP BY customer_id 
LIMIT 1;

#Question 5 Ans
SELECT order_date,SUM(amount)
FROM orders
GROUP BY order_date;



