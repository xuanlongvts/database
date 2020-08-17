/*
There are many cases that you want to convert a value of one data type into another. 
PostgreSQL provides you with the CAST operator that allows you to do this.

CAST( expression AS target_type );
*/
SELECT '100'
::INTEGER, '10-OCT-2020'::DATE;

-- 1) Cast a string to an integer example
SELECT CAST('100' AS INTEGER);

-- Error
SELECT CAST('100c' AS INTEGER);

-- 2) Cast a string to a date example
SELECT
    CAST('2020-10-01' AS DATE),
    CAST('2020-5-01' AS DATE);

-- 3) Cast a string to a double example
SELECT
    CAST('10.2' AS DOUBLE PRECISION);

-- 4) Cast a string to a boolean example
SELECT
    CAST ('true' AS BOOLEAN),
    CAST ('false' AS BOOLEAN),
    CAST ('t' AS BOOLEAN),
    CAST ('f' AS BOOLEAN);

-- 5) Convert a string to a timestamp example
SELECT '2019-06-15 14:30:20'
::TIMESTAMP;

-- 6) Convert a string to an interval example
SELECT '15 minutes'
::INTERVAL,
'2 hour'
::INTERVAL,
'1 day'
::INTERVAL,
'2 week'
::INTERVAL,
'3 month'
::INTERVAL;

-- 7) Using CAST with table data example
DROP TABLE IF EXISTS ratings;
CREATE TABLE
IF NOT EXISTS ratings
(
    id SERIAL PRIMARY KEY,
    rating VARCHAR
(1) NOT NULL
);

INSERT INTO ratings
    (rating)
VALUES
    ('A'),
    ('B'),
    ('C');

INSERT INTO ratings
    (rating)
VALUES
    (1),
    (2),
    (3);

SELECT *
FROM ratings;

/*
Now, we have to convert all values in the rating column into integers, all other A, B, C ratings will be displayed as zero. 
To do this, you use the CASE expression with the type CAST as shown in the following query:
*/
SELECT id,
    CASE
        WHEN rating~E'^\\d+$' THEN CAST (rating AS INTEGER)
    ELSE
        0
    END AS rating
FROM ratings;