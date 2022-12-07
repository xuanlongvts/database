SELECT 1 OR 1, 1 OR 0, 0 OR 1;

SELECT 0 OR 0;

SELECT 1 OR NULL, 0 OR NULL, NULL OR NULL;

SELECT 1/0 OR 1 = 1;

SELECT 1 OR 0 AND 0;

SELECT (1 OR 0) AND 0;

SELECT customername, country
    FROM customers
    WHERE country = 'USA' OR country = 'France';

SELECT customername, country, creditLimit
    FROM customers
    WHERE country = 'USA' OR country = 'France' AND creditLimit > 100000;

SELECT customername, country, creditLimit
    FROM customers
    WHERE (country = 'USA' OR country = 'France') AND creditLimit > 100000;