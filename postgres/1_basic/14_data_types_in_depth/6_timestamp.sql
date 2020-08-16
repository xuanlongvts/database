/*
PostgreSQL provides you with two temporal data types for handling timestamp:

timestamp: a timestamp without timezone one.
timestamptz: timestamp with a timezone.

The timestamp datatype allows you to store both date and time. However, it does not have any time zone data. 
It means that when you change the timezone of your database server, the timestamp value stored in the database will not change automatically.

The timestamptz datatype is the timestamp with the time zone. The timestamptz datatype is a time zone-aware date and time data type.

PostgreSQL stores the timestamptz in UTC value. 

When you insert a value into a timestamptz column, PostgreSQL converts the timestamptz value into a UTC value and stores the UTC value in the table.
When you query timestamptz from the database, PostgreSQL converts the UTC value back to the time value of the timezone set by 
the database server, the user, or the current database connection.
Notice that both timestamp and timestamptz uses 8 bytes for storing the timestamp values as shown in the following query:

*/

SELECT typname, typlen
FROM pg_type
WHERE typname
~'^timestamp'

--- Example
CREATE TABLE
IF NOT EXISTS timestamp_demo
(
    ts TIMESTAMP,
    tstz TIMESTAMPTZ
);

SELECT *
FROM timestamp_demo;

SET timezone
='America/Los_Angeles';

SHOW TIMEZONE;

INSERT INTO timestamp_demo
    (ts, tstz)
VALUES('2016-06-22 19:10:25-07', '2016-06-22 19:10:25-07');

INSERT INTO timestamp_demo
    (ts, tstz)
VALUES('2020-08-20 19:10:25-07', '2020-08-20 19:10:25-07');

SET timezone
= 'America/New_York';

-- PostgreSQL timestamp functions
SELECT NOW();

SELECT CURRENT_TIMESTAMP;

SELECT TIMEOFDAY();

-- Convert between timezones
SELECT timezone('America/New_York', '2016-06-01 00:00');


SELECT *
FROM pg_timezone_names;

SELECT timezone('America/New_York','2016-06-01 00:00'
::timestamptz);
