DROP PROCEDURE IF EXISTS createEmailList;

DELIMITER$$
    CREATE PROCEDURE createEmailList(
        INOUT emailList varchar(4000)
    )

    BEGIN
        DECLARE finished INTEGER DEFAULT 0;
        DECLARE emailAddress varchar(100) DEFAULT "";

    	-- declare cursor for employee email
        DECLARE curEmail CURSOR FOR SELECT email FROM employees ORDER BY email DESC;
 
    	-- declare NOT FOUND handler
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

        OPEN curEmail;

        getEmail: LOOP
            FETCH curEmail INTO emailList;
            IF finished = 1 THEN
                LEAVE getEmail;
            END IF;

            -- build email list
            SET emailList = CONCAT(emailAddress, ";", emailList);

        END LOOP getEmail;

        CLOSE curEmail;

    END$$

DELIMITER;

SET @emailList = "";
CALL createEmailList(@emailList);

SELECT @emailList;

-- abow@classicmodelcars.com

-- Loop to the last email, so the last email is the result appear
SELECT email FROM employees ORDER BY email DESC;