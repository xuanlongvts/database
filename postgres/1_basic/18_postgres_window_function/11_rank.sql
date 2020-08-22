DROP TABLE IF EXISTS ranks;
CREATE TABLE IF NOT EXISTS ranks(
    c VARCHAR(10)
);

INSERT INTO ranks(c)
VALUES('A'),('A'),('B'),('B'),('B'),('C'),('E') RETURNING *;

--
SELECT c, RANK() OVER(
    ORDER BY c
) rank_number
FROM ranks;

-- 1) Using PostgreSQL RANK() function for the whole result set
SELECT product_id, product_name, price, RANK() OVER(
    ORDER BY price DESC
) price_rank
FROM products_func;

-- 2) Using PostgreSQL RANK() function with PARTITION BY clause example
SELECT p.group_id, product_id, product_name, group_name, price, RANK() OVER(
    PARTITION BY p.group_id
    ORDER BY price DESC
) price_rank
FROM products_func p INNER JOIN product_groups g ON p.group_id = g.group_id;