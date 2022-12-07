SELECT customerNumber, customerName, creditLimit
    FROM customers
    ORDER BY creditLimit DESC
    LIMIT 5;

SELECT customerNumber, customerName, creditLimit
    FROM customers
    ORDER BY creditLimit
    LIMIT 5;


SELECT customerNumber, customerName, creditLimit
    FROM customers
    ORDER BY creditLimit, customerNumber
    LIMIT 5;

SELECT COUNT(*) AS Quantity
    FROM customers;

SELECT customerNumber, customerName
    FROM customers
    ORDER BY customerName
    LIMIT 10;


-- This query uses the LIMIT clause to get the rows of the second page that include rows 11 – 20:
SELECT customerNumber, customerName
    FROM customers
    ORDER BY customerName
    LIMIT 10, 10;

SELECT customerName, creditLimit
    FROM customers
    ORDER BY creditLimit DESC
    LIMIT 1, 1;

SELECT customerName, creditLimit
    FROM customers
    ORDER BY creditLimit DESC;

SELECT DISTINCT state
    FROM customers
    WHERE state IS NOT NULL
    LIMIT 5;