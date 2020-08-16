/*
The interval values are very useful when doing date or time arithmetic. For example,
if you want to know the time of 3 hours 2 minutes ago at the current time of last year, you can use the following statement:
*/

SELECT NOW(), NOW() - INTERVAL '1 year 3 hours 20 minutes'
AS "3 hours 20 minutes of last year";

/*
ISO 8601 interval format. In addition to the verbose syntax above, PostgreSQL allows you to write the interval values using ISO 8601 
time intervals in two ways: format with designators and alternative format.

The ISO 8601 format with designators is like this:
P quantity unit [ quantity unit ...] [ T [ quantity unit ...]]

Abbreviation	Description
Y               Years
M	            Months (in the date part)
W	            Weeks
D	            Days
H	            Hours
M	            Minutes(in the time part)
S	            Seconds

Note that M can be months or minutes depending on whether it appears before or after the letter T.

For example, the interval of 6 years 5 months 4 days 3 hours 2 minutes 1 second can be written in the ISO 8601 designators format as follows:
P6Y5M4DT3H2M1S

It also must start with the letter P, and the letter T separates the date and time parts of the interval value. 
For example, the interval of 6 years 5 months 4 days 3 hours 2 minutes 1 second can be written in the ISO 8601 alternative form as:
P0006-05-04T03:02:01
*/

/*
PostgreSQL interval output format.

PostgreSQL provides four output formats: sql standard, postgres, postgresverbose, and iso_8601. 
PostgresQL uses the postgres style by default for formatting the interval values.

The following represents the interval of 6 years 5 months 4 days 3 hours 2 minutes 1 second in the four styles:

*/

SET intervalstyle
= 'sql_standard';
SELECT INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';

SET intervalstyle
= 'postgres';
SELECT INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';

SET intervalstyle
= 'postgres_verbose';
SELECT INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';

SET intervalstyle
= 'iso_8601';
SELECT INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';


-- PostgreSQL interval related operators and functions
SELECT INTERVAL '2h 50m'
+ INTERVAL '10m';

SELECT INTERVAL '2h 50m'
- INTERVAL '10m';

SELECT 600 * INTERVAL '1 minute';

-- Converting PostgreSQL interval to string TO_CHAR(interval,format)
SELECT TO_CHAR(INTERVAL '17h 20m 05s', 'HH24:MI:SS'
);

SELECT TO_CHAR(INTERVAL '17h 20m 05s', 'HH12:MI:SS'
);

-- Extracting data from a PostgreSQL interval  EXTRACT(field FROM interval)
SELECT EXTRACT(MINUTES FROM INTERVAL '5 hours 20 minutes'
);


/*
Adjusting interval values
-- PostgreSQL provides two functions justify_days and  justify_hours that allows you to adjust the interval of 30-day as 
one month and the interval of 24-hour as one day:
*/
SELECT justify_days(INTERVAL '30 days'
), justify_hours
(INTERVAL '24 hours');

/*
In addition, the justify_interval function adjusts interval using justifydays and  justifyhours with additional sign adjustments:
*/
SELECT justify_interval(INTERVAL '1 year - 1 hour'
);