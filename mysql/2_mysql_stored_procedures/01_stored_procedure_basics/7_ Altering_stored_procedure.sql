DELIMITER$$
CREATE PROCEDURE GetOrderAmount()
BEGIN
    SELECT SUM(quantityOrdered * priceEach)
    FROM orderDetails;

END$$

DELIMITER;

/*
Sometimes, you may want to alter a stored procedure by adding or removing parameters or even changing its body.

Fortunately, MySQL does not have any statement that allows you to directly modify the parameters and body of the stored procedure.

To make such changes, you must drop ad re-create the stored procedure using the DROP PROCEDURE and CREATE PROCEDURE statements.


https://www.mysqltutorial.org/mysql-stored-procedure/alter-stored-procedure/

*/

CAlL GetOrderAmount();
SHOW WARNINGS;

CALL GetOrderAmount(10100);