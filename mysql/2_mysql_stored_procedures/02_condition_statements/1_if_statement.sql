DROP PROCEDURE IF EXISTS GetCustomerLevel;

-- IF
DELIMITER$$
CREATE PROCEDURE GetCustomerLevel(IN pCustomerNumber INT, OUT pCustomerLevel VARCHAR(20))
    BEGIN
        DECLARE credit DECIMAL(10, 2) DEFAULT 0;

        SELECT creditLimit
        INTO credit
        FROM customers
        WHERE customerNumber = pCustomerNumber;

        IF credit > 50000 THEN
            SET pCustomerLevel = 'Platinum';
        END IF;
    END$$

DELIMITER;

--
SELECT customerNumber, creditLimit
FROM customers
WHERE `creditLimit` > 40000
ORDER BY `creditLimit` DESC;

CALL GetCustomerLevel(124, @level);
SELECT @level;

CALL GetCustomerLevel(452, @level);
SELECT @level;


-- IF ELSE
DELIMITER$$
CREATE PROCEDURE GetCustomerLevel_1(IN pCustomerNumber INT, OUT pCustomerLevel VARCHAR(20))
    BEGIN
        DECLARE credit DECIMAL(10, 2) DEFAULT 0;

        SELECT creditLimit
        INTO credit
        FROM customers
        WHERE customerNumber = pCustomerNumber;

        IF credit > 50000 THEN
            SET pCustomerLevel = 'Platinum';
        ELSE
            SET pCustomerLevel = 'NOT Platinum';
        END IF;
    END$$

DELIMITER;

CALL GetCustomerLevel_1(124, @level);
SELECT @level;

CALL GetCustomerLevel_1(447, @level);
SELECT @level;

-- IF-THEN-ELSEIF-ELSE
DELIMITER$$
CREATE PROCEDURE GetCustomerLevel_2(IN pCustomerNumber INT, OUT pCustomerLevel VARCHAR(20))
    BEGIN
        DECLARE credit DECIMAL(10, 2) DEFAULT 0;

        SELECT creditLimit
        INTO credit
        FROM customers
        WHERE customerNumber = pCustomerNumber;

        IF credit > 50000 THEN
            SET pCustomerLevel = 'Platinum';
        ELSEIF credit <= 50000 AND credit > 10000 THEN
            SET pCustomerLevel = 'GOLD';
        ELSE
            SET pCustomerLevel = 'SILVER';
        END IF;
    END$$

DELIMITER;

CALL GetCustomerLevel_2(447, @level); 
SELECT @level;