DROP TABLE IF EXISTS sales_lag;

CREATE TABLE IF NOT EXISTS sales_lag (
	group_id int NOT NULL,
	amount numeric(10, 2) NOT NULL,
	year smallint NOT NULL
);

INSERT INTO sales_lag (year, group_id, amount)
	VALUES (2018, 1, 1474.00), (2018, 2, 1787.00), (2018, 3, 1760.00), (2019, 1, 1915.00), (2019, 2, 1911.00), (2019, 3, 1118.00), (2020, 1, 1646.00), (2020, 2, 1975.00), (2020, 3, 1516.00)
RETURNING
	*;

SELECT
	*
FROM
	sales_lag;

WITH cte AS (
	SELECT
		year,
		SUM(amount) amount
	FROM
		sales_lag
	GROUP BY
		year
	ORDER BY
		year
)
SELECT
	year,
	amount,
	LAG(amount, 1) OVER (ORDER BY year) previous_year_sales
	FROM
		cte;

--
WITH cte1 AS (
	SELECT
		year,
		SUM(amount) amount
	FROM
		sales_lag
	GROUP BY
		year
	ORDER BY
		year
),
cte2 AS (
	SELECT
		year,
		amount,
		LAG(amount, 1) OVER (ORDER BY year) previous_year_sales
	FROM cte1
)
SELECT
	year,
	amount,
	previous_year_sales,
	(previous_year_sales - amount)
	variance
FROM
	cte2;

-- 2) Using PostgreSQL LAG() function over a partition example
SELECT
	year,
	amount,
	group_id,
	LAG(amount, 1) OVER (PARTITION BY group_id ORDER BY year) previous_year_sales
FROM
	sales_lag
