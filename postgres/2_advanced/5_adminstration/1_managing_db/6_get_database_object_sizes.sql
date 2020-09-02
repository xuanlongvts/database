/*
To get the size of a specific table, you use the pg_relation_size() function. 
For example, you can get the size of the actor table in the dvdrental sample database as follows:
*/

SELECT pg_relation_size('actor');

/*
To make the result more human readable, you use the pg_size_pretty()function. 
The pg_size_pretty() function takes the result of another function and format it using bytes, kB, MB, GB or TB as appropriate.
*/

SELECT pg_size_pretty(pg_relation_size('actor'));

/*
The pg_relation_size() function returns the size of the table only, not included indexes or additional objects.

To get the total size of a table, you use the pg_total_relation_size() function. 
For example, to get the total size of the actor table, you use the following statement:
*/
SELECT pg_size_pretty(pg_total_relation_size('actor'));

/*
You can use the pg_total_relation_size() function to find the size of biggest tables including indexes.

For example, the following query returns top 5 biggest tables in the dvdrental database:
*/
SELECT 
    relname AS "realation",
    pg_size_pretty(
        pg_total_relation_size(C.oid)
    ) AS "total_size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (C.relnamespace = N.oid)
WHERE 
    nspname NOT IN (
        'pg_catalog',
        'information_schema'
    )
    AND C.relkind != 'i'
    AND nspname !~ '^pg_toast'
ORDER BY
    pg_total_relation_size(C.oid) DESC
LIMIT 10;

-- PostgreSQL database size
SELECT pg_size_pretty(
    pg_database_size('dvdrental')
);

-- To get the size of each database in the current database server, you use the following statement:
SELECT 
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM pg_database;

-- PostgreSQL index size
/*
To get total size of all indexes attached to a table, you use the pg_indexes_size() function.

The pg_indexes_size() function accepts the OID or table name as the argument and returns the total disk space used 
by all indexes attached of that table.
*/
SELECT pg_size_pretty(pg_indexes_size('actor'));

-- PostgreSQL tablespace size
/*
To get the size of a tablespace, you use the pg_tablespace_size() function. The pg_tablespace_size() 
function accepts a tablespace name and returns the size in bytes.
*/
SELECT pg_size_pretty(pg_tablespace_size('pg_default'));

-- PostgreSQL value size
-- To find how much space that needs to store a specific value, you use the pg_column_size() function, for examples:
SELECT pg_column_size(5::smallint);

SELECT pg_column_size(5::int);

SELECT pg_column_size(5::bigint);