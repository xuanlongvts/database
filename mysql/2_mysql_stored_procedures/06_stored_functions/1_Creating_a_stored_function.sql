DELIMITER$$
    CREATE FUNCTION CustomerLevel(credit DECIMAL(10, 2))
    RETURNS VARCHAR(20)
    DETERMINISTIC
    BEGIN
        DECLARE customerLevel VARCHAR(20);

        IF credit > 50000 THEN
            SET customerLevel = "Platinum";
        ELSEIF (credit >= 10000 AND credit <= 50000) THEN
            SET customerLevel = "GOLD";
        ELSEIF credit < 10000 THEN
            SET customerLevel = "SILVER";
        END IF;

        RETURN (customerLevel);

    END$$
DELIMITER;

/*
    Fourth, specify if a function is deterministic or not using the DETERMINISTIC keyword.

    A deterministic function always returns the same result for the same input parameters whereas a non-deterministic function returns different results for the same input parameters.

    If you don’t use DETERMINISTIC or NOT DETERMINISTIC, MySQL uses the NOT DETERMINISTIC option by default.
*/

SHOW FUNCTION STATUS WHERE db = "classicmodels";

-- Calling a stored function in an SQL statement
SELECT customerName, CustomerLevel(creditLimit) AS Level
FROM customers
ORDER BY customerName;

-- Calling a stored function in a stored procedure
DROP PROCEDURE IF EXISTS GetCustomerLevel;

DELIMITER$$
    CREATE PROCEDURE GetCustomerLevel(IN customerNo INT, OUT customerLevel VARCHAR(20))
    BEGIN
        DECLARE credit DEC(10, 2) DEFAULT 0;

        -- get credit limit of a customer
        SELECT creditLimit 
	    INTO credit
        FROM customers
        WHERE customerNumber = customerNo;

        -- call the function
        SET customerLevel = CustomerLevel(credit);

    END$$
DELIMITER;

CALL GetCustomerLevel(-131, @customerLevel);
SELECT @customerLevel;