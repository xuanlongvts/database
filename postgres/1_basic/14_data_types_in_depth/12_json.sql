DROP TABLE IF EXISTS orders_json;
CREATE TABLE
IF NOT EXISTS orders_json
(
    id SERIAL PRIMARY KEY,
    info JSON NOT NULL
);

INSERT INTO orders_json
    (info)
VALUES('{ "customer": "John Doe", "items": {"product": "Beer","qty": 6}}'),
    ('{ "customer": "Lily Bush", "items": {"product": "Diaper","qty": 24}}'),
    ('{ "customer": "Josh William", "items": {"product": "Toy Car","qty": 1}}'),
    ('{ "customer": "Mary Clark", "items": {"product": "Toy Train","qty": 2}}');

-- Querying JSON data
SELECT *
FROM orders_json;

SELECT info -> 'customer'
as customer FROM orders_json;

-- And the following query uses operator ->> to get all customers in form of text:
SELECT info ->> 'customer'
as customer FROM orders_json;

/*
-- Because -> operator returns a JSON object, you can chain it with the operator ->> to retrieve a specific node. 
For example, the following statement returns all products sold:
*/
SELECT info -> 'items'
->> 'product' AS product FROM orders_json;

-- Use JSON operator in WHERE clause
SELECT info ->> 'customer'
AS customer FROM orders_json WHERE info -> 'items' ->> 'product' = 'Diaper';

-- To find out who bought two products at a time, we use the following query:
SELECT info -> 'customer'
AS customer, info -> 'items' ->> 'product' AS product
FROM orders_json
WHERE CAST
(info -> 'items' ->> 'qty' AS INTEGER) = 2;

-- Apply aggregate functions to JSON data
SELECT
    MIN (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    MAX (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    SUM (CAST (info -> 'items' ->> 'qty' AS INTEGER)),
    AVG (CAST (info -> 'items' ->> 'qty' AS INTEGER))
FROM orders_json;

-- PostgreSQL JSON functions
SELECT json_each(info) FROM orders_json;

SELECT json_object_keys(info -> 'items') FROM orders_json;

-- json_typeof
SELECT json_typeof(info) FROM orders_json;

SELECT json_typeof(info -> 'items' -> 'qty') FROM orders_json;