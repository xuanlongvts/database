-- CREATE SCHEMA [IF NOT EXISTS] schema_name;

-- You can also create a schema for a user:
-- CREATE SCHEMA [IF NOT EXISTS] AUTHORIZATION username;
-- In this case, the schema will have the same name as the username;

/*
PostgreSQL also allows you to create a schema and a list of objects such as tables and views using a single statement as follows:

CREATE SCHEMA schema_name
    CREATE TABLE table_name1 (...)
    CREATE TABLE table_name2 (...)
    CREATE VIEW view_name1
        SELECT select_list FROM table_name1;
*/

-- 1) Using CREATE SCHEMA to create a new schema example
CREATE SCHEMA marketing;

-- The following statement returns all schemas from the current database:
SELECT * FROM pg_catalog.pg_namespace;

-- 2) Using CREATE SCHEMA to create a schema for a user example
CREATE ROLE john
LOGIN
PASSWORD 'Postgr@s321!';

-- Second, create a schema for john:
CREATE SCHEMA AUTHORIZATION john;

-- Third, create a new schema called doe that will be owned by john:
CREATE SCHEMA IF NOT EXISTS doe AUTHORIZATION john;

-- 3) Using CREATE SCHEMA to create a schema and its objects example
/*
The following example uses the CREATE SCHEMA statement to create a new schema named scm. 
It also creates a table named deliveries and a view named delivery_due_list that belongs to the scm schema:
*/
CREATE SCHEMA scm
    CREATE TABLE deliveries(
        id SERIAL PRIMARY KEY,
        customer_id INT NOT NULL,
        ship_date DATE NOT NULL
    )
    CREATE VIEW delivery_due_list AS
        SELECT id, ship_date
        FROM deliveries
        WHERE ship_date <= CURRENT_DATE;