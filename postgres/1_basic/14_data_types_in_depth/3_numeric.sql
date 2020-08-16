-- NUMERIC(precision, scale)
/*
-- In this syntax, the precision is the total number of digits and the scale is the number of digits in the fraction part. 
For example, the number 1234.567 has the precision 7 and scale 3.

-- If you omit both precision and scale, you can store any precision and scale up to the limit of the precision and scale mentioned above.

-- If precision is not required, you should not use the NUMERIC type because calculations on NUMERIC values are typically slower than 
integers, floats, and double precisions.
*/
DROP TABLE IF EXISTS products_numeric;
CREATE TABLE
IF NOT EXISTS products_numeric
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(10) NOT NULL,
    price NUMERIC
(5, 2)
);

SELECT *
FROM products_numeric;

INSERT INTO products_numeric
    (name, price)
VALUES
    ('Phone', 500.215),
    ('Tablet', 500.214);

INSERT INTO products_numeric
    (name, price)
VALUES
    ('Phone', 123456.21);

UPDATE products_numeric SET price = 'NaN' WHERE id = 1;

SELECT *
FROM products_numeric
ORDER BY price DESC;