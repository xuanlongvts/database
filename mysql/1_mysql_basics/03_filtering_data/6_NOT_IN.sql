SELECT 1 NOT IN (1, 2, 3);

SELECT 0 NOT IN (1, 2, 3);

SELECT NULL NOT IN (1,2,3);

SELECT officeCode, city, phone
    FROM offices
    WHERE country NOT IN ('USA' , 'France')
    ORDER BY city;