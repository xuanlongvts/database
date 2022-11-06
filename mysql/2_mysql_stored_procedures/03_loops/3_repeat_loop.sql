DROP PROCEDURE IF EXISTS RepeatDemo;

DELIMITER$$
    CREATE PROCEDURE RepeatDemo()

    BEGIN
        DECLARE counter INT DEFAULT 1;
        DECLARE result VARCHAR(100) DEFAULT '';
        DECLARE comma CHARACTER DEFAULT ',';

        REPEAT
            IF counter >= 9 THEN
                SET comma = '';
            END IF;

            SET result = CONCAT(result, counter, comma);
            SET counter = counter + 1;

            UNTIL counter >= 10
        END REPEAT;

        SELECT result;
    END$$

DELIMITER;

CALL RepeatDemo();