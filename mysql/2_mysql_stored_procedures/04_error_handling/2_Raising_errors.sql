-- SIGNAL statement
DELIMITER$$
    CREATE PROCEDURE AddOrderItem(
        IN orderNo INT,
        IN productCode varchar(45),
        IN qty INT,
        IN price DOUBLE,
        IN lineNo INT
    )
    BEGIN
        DECLARE C INT;

        SELECT COUNT(orderNumber) INTO C
        FROM orders
        WHERE orderNumber = orderNo;

        -- check if orderNumber exists
        IF (C != 1) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order No not found in orders table';
        END IF;

    END$$

DELIMITER;

CALL AddOrderItem(10,'S10_1678',1,95.7,1);

-- RESIGNAL statement
/*
The RESIGNAL  statement is similar to SIGNAL  statement in term of functionality and syntax, except that:

+ You must use the RESIGNAL  statement within an error or warning handler, otherwise, you will get an error message saying that “RESIGNAL when the handler is not active”. Notice that you can use SIGNAL  statement anywhere inside a stored procedure.
+ You can omit all attributes of the RESIGNAL statement, even the SQLSTATE value.
*/
DELIMITER$$
    CREATE PROCEDURE Divide(
        IN numerator INT,
        IN denominator INT,
        OUT result DOUBLE
    )

    BEGIN
        DECLARE division_by_zero CONDITION FOR SQLSTATE '22012';
        DECLARE CONTINUE HANDLER FOR division_by_zero RESIGNAL SET MESSAGE_TEXT = 'Division by zero / Denominator cannot be zero';

        IF denominator = 0 THEN
            SIGNAL division_by_zero;
        ELSE
            SET result := numerator / denominator;
        END IF;

    END;
DELIMITER;

CALL Divide(10, 0, @result);

CALL Divide(10, 2, @result);
SELECT @result AS Result;