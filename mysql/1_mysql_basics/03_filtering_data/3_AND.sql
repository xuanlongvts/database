SELECT 1 AND 1;

SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;

SELECT 1 AND NULL, NULL AND NULL;

SELECT 1 = 0 AND 1/0;

SELECT customername, country, state
    FROM customers
    WHERE country = 'USA' AND state = 'CA';

SELECT customername, country, state, creditlimit
    FROM customers
    WHERE country = 'USA' AND state = 'CA' AND creditlimit > 100000;