-- [IN | OUT | INOUT] parameter_name datatype[(length)]

-------- IN
DELIMITER$$
    CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
    BEGIN
        SELECT * 
        FROM offices
        WHERE country = countryName;

    END$$

DELIMITER;

CALL GetOfficeByCountry('USA');
CALL GetOfficeByCountry('France');

CALL GetOfficeByCountry();
SHOW WARNINGS;

-------- OUT
DROP PROCEDURE IF EXISTS GetOrderCountByStatus;
DELIMITER$$
    CREATE PROCEDURE GetOrderCountByStatus(IN orderStatus VARCHAR(25), OUT total INT)
    BEGIN
        SELECT count(orderNumber)
        INTO total
        FROM orders
        WHERE status = orderStatus;
    END$$

DELIMITER;

CALL GetOrderCountByStatus('Shipped', @total);
SELECT @total;

CALL GetOrderCountByStatus('in process', @total);
SELECT @total AS total_in_process;

-- INOUT
DELIMITER$$
    CREATE PROCEDURE SetCounter(INOUT counter INT, IN inc INT)
    BEGIN
        SET counter = counter + inc;

    END;
DELIMITER;

SET @counter = 1;
CALL SetCounter(@counter, 1); -- 2
CALL SetCounter(@counter, 2); -- 4
CALL SetCounter(@counter, 5); -- 9

SELECT @counter;