SELECT contactFirstname, contactLastname 
FROM customers 
ORDER BY `contactLastName` DESC

SELECT contactFirstname, contactLastname 
FROM customers 
ORDER BY `contactLastName` ASC, `contactFirstName` DESC

SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach
FROM orderdetails
ORDER BY quantityOrdered * priceEach DESC

SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach as subtotal
FROM orderdetails
ORDER BY subtotal DESC


-- string ‘A’ is the first position on the list 'A', 'B', and 'C', so returns 1
SELECT FIELD('A', 'A', 'B', 'C')

SELECT FIELD('D', 'A', 'B', 'C')

SELECT FIELD('B', 'A', 'B', 'C')

/*
-- Suppose that you want to sort the sales orders based on their statuses in the following order:
    In Process
    On Hold
    Canceled
    Resolved
    Disputed
    Shipped
*/
SELECT orderNumber, status
FROM orders
ORDER BY FIELD(status, 
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped')

-- MySQL ORDER BY and NULL
-- In MySQL, NULL is lower than non-NULL values
SELECT firstName, lastName, reportsTo
FROM employees
ORDER BY `reportsTo`