/*
ALTER SCHEMA schema_name 
RENAME TO new_name;
*/
-- Besides renaming a schema, the ALTER SCHEMA also allows you to change the owner of a schema to the new one as shown in the following statement:
/*
ALTER SCHEMA schema_name 
OWNER TO { new_owner | CURRENT_USER | SESSION_USER};
*/

-- 1) Using ALTER SCHEMA statement to rename a schema examples
ALTER SCHEMA doe
RENAME TO finance;

ALTER SCHEMA john
RENAME TO accounting;

-- 2) Using ALTER SCHEMA statement to change the owner of a schema example
ALTER SCHEMA finance
OWNER TO postgres;

SELECT * FROM pg_catalog.pg_namespace
WHERE nspacl IS NULL AND nspname NOT LIKE 'pg_%'
ORDER BY nspname;

ALTER SCHEMA accounting
OWNER TO postgres;