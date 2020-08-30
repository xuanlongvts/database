/*
So far you have learned how to add values of one or more columns to an index. PostgreSQL partial index even allows you to 
specify the rows of a table that should be indexed. This partial index helps speed up the query while reducing the size of the index.
*/
SELECT customer_id, first_name, last_name
FROM customer
WHERE active = 0;

EXPLAIN SELECT customer_id, first_name, last_name
FROM customer
WHERE active = 0;

--
CREATE INDEX idx_customer_active
ON customer(active);

-- This index fulfills its purpose, however, it includes many rows that are never searched, namely all the active customers.
CREATE INDEX idx_customer_inactive
ON customer(active)
WHERE active = 0;

EXPLAIN SELECT customer_id, first_name, last_name
FROM customer
WHERE active = 0;

-- The syntax for defining a partial index is quite straightforward:
/*
CREATE INDEX index_name
ON table_name(column_list)
WHERE condition;
*/