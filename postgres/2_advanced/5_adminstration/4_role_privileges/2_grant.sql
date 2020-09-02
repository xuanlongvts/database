/*
After creating a role with the LOGIN attribute, the role can log in to the PostgreSQL database server. 
However, it cannot do anything to the database objects like tables, views, functions, etc.

For example, the user role cannot select data from a table or execute a specific function.

To allow the user role to interact with database objects, you need to grant privileges on the database objects to the user role by using the GRANT statement.

The following shows the simple form of the GRANT statement that grants one or more privileges on a table to a role:

GRANT privilege_list | ALL 
ON  table_name
TO  role_name;

First, specify the privilege_list that can be SELECT, INSERT, UPDATE, DELETE, TRUNCATE, etc. You use the ALL option to grant all privileges on a table to the role.
Second, specify the name of the table after the ON keyword.
Third, specify the name of the role to which you want to grant privileges.
*/
CREATE ROLE joe
LOGIN PASSWORD 'demo123';

CREATE TABLE candidates(
    candidate_id SERIAL PRIMARY KEY,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(25) not null
);

-- Fourth, use the role joe to log in to the PostgreSQL database server in a separate session.
-- Fifth, attempt to select data from the candidates table from the joe‘s session:
-- permission denied for table candidates
SELECT * FROM candidates;

-- To grant the SELECT privilege on the candidates table to the role joe, you execute the following GRANT statement in the postgres‘ session:
-- run on pg Admin
GRANT SELECT 
ON candidates
TO joe;

-- ERROR:  permission denied for table candidates
INSERT INTO candidates(first_name, last_name, email, phone)
VALUES('Joe','Com','joe.com@example.com','408-111-2222');

-- run on pg Admin
GRANT INSERT, UPDATE, DELETE 
ON candidates
TO joe;

-- Now, joe can insert data into the candidates table. In addition, it can update or delete data from the table.

-- More PostgreSQL GRANT examples
-- Grant all privileges on a table to a role
GRANT ALL
ON candidates
TO joe;

-- Grant all privileges on all tables in a schema to a role
GRANT ALL
ON ALL TABLES
IN SCHEMA "public"
TO joe;

-- Grant SELECT on all tables
-- Sometimes, you want to create a readonly role that can only select data from all tables in a specified schema.
GRANT SELECT
ON ALL TABLES
IN SCHEMA "public"
TO joe;