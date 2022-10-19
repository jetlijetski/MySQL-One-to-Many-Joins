-- The INNER JOIN keyword selects records that have matching values in both tables.
-- By performing an INNER JOIN with the primary key of the "Customers" table equals the Foreign Key of the "Orders" table. We can see more relevant information than a Cross Join would provide.

-- We can accomplish this using the syntax JOIN and ON with: 
-- Table_name.column_name = Table_name.column_name

SELECT * FROM customers
JOIN orders
  ON customers.id = orders.customer_id;

-- Using this syntax, we are taking information from Table A and Table B to create a new table, wherever the condition:
-- customers.id = orders.customer_id is met. 

# Using GROUP BY to take all of our orders, grouped by who ordered them, then take that to find the total amount they spent. 
# Identifying the biggest spender in our database.

SELECT
  first_name,
  last_name,
  order_date,
  SUM(amount) AS total_spent
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
