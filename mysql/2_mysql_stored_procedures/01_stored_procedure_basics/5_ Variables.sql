DROP PROCEDURE IF EXISTS GetTotalOrder;

DELIMITER$$
CREATE PROCEDURE GetTotalOrder()
BEGIN
    DECLARE totalOrder, x, y INT DEFAULT 0;
    SELECT count(*)
    INTO totalOrder
    From orders;

    SET x = 10;
    SELECT totalOrder, x, y;

END$$
DELIMITER;

CALL `GetTotalOrder`;