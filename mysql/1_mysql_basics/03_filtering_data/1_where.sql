SELECT  lastname, firstname, jobtitle, officeCode
    FROM employees
    WHERE jobtitle = 'Sales Rep';

SELECT lastname, firstname, jobtitle, officeCode
    FROM employees
    WHERE jobtitle = 'Sales Rep' AND officeCode = 1;

SELECT lastname, firstname, jobTitle, officeCode
    FROM employees
    WHERE jobtitle = 'Sales Rep' OR officeCode = 1
    ORDER BY `officeCode`, `jobTitle`;


SELECT `lastName`, `firstName`, `officeCode`
    FROM employees
    WHERE `officeCode` BETWEEN 1 AND 3
    ORDER BY `officeCode`;

SELECT firstname, lastname
    FROM employees
    WHERE `lastName` LIKE '%son'
    ORDER BY `firstName`;

SELECT firstname, lastname, officeCode
    FROM employees
    WHERE `officeCode` IN (1, 2, 3)
    ORDER BY `officeCode`;

SELECT firstname, lastname, officeCode, reportsTo
    FROM employees
    WHERE `reportsTo` IS NULL;

SELECT firstname, lastname, officeCode
    FROM employees
    WHERE `jobTitle` <> 'Sales Rep';

SELECT firstname, lastname, officeCode
    FROM employees
    WHERE `officeCode` > 5;