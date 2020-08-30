/*
CREATE INDEX index_name 
ON table_name (expression);

Note that indexes on expressions are quite expensive to maintain because PostgreSQL has to evaluate the expression for each row 
when it is inserted or updated and use the result for indexing. Therefore, you should use the indexes on expressions 
when retrieval speed is more critical than insertion and update speed.
*/

SELECT customer_id, first_name, last_name
FROM customer
WHERE last_name = 'Purdy';

EXPLAIN SELECT customer_id, first_name, last_name
FROM customer
WHERE last_name = 'Purdy';

-- The following statement that finds customers whose last name is purdy in lowercase. However, PostgreSQL could not utilize the index for lookup:

CREATE INDEX idx_ic_last_name
ON customer(LOWER(last_name));

EXPLAIN
SELECT 
    customer_id, 
    first_name, 
    last_name 
FROM 
    customer 
WHERE 
    LOWER(last_name) = 'purdy';