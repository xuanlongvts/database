SELECT * FROM products_func;

-- 1) Using PostgreSQL NTH_VALUE() function over the result set example
SELECT product_id, product_name, price, NTH_VALUE(product_name, 2) OVER(
    ORDER BY price DESC
    RANGE BETWEEN
        UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
FROM products_func;

-- 2) Using PostgreSQL NTH_VALUE() function over a partition example
SELECT product_id, product_name, price, NTH_VALUE(product_name, 2) OVER(
    PARTITION BY group_id
    ORDER BY price DESC
    RANGE BETWEEN
        UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
FROM products_func;