DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales
    (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100
),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);

SELECT brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY brand, segment
ORDER BY quantity DESC

SELECT brand, SUM(quantity) quantity
FROM sales
GROUP BY brand
ORDER BY quantity DESC

SELECT segment, SUM(quantity) quantity
FROM sales
GROUP BY segment
ORDER BY quantity DESC

SELECT SUM(quantity) quantity
FROM sales

/*
    - Suppose that you want to all the grouping sets by using a single query. To achieve this, 
    you may use the UNION ALL to combine all the queries above.

    - Because UNION ALL requires all result sets to have the same number of columns with compatible data types, 
    you need to adjust the queries by adding NULL to the selection list of each as shown below:
*/
    SELECT brand, segment, SUM(quantity) quantity
    FROM sales
    GROUP BY brand, segment
UNION ALL
    SELECT brand, NULL, SUM(quantity) quantity
    FROM sales
    GROUP BY brand
UNION ALL
    SELECT NULL, segment, SUM(quantity) quantity
    FROM sales
    GROUP BY segment
UNION ALL
    SELECT NULL, NULL, SUM(quantity) quantity
    FROM sales

/*
    -- Grouping Set will The SQL is short.
    -- This query is much shorter and more readable. In addition, PostgreSQL will optimize the number of times it scans 
    the sales table and will not scan multiple times.
*/
SELECT brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY GROUPING SETS
(
    (brand, segment),
    (brand),
    (segment),
    ()
);

-- Grouping function
-- The GROUPING() function returns bit 0if the argument is a member of the current grouping set and 1 otherwise.
SELECT GROUPING(brand) grouping_brand, GROUPING(segment) grouping_segment, brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY GROUPING SETS
(
    (brand),
    (segment),
    ()
)
ORDER BY brand, segment

-- You can use the GROUPING() function in the HAVING clause to find the subtotal of each brand like this:
SELECT GROUPING(brand) grouping_brand, GROUPING(segment) grouping_segment, brand, segment, SUM(quantity) quantity
FROM sales
GROUP BY GROUPING SETS
(
    (brand),
    (segment),
    ()
)
HAVING GROUPING(brand) = 0
ORDER BY brand, segment