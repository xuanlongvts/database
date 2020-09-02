-- To access an object in a schema, you need to qualify the object by using the following syntax:
-- schema_name.object_name

-- Why do you need to use schemas
/*
Schemas allow you to organize database objects e.g., tables into logical groups to make them more manageable.
Schemas enable multiple users to use one database without interfering with each other.
*/

-- The public schema
/*
PostgreSQL automatically creates a schema called public for every new database. 
Whatever object you create without specifying the schema name, PostgreSQL will place it into this public schema. 
Therefore, the following statements are equivalent:

CREATE TABLE table_name(
    ...
);
and
CREATE TABLE public.table_name(
   ...
);
*/
SELECT current_schema();

-- The schema search path, 

--run on pg Admin
SHOW search_path;

/*
The "$user" specifies that the first schema that PostgreSQL will use to search for the object, which has the same name as the current user. 
For example, if you use the postgres user to login and access the staff table. 
PostgreSQL will search for the staff table in the postgres schema. 
If it cannot find any object like that, it continues to look for the object in the public schema.

The second element refers to the public schema as we have seen before.
*/
CREATE SCHEMA sales;

SET search_path TO sales, public;

CREATE TABLE IF NOT EXISTS staff_test_schema(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS staff_test_schema;

SELECT * FROM staff_test_schema;

-- or

SELECT * FROM sales.staff_test_schema;

-- PostgreSQL schemas and privileges
/*
Users can only access objects in the schemas that they own. It means they cannot access any objects in the schemas that do not belong to them.

To allow users to access the objects in the schema that they do not own, you must grant the USAGE privilege of the schema to the users:
*/
-- GRANT USAGE ON SCHEMA schema_name TO role_name;

/*
To allow users to create objects in the schema that they do not own, you need to grant them the CREATE privilege of the schema to the users:
*/
-- GRANT USAGE ON SCHEMA schema_name TO user_name;

-- Note that, by default, every user has the CREATE and USAGE on the public schema.

