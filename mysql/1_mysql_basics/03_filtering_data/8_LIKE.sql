SELECT employeeNumber, lastName, firstName
    FROM employees
    WHERE firstName LIKE 'a%';

SELECT employeeNumber, lastName, firstName
    FROM employees
    WHERE lastName LIKE '%on';

SELECT employeeNumber, lastName, firstName
    FROM employees
    WHERE lastName LIKE '%on%';

SELECT employeeNumber, lastName, firstName
    FROM employees
    WHERE firstName LIKE 'T_m';

SELECT employeeNumber, lastName, firstName
    FROM employees
    WHERE lastName NOT LIKE 'B%';

-- MySQL LIKE operator with the ESCAPE clause
-- For example, if you want to find products whose product codes contain the string _20 , you can use the pattern %\_20% with the default escape character:
SELECT productCode, productName
    FROM products
    WHERE productCode LIKE '%\_20%';

-- the same
SELECT productCode, productName
    FROM products
    WHERE productCode LIKE '%$_20%' ESCAPE '$';