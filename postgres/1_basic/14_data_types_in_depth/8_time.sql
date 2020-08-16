DROP TABLE IF EXISTS shifts_time;
CREATE TABLE
IF NOT EXISTS shifts_time
(
    id SERIAL PRIMARY KEY,
    shift_name VARCHAR NOT NULL,
    start_at TIME NOT NULL,
    end_at TIME NOT NULL
);

INSERT INTO shifts_time
    (shift_name, start_at, end_at)
VALUES
    ('Morning', '08:00:00', '12:00:00'),
    ('Afternoon', '13:00:00', '17:00:00'),
    ('Night', '18:00:00', '22:00:00');

SELECT *
FROM shifts_time;


-- Notice that without specifying the precision, the CURRENT_TIME function returns a time value with the full available precision.
SELECT CURRENT_TIME;

SELECT CURRENT_TIME
(2);

-- Similarly, to get the local time with a specific precision, you use the LOCALTIME(precision) function:
SELECT LOCALTIME(0);

-- Converting time to a different time zone;
SELECT LOCALTIME AT TIME ZONE 'UTC-7';

-- Extracting hours, minutes, seconds from a time value
SELECT LOCALTIME,
    EXTRACT (HOUR FROM LOCALTIME) AS hours,
    EXTRACT (MINUTE FROM LOCALTIME) AS minutes,
    EXTRACT (SECOND FROM LOCALTIME) AS seconds,
    EXTRACT (MILLISECONDS FROM LOCALTIME) AS milliseconds;

-- Arithmetic operations on time values
SELECT TIME '10:00'
- TIME '02:00' AS result;

SELECT LOCALTIME + INTERVAL '2 hours'
AS result;