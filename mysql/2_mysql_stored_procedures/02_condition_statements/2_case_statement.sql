-- Simple CASE statement
DELIMITER$$
    CREATE PROCEDURE GetCustomerShipping(IN pCustomerNumber INT, OUT pShipping VARCHAR(50))
    BEGIN
        DECLARE customerCountry VARCHAR(100);

        SELECT country 
        INTO customerCountry
        FROM customers
        WHERE customerNumber = pCustomerNumber;

        CASE customerCountry
            WHEN 'USA' THEN
                SET pShipping = '2 days shipping';
            WHEN 'CANADA' THEN
                SET pShipping = '3 days shipping';
            ELSE
                SET pShipping = '5 days shipping'; 
        END CASE;
    END$$

DELIMITER;

CALL GetCustomerShipping(112,@shipping);
SELECT @shipping;

-- Searched CASE statement
DROP PROCEDURE IF EXISTS GetDeliveryStatus;

DELIMITER $$
    CREATE PROCEDURE GetDeliveryStatus(
        IN pOrderNumber INT,
        OUT pDeliveryStatus VARCHAR(100)
    )
    BEGIN
        DECLARE waitingDay INT DEFAULT 0;
        SELECT 
            DATEDIFF(requiredDate, shippedDate)
        INTO waitingDay
        FROM orders
        WHERE orderNumber = pOrderNumber;
        
        CASE 
            WHEN waitingDay = 0 THEN 
                SET pDeliveryStatus = 'On Time';
            WHEN waitingDay >= 1 AND waitingDay < 5 THEN
                SET pDeliveryStatus = 'Late';
            WHEN waitingDay >= 5 THEN
                SET pDeliveryStatus = 'Very Late';
            ELSE
                SET pDeliveryStatus = 'No Information';
        END CASE;	
    END$$
DELIMITER;


CALL GetDeliveryStatus(10100, @delivery);
SELECT @delivery;