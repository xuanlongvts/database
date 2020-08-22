--1) Using PostgreSQL PERCENT_RANK() function over a result set example
SELECT name, amount, year, PERCENT_RANK() OVER(
    ORDER BY amount
)
FROM sales_stats
WHERE year = 2019;

-- 2) Using PostgreSQL PERCENT_RANK() function over a partition example
SELECT name, amount, year, PERCENT_RANK() OVER(
    PARTITION BY year
    ORDER BY amount
)
FROM sales_stats;