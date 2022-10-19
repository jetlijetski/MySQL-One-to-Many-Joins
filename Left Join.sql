-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
-- Creates a union of everything from the Table 1 with only matching records from Table 2
-- There is a large difference in how SQL treats the LEFT table (first table) when using the LEFT JOIN. 
-- For any rows in the first (or LEFT) table that did not have a match, it will still add this row to the new table and put in null values for the columns from the other table.

-- Basic Syntax
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;


# Left Join: Note that both customers who have never placed an order are now listed, however there are NULL entries are returned to reflect this fact. 
SELECT * FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

-- A practical use case in this scenario would be:
-- Identifying the highest spenders in our database versus people who have yet to place an order.
-- We could then send coupons to those who haven't placed orders or thank you emails to our highest spenders!

#By using the logic of IFNULL, we can replace NULL values (Customers who never placed an order) with 0.

SELECT
  first_name,
  last_name,
  IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;