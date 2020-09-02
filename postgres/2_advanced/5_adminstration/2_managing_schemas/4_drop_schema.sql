/*
DROP SCHEMA [IF EXISTS] schema_name 
[ CASCADE | RESTRICT ];
*/

-- PostgreSQL allows you to drop multiple schemas at the same time by using a single DROP SCHEMA statement:
/*
DROP SCHEMA [IF EXISTS] schema_name1 [,schema_name2,...] 
[CASCADE | RESTRICT];
*/

-- 1) Using DROP SCHEMA statement to remove an empty schema example
DROP SCHEMA IF EXISTS accounting;

-- 2) Using DROP SCHEMA statement to drop multiple schemas example
DROP SCHEMA IF EXISTS finance, marketing;

-- 3) Using DROP SCHEMA statement to remove a non-empty schema examples
-- Error - cannot drop schema scm because other objects depend on it
DROP SCHEMA IF EXISTS scm;

-- with cascade
DROP SCHEMA IF EXISTS scm CASCADE;

DROP SCHEMA IF EXISTS sales CASCADE;