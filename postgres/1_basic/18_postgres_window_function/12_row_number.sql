SELECT product_id, product_name, group_id, ROW_NUMBER() OVER(
    ORDER BY product_id
)
FROM products_func;

--
SELECT product_id, product_name, group_id, ROW_NUMBER() OVER(
    ORDER BY product_name
)
FROM products_func;

--
SELECT product_id, product_name, group_id, ROW_NUMBER() OVER(
    PARTITION BY group_id
    ORDER BY product_name
)
FROM products_func;

-- PostgreSQL ROW_NUMBER() function and DISTINCT operator
SELECT DISTINCT price, ROW_NUMBER() OVER(
    ORDER BY price
)
FROM products_func
ORDER BY price;

-- resolve
WITH cte AS(
    SELECT DISTINCT price FROM products_func
)
SELECT price, ROW_NUMBER() OVER(
    ORDER BY price
)
FROM cte

-- or subquery
SELECT price, ROW_NUMBER() OVER(
    ORDER BY price
)
FROM (
    SELECT DISTINCT price FROM products_func
) prices;

-- Using ROW_NUMBER() function for pagination
SELECT *
FROM (
    SELECT product_id, product_name, price, ROW_NUMBER() OVER(
        ORDER BY product_name
    )
    FROM products_func
) x
WHERE ROW_NUMBER BETWEEN 6 AND 10

-- Using ROW_NUMBER() function for getting the nth highest / lowest row
SELECT * FROM products_func
WHERE price = (
    SELECT price
    FROM
    (
        SELECT price, ROW_NUMBER() OVER(
            ORDER BY price DESC
        ) nth FROM (
            SELECT DISTINCT (price) FROM products_func
        ) prices
    ) sorted_prices
    WHERE nth = 3
)