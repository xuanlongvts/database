SELECT 15 BETWEEN 10 AND 20;

SELECT 15 BETWEEN 20 AND 30;

SELECT 15 NOT BETWEEN 10 AND 20;

SELECT productCode, productName, buyPrice
    FROM products
    WHERE buyPrice BETWEEN 90 AND 100;

SELECT productCode, productName, buyPrice
    FROM products
    WHERE buyPrice >= 90 AND buyPrice <= 100;

SELECT productCode, productName, buyPrice
    FROM products
    WHERE buyPrice NOT BETWEEN 20 AND 100;

SELECT productCode, productName, buyPrice
    FROM products
    WHERE buyPrice < 20 OR buyPrice > 100;

SELECT orderNumber, requiredDate, status
    FROM orders
    WHERE requireddate BETWEEN CAST('2003-01-01' AS DATE) AND CAST('2003-01-31' AS DATE)