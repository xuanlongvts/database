/*
CREATE DATABASE database_name
WITH
   [OWNER =  role_name]
   [TEMPLATE = template]
   [ENCODING = encoding]
   [LC_COLLATE = collate]
   [LC_CTYPE = ctype]
   [TABLESPACE = tablespace_name]
   [ALLOW_CONNECTIONS = true | false]
   [CONNECTION LIMIT = max_concurrent_connection]
   [IS_TEMPLATE = true | false ]
*/

-- 1) Create a database with default parameters
CREATE DATABASE db_sales;
-- in command line \l to check

-- 2) Create a database with some parameters
CREATE DATABASE db_hr
WITH
    ENCODING = 'UTF8'
    OWNER = postgres
    CONNECTION LIMIT = 100;