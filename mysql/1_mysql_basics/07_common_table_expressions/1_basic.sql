# select only customers located in California.
WITH customers_in_usa AS (
    SELECT customerName, state
    FROM customers
    WHERE country = 'USA'
)
SELECT customerName
FROM customers_in_usa
WHERE state = 'CA'
ORDER BY customerName;

# CTE returns the top 5 sales rep in 2003
WITH topsales2003 AS (
    SELECT
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDAte) = 2003
        AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT
    employeeNumber, firstName, lastName, sales
FROM 
    employees
        JOIN
    topsales2003 USING (employeeNumber);

# two CTEs in the same query
WITH salesrep AS (
    SELECT
        employeeNumber,
        CONCAT(firstname, " ", lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
), customer_salesrep AS (
    SELECT customerName, salesrepName
    FROM 
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT *
FROM customer_salesrep
ORDER BY customerName;