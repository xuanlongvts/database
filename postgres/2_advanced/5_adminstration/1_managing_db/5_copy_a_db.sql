/*
CREATE DATABASE targetdb 
WITH TEMPLATE sourcedb;

This statement copies the sourcedb to the targetdb. For example, to copy the dvdrental sample database to the dvdrental_test database, 
you use the following statement:
*/

-- Error source database "dvdrental" is being accessed by other users
CREATE DATABASE dvdrental_test
WITH TEMPLATE dvdrental;

-- The following query returns the active connections:
SELECT pid, usename, client_addr
FROM pg_stat_activity
WHERE datname = 'dvdrental';

-- To terminate the active connections to the dvdrental database, you use the following query:
SELECT pg_terminate_backend (pid)
FROM pg_stat_activity
WHERE datname = 'dvdrental';

-- PostgreSQL copy database from a server to another
/*
There are several ways to copy a database between PostgreSQL database servers.

If the size of the source database is big and the connection between the database servers is slow, you can dump the source database to a file, 
copy the file to the remote server, and restore it:
*/

