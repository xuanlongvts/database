DROP TABLE IF EXISTS sales_lead;
CREATE TABLE IF NOT EXISTS sales_lead
(
    year SMALLINT CHECK(year > 0),
    group_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(year, group_id)
);

INSERT INTO sales_lead(year, group_id, amount)
VALUES 
    (2018,1,1474),
	(2018,2,1787),
	(2018,3,1760),
	(2019,1,1915),
	(2019,2,1911),
	(2019,3,1118),
	(2020,1,1646),
	(2020,2,1975),
	(2020,3,1516);

SELECT * FROM sales_lead;

-- 1) Using PostgreSQL LEAD() function over a result set examples
WITH cte AS(
    SELECT year, SUM(amount) amount
    FROM sales_lead
    GROUP BY year
    ORDER BY year
)
SELECT year, amount, LEAD(amount, 1) OVER(
    ORDER BY year
) next_year_sales
FROM cte;

--
WITH cte1 AS(
    SELECT year, SUM(amount) amount
    FROM sales_lead
    GROUP BY year
    ORDER BY year
), cte2 AS(
    SELECT year, amount, LEAD(amount, 1) OVER(
        ORDER BY year
    ) next_year_sales
    FROM cte1
)

SELECT year, amount, next_year_sales, (next_year_sales - amount) variance
FROM cte2

-- 2) Using PostgreSQL LEAD() function over a partition example
SELECT year, amount, group_id, LEAD(amount, 1) OVER(
    PARTITION BY group_id
    ORDER BY year
) next_year_sales
FROM sales_lead;