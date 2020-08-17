/*
The syntax of the COALESCE function is as follows:

COALESCE(argument_1, argument_2, …);
The COALESCE function accepts an unlimited number of arguments. It returns the first argument that is not null.
If all arguments are null, the COALESCE function will return null.

The COALESCE function evaluates arguments from left to right until it finds the first non-null argument. 
All the remaining arguments from the first non-null argument are not evaluated.

The COALESCE function provides the same functionality as NVL or IFNULL function provided by SQL-standard. MySQL has IFNULL function,
while Oracle provides NVL function.
*/
SELECT COALESCE(1, 2);

SELECT COALESCE(NULL, 2, 1);

-- PostgreSQL COALESCE example
DROP TABLE IF EXISTS items;
CREATE TABLE
IF NOT EXISTS items
(
    id SERIAL PRIMARY KEY,
    product VARCHAR
(100) NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC
);

INSERT INTO items
    (product, price, discount)
VALUES
    ('A', 1000 , 10),
    ('B', 1500 , 20),
    ('C', 800 , 5),
    ('D', 500, NULL);

SELECT *
FROM items;

SELECT product,
    (price - discount) AS net_price
FROM items;

/*
The get the right price, we need to assume that if the discount is null, it is zero. Then we can use the COALESCE function as follows:
*/
SELECT product,
    (price - COALESCE(discount, 0)) AS net_price
FROM items;

/*
Besides using the COALESCE function, you can use the CASE expression to handle the null values in this case. 
See the following query that uses the CASE expression to achieve the same result above.
*/
SELECT product,
    (
        price - 
            CASE 
                WHEN discount IS NULL THEN 0 
            ELSE 
                discount 
            END 
    ) AS net_price
FROM items;