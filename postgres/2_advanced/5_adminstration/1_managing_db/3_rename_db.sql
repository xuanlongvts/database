/*
1. Disconnect from the database that you want to rename and connect to a different database.
2. Check and terminate all active connections to the database that you want to rename.
3. Use the ALTER DATABASE statement to rename the database to the new one.
*/

-- all
CREATE DATABASE db_test; 

-- To rename the db_test database to newdb, you follow these steps:
/*
First, disconnect from the database that you want to rename and connect to another database e.g., postgres. 
If you use psql tool, you can use the following command to connect to the postgres database:

db=# \connect postgres
*/

-- refresh db_test on pg Admin

SELECT * FROM pg_stat_activity
WHERE datname = 'db_test';

-- As you can see clearly from the output, there is only one connection to the db database.

-- Then, terminate all the connections to the db database by using the following statement:
-- Disconnect on pg Admin.
SELECT pg_terminate_backend(pid) FROM pg_stat_activity
WHERE datname = 'db_test';

-- After that, rename the db database to newdb using the ALTER DATABASE RENAME TO statement as follows:
ALTER DATABASE db_test
RENAME TO db_newdb;
