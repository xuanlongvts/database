SELECT product_id, product_name, price, LAST_VALUE(product_name) OVER(
    ORDER BY price
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) highest_price
FROM products_func;

-- 2) Using PostgreSQL LAST_VALUE() over a partition example
SELECT product_id, product_name, price, LAST_VALUE(product_name) OVER(
    PARTITION BY group_id
    ORDER BY price
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) highest_price
FROM products_func;