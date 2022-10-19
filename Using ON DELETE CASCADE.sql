-- Use the ON DELETE CASCADE option to specify whether you want rows deleted in a child table when corresponding rows are deleted in the parent table. 
-- 	• If you do not specify cascading deletes, the default behavior of the database server prevents you from deleting data in a table if other tables reference it.

-- If you specify this option, later when you delete a row in the parent table, the database server also deletes any rows associated with that row (foreign keys) in a child table.
-- 	• The principal advantage to the cascading-deletes feature is that it allows you to reduce the quantity of SQL statements you need to perform delete actions.

-- For example, the all_candy table contains the candy_num column as a primary key. 
-- The hard_candy table refers to the candy_num column as a foreign key. 

-- The following CREATE TABLE statement creates the hard_candy table with the cascading-delete option on the foreign key:

CREATE TABLE all_candy 
   (candy_num SERIAL PRIMARY KEY,
    candy_maker CHAR(25));

CREATE TABLE hard_candy 
   (candy_num INT, 
    candy_flavor CHAR(20),
    FOREIGN KEY (candy_num) REFERENCES all_candy
    ON DELETE CASCADE);

-- Because ON DELETE CASCADE is specified for the dependent table, when a row of the all_candy table is deleted, the corresponding rows of the hard_candy table are also deleted.