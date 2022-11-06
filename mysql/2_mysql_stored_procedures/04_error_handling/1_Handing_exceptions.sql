CREATE TABLE SupplierProducts(
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId, productId)
);

DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER$$
    CREATE PROCEDURE InsertSupplierProduct(
        IN inSupplierId INT,
        IN inProductId INT
    )
    BEGIN
        -- exit if the duplicate key occurs
        DECLARE CONTINUE HANDLER FOR 1062
        -- DECLARE EXIT HANDLER FOR 1062
        BEGIN
            SELECT CONCAT('Duplicate key (', inSupplierId, ', ', inProductId, ') occurred') AS message;
        END;

        -- insert a new row into the SupplierProducts
        INSERT INTO SupplierProducts(supplierId, productId)
        VALUES (inSupplierId, inProductId);

        -- return the products supplied by the supplier id
        SELECT COUNT(*)
        FROM SupplierProducts
        WHERE supplierId = inSupplierId;

    END$$
DELIMITER;

CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);

SELECT * FROM SupplierProducts;

CALL InsertSupplierProduct(1,3);

TRUNCATE TABLE SupplierProducts;

--------------- multiple handlers that handle the same error
DROP PROCEDURE IF EXISTS InsertSupplierProduct_1;

DELIMITER $$

    CREATE PROCEDURE InsertSupplierProduct_1(
        IN inSupplierId INT, 
        IN inProductId INT
    )
    BEGIN
        -- exit if the duplicate key occurs
        DECLARE EXIT HANDLER FOR 1062 SELECT "Duplicate keys error encountered" Message;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message;
        DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;


        -- insert a new row into the SupplierProducts
        INSERT INTO SupplierProducts(supplierId,productId)
        VALUES(inSupplierId,inProductId);
        
        -- return the products supplied by the supplier id
        SELECT COUNT(*) 
        FROM SupplierProducts
        WHERE supplierId = inSupplierId;

    END$$
DELIMITER;

CALL InsertSupplierProduct_1(1,1); -- Duplicate keys error encountered because  InsertSupplierProduct had created


--- Using a named error condition
DELIMITER$$
    CREATE PROCEDURE TestProc(tb VARCHAR(100))
    BEGIN

        DECLARE EXIT HANDLER FOR 1146
        BEGIN
            SELECT CONCAT('Please create table ', tb, ' first') AS Message;
        END;
            
        SELECT * FROM tb;
    END$$
DELIMITER;

CALL TestProc("abcd");