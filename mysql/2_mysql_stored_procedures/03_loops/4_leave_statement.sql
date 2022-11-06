DROP PROCEDURE IF EXISTS LeaveDemo;

DELIMITER$$
    CREATE PROCEDURE LeaveDemo(OUT resultt VARCHAR(100))
    BEGIN
        DECLARE counter INT DEFAULT 1;
        DECLARE times INT;

        -- generate a random integer between 4 and 10
        SET times = FLOOR(RAND() * (10 - 4 + 1) + 4);
        SET resultt = '';

        disp: LOOP
            
            -- exit the loop if counter equals times
            IF counter = times THEN
                LEAVE disp;
            END IF;
            
            -- concatenate counters into the result
            SET resultt = concat(resultt, counter, ",");

            SET counter = counter + 1;
        END LOOP;
    END$$
DELIMITER;

CALL LeaveDemo(@result);
SELECT @result;