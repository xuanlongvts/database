SHOW FUNCTION STATUS;

SHOW FUNCTION STATUS WHERE db = 'classicmodels';

SHOW FUNCTION STATUS LIKE '%Customer%';

/*
Listing stored functions using the data dictionary

MySQL data dictionary has a routines table that stores information about the stored functions of all databases in the current MySQL server.
*/
SELECT routine_name
FROM information_schema.routines
WHERE routine_type = "FUNCTION" AND routine_schema = "classicmodels";
