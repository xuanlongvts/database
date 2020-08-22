SELECT year, name, amount FROM sales_stats;

-- 1) Using PostgreSQL NTILE() function over a result set example
SELECT name, amount, NTILE(3) OVER(
    ORDER BY amount
)
FROM sales_stats
WHERE year = 2019

-- 2) Using PostgreSQL NTILE() function over a partition example
SELECT name, amount, NTILE(3) OVER(
    PARTITION BY year
    ORDER BY amount
)
FROM sales_stats;