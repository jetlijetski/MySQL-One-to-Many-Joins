-- The RIGHT JOIN keyword returns all records from the right table (Table B), and the matching records from the left table (Table A). 
-- The result is 0 records from the left side, if there is no match.

-- SYNTAX:

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name; 


-- In our example working with the "Customers" and "Orders" table, we will produce the same result using a Right Join as we did using the Inner Join. 
-- This is due to the fact that there are not any Orders that do not have a corresponding Customer.

-- RIGHT JOIN

SELECT * FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;

-- INNER JOIN

SELECT * FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;


-- Imagine however that we had a database breach, and several of the customers in our "Customers" table were deleted? Then we would have Orders with no corresponding Customer. 
-- This situation would produce NULL values when performing the RIGHT JOIN and could be mitigated by using the ON DELETE CASCADE key phrase.