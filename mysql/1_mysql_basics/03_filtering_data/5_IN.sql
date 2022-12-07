SELECT 2 IN (1, 2, 3);

SELECT 4 IN (1, 2, 3);

SELECT NULL IN (1, 2, 3);

SELECT 0 IN (1, 2, 3, NULL); 

SELECT NULL IN (1, 2, 3, NULL);

SELECT officeCode, city, phone, country
    FROM offices
    WHERE country IN ('USA', 'France');

-- You can also get the same result with the OR operator like this:

SELECT officeCode, city, phone, country
    FROM offices
    WHERE country = 'USA' OR country = 'France';