/*
The pg_indexes view allows you to access useful information on each index in the PostgreSQL database. The pg_indexes view consists of five columns:

schemaname: stores the name of the schema that contains tables and indexes.
tablename: stores name of the table to which the index belongs.
indexname: stores name of the index.
tablespace: stores name of the tablespace that contains indexes.
indexdef: stores index definition command in the form of CREATE INDEX statement.
*/
SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;

-- To show all the indexes of a table, you use the following statement:
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'customer';

-- If you want to get a list of indexes for tables whose name start with the letter c, you can use the following query:
SELECT * FROM pg_indexes
WHERE tablename LIKE 'c%'
ORDER BY tablename, indexdef;

-- PostgreSQL List Indexes using psql command
-- \d table_name
