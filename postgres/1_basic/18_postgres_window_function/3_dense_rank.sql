DROP TABLE IF EXISTS dense_ranks;
CREATE TABLE
IF NOT EXISTS dense_ranks
(
    c VARCHAR
(10)
);

INSERT INTO dense_ranks
    (c)
VALUES
    ('A'),
    ('A'),
    ('B'),
    ('C'),
    ('C'),
    ('D'),
    ('E');

SELECT c, DENSE_RANK() OVER(
    ORDER BY c
) dense_rank_number
FROM dense_ranks;

-- 1) Using PostgreSQL DENSE_RANK() function over a result set example
SELECT product_id, product_name, price, DENSE_RANK() OVER(
    ORDER BY price DESC
) price_rank
FROM products_func;

-- 2) Using PostgreSQL DENSE_RANK() function over partitions example
SELECT product_id, product_name, price, DENSE_RANK() OVER(
    PARTITION BY group_id
    ORDER BY price DESC
) price_rank
FROM products_func;

-- 3) Using PostgreSQL DENSE_RANK() function with a CTE example
WITH
    cte
    AS

    (
        SELECT product_id, product_name, group_id, price, DENSE_RANK() OVER(
            PARTITION BY group_id
            ORDER BY price DESC
        ) price_rank
        FROM products_func
    )
SELECT product_id, product_name, price
FROM cte
WHERE price_rank = 1;