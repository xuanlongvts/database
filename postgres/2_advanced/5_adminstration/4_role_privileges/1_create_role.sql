/*
PostgreSQL uses roles to represent user accounts. It doesn’t use the user concept like other database systems.

Typically, roles can log in are called login roles. They are equivalent to users in other database systems.

When roles contain other roles, they are call group roles.

CREATE ROLE role_name;

*/
CREATE ROLE bob;

-- To get all roles in the current PostgreSQL database server, you can query them from the pg_roles system catalog as follows:
-- Noice that the roles that start with with pg_ are system roles.
SELECT rolname FROM pg_roles;

-- If you use the psql tool, you can use the \du command to list all existing roles in the current PostgreSQL database server.

/*
As you can see clearly from the output, the role bob cannot login.

To allow the role bob to log in to the PostgreSQL database server, you need to add the LOGIN attribute to it.

Role attributes
The attributes of a role define privileges for that role including login, superuser, database creation, role creation, password, etc:

CREATE ROLE name WITH option;

In this syntax, the WITH keyword is optional. And the option can be one or more attributes including SUPER, CREATEDB, CREATEROLE, etc.
*/

-- 1) Create login roles
CREATE ROLE alice
LOGIN PASSWORD 'demo123';

-- Now, you can use the role alice to log in to the PostgreSQL database server using the psql client tool:

-- 2) Create superuser roles
CREATE ROLE longlx4
SUPERUSER
LOGIN PASSWORD 'demo123';

-- The superuser can override all access restrictions within the database therefore you should create this role only when needed.
-- Notice that you must be a superuser in order to create another superuser role.

-- 3) Create roles that can create databases
-- If you want to create roles that have the database creation privilege, you use the CREATEDB attribute:
CREATE ROLE dba
CREATEDB
LOGIN PASSWORD 'demo123';

-- 4) Create roles with validity period
-- To set a date and time after which the role’s password is no longer valid, you use the valid until attribute:
-- VALID UNTIL 'timestamp';

-- For example, the following statement creates a dev_api role with password valid until the end of 2029:
CREATE ROLE dev_api WITH
LOGIN PASSWORD 'demo123'
VALID UNTIL '2030-01-01';
-- After one second tick in 2030, the password of dev_api is no longer valid.

-- 5) Create roles with connection limit
-- CONNECTION LIMIT connection_count
CREATE ROLE api
LOGIN PASSWORD 'demo123'
CONNECTION LIMIT 1000;