use classicmodels;

DROP TABLE IF EXISTS calendars;
CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);

-- InsertCalendar PROCEDURE
DROP PROCEDURE IF EXISTS InsertCalendar;

DELIMITER $$
    CREATE PROCEDURE InsertCalendar(dt DATE)
    BEGIN
        INSERT INTO calendars(
            fulldate,
            day,
            month,
            quarter,
            year
        )
        VALUES(
            dt, 
            EXTRACT(DAY FROM dt),
            EXTRACT(MONTH FROM dt),
            EXTRACT(QUARTER FROM dt),
            EXTRACT(YEAR FROM dt)
        );
    END$$
DELIMITER;

CALL InsertCalendar('2021-01-01');

-- LoadCalendars
DELIMITER$$
    CREATE PROCEDURE LoadCalendars(startDate DATE, day INT)
    BEGIN
        DECLARE counter INT DEFAULT 1;
        DECLARE dt DATE DEFAULT startDate;

        WHILE counter <= day DO
            CALL InsertCalendar(dt);

            SET counter = counter + 1;
            SET dt = DATE_ADD(dt, INTERVAL 1 day);
        END WHILE;
    END$$
DELIMITER;

TRUNCATE TABLE calendars;
CALL LoadCalendars('2022-11-01', 32); -- 11/2022 just have 30 days, so we pass 32, my sql will insert 2 days of December
CALL LoadCalendars('2022-12-03', 30);

SELECT * FROM calendars;
