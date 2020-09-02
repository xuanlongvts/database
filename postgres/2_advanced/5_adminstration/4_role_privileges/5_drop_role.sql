-- DROP ROLE [IF EXISTS] target_role;
/*
In this syntax:

Specify the name of the role that you want to remove after the DROP ROLE keywords.
Use the IF EXISTS option if you want PostgreSQL to issue a notice instead of an error when you remove a role that does not exist.
To remove a superuser role, you need to be a superuser. To drop non-superuser roles, you need to have the CREATEROLE privilege.

When you remove a role referenced in any database, PostgreSQL will raise an error. In this case, you have to take two steps:

First, either remove the database objects owned by the role using the DROP OWNED statement or reassign the ownership of 
the database objects to another role REASSIGN OWNED.

Second, revoke any permissions granted to the role.
The REASSIGN OWNED statement reassigns the ownership of all dependent objects of a target role to another role. 
Because the REASSIGN OWNED statement can only access objects in the current database, you need to execute this statement 
in each database that contains objects owned by the target role.

After transferring the ownerships of objects to another role, you need to drop any remaining objects owned by the target role by executing 
the DROP OWNED statement in each database that contains objects owned by the target role.

In other words, you should execute the following statements in sequence to drop a role:

-- execute these statements in the database that contains
-- the object owned by the target role
REASSIGN OWNED BY target_role TO another_role;
DROP OWNED BY target_role;

-- drop the role
DROP ROLE target_role;
*/

-- First, login to PostgreSQL using the postgres role:

-- Second, create a new role called alice:
CREATE ROLE alice_1
WITH LOGIN PASSWORD '12345';

-- Third, grant createdb privilege to alice:
ALTER ROLE alice_1 CREATEDB;

-- Fourth, create a new database called sales_1:
CREATE DATABASE sales_1;

-- Step 2. Using the new role to create database objects
CREATE TABLE IF NOT EXISTS customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
-- Third, show the table list in the sales database: \dt in comman line

-- Step 3. Removing the role alice_1
-- First, login to the PostgreSQL database server using the postgres role:
/*
ERROR:  role "alice_1" cannot be dropped because some objects depend on it
DETAIL:  owner of database sales_1
owner of sequence customers_id_seq
owner of table customers
SQL state: 2BP01
*/
DROP ROLE alice_1;

-- Third, switch to the sales database:
-- Fourth, reassign owned objects of alice to postgres:
REASSIGN OWNED BY alice_1 TO postgres;

-- Fifth, drop owned objects by alice:
DROP OWNED BY alice_1;

-- Sixth, drop the role alice:
DROP ROLE alice_1;