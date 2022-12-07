SELECT lastname
    FROM employees
    ORDER BY lastname;

SELECT DISTINCT lastname
    FROM employees
    ORDER BY `lastName`;

SELECT DISTINCT state
    FROM customers;

SELECT state, city
    FROM customers
    WHERE state IS NOT NULL
    ORDER BY state, city;

SELECT DISTINCT state, city
    FROM customers
    WHERE state IS NOT NULL
    ORDER BY state, city;