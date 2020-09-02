-- DROP TABLESPACE [IF EXISTS] tablespace_name;

-- cd Download and mkdir postgres_data_tablespace_demo
-- pwd to get path /Users/lelong/Downloads/postgres_data_tablespace_demo

-- First, create a new tablespace named demo and maps it to the /Users/lelong/Downloads/postgres_data_tablespace_demo directory.
CREATE TABLESPACE tb_space_demo
LOCATION '/Users/lelong/Downloads/postgres_data_tablespace_demo';

-- Second, create a new database named db_demo and set its tablespace to demo:
CREATE DATABASE db_demo
TABLESPACE = tb_space_demo;

-- Third, create a new table named testin the db_demo and set it tablespaceto demo:
CREATE TABLE tbl_test(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
) TABLESPACE tb_space_demo;

-- The following statement returns all objects in the demo tablespace:
SELECT * FROM pg_class;
SELECT * FROM pg_tablespace;

SELECT ts.spcname, cl.relname
FROM pg_class cl
JOIN pg_tablespace ts ON cl.reltablespace = ts.oid
WHERE ts.spcname = 'tb_space_demo';

-- Fourth, try to drop the tb_space_demo tablespace:
-- ERROR:  could not open directory "pg_tblspc/43688/PG_12_201909212/.DS_Store": Not a directory
DROP TABLESPACE tb_space_demo;

-- 
DROP TABLE tbl_test;

-- Instead of deleting the database, you can move it to another tablespace e.g.,  pg_default by using the ALTER TABLE statement as follows:
ALTER DATABASE db_demo
SET TABLESPACE = pg_default;