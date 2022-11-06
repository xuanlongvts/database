DELIMITER$$
    CREATE FUNCTION OrderLeadTime(orderDate DATE, requiredDate DATE)
    RETURNS INT
    DETERMINISTIC
    BEGIN
        RETURN requiredDate - orderDate;
    END$$

DELIMITER;

DROP FUNCTION `OrderLeadTime`;

SHOW WARNINGS;

DROP FUNCTION IF EXISTS NonExistingFunction;
