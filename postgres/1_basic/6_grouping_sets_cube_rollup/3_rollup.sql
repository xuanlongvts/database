DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(brand, segment)
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
GROUP BY ROLLUP(brand, segment)
ORDER BY brand, segment

SELECT segment, brand, SUM(quantity) quantity
FROM sales
GROUP BY ROLLUP(segment, brand)
ORDER BY segment, brand

SELECT segment, brand, SUM(quantity) quantity
FROM sales
GROUP BY segment, ROLLUP(brand)
ORDER BY segment, brand

/*
    -- The following statement finds the number of rental per day, month, and year by using the ROLLUP:
*/
SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) m,
    EXTRACT (DAY FROM rental_date) d,
    COUNT(rental_id) count
FROM rental
GROUP BY ROLLUP 
(
    EXTRACT (YEAR FROM rental_date),
    EXTRACT (MONTH FROM rental_date),
    EXTRACT (DAY FROM rental_date)
)
ORDER BY count
