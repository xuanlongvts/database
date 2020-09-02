/*
It is easier to manage roles as a group so that you can grant or revoke privileges from a group as a whole instead of doing it on an individual role.

Typically, you create a role that represents a group and then grants membership in the group role to individual roles.

By convention, a group role does not have the LOGIN privilege. It means that you will not be able to use the group role to log in to PostgreSQL.

To create a group role, you use the CREATE ROLE statement as follows:

CREATE ROLE group_role_name;
*/
CREATE ROLE sales;

-- When you use the \du command in the psql tool, you will see that the group roles are listed together with user roles:
-- sales cannot login

-- To add a role to a group role, you use the following form of the GRANT statement:
-- GRANT group_role to user_role;
GRANT sales TO john;

-- To remove a user role from a group role, you use REVOKE statement:
-- REVOKE group_role FROM user_role;
REVOKE sales FROM john;

-- Notice that PostgreSQL does not allow you to have circular membership loops, in which a role is the member of another role and vice versa.

/*
PostgreSQL Role Membership example
A role can use privileges of the group role in the following ways:

First, a role with the INHERIT attribute will automatically have privileges of the group roles of which it is the member, including any privileges inherited by that role.

Second, a role can use the SET ROLE statement to temporarily become the group role. The role will have privileges of the group role rather than its original login role. 
Also, the objects are created by the role are owned by the group role, not the login role.
*/

-- Step 1. Setting up a sample database and tables
-- 1) Login to the PostgreSQL using the postgres database.
-- 2) Create a new database called corp:
CREATE DATABASE corp;

-- 3) Switch to the corp database: \c corp in command line

-- 4) Create the contacts table:
CREATE TABLE IF NOT EXISTS contacts(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

-- 5) Create the forecasts table:
CREATE TABLE forecasts(
    year int,
    month int,
    amount numeric
);

-- Step 2. Setting roles and group roles
-- 1) Create a role jane that can log in with a password and inherit all privileges of group roles of which it is a member:
CREATE ROLE jane INHERIT
LOGIN PASSWORD '12345'; 

-- 2) Grant the select on the forecasts table to jane:
GRANT SELECT ON forecasts TO jane;

-- 3) Use the \z command to check the grant table:

-- 4) Create the marketing group role:
CREATE ROLE marketing NOINHERIT;

-- 5) Create the planning group role:
CREATE ROLE planning NOINHERIT;

-- 6) Grant all privileges on contacts table to marketing:
GRANT ALL ON contacts TO marketing;

-- 7) Grant all privileges on forecasts table to planning:
GRANT ALL ON forecasts TO planning;

-- 8) Add jane as a member of marketing:
GRANT marketing TO jane;

-- 9) Add planning as a member of marketing:
GRANT marketing TO planning;

---------------------------
-- Step 3. Using the roles
-- 1) If you connect to PostgreSQL using the role jane , you will have privileges directly granted to jane plus any privileges granted 
-- to marketing because jane inherits marketing’s privileges: psql -U jane -d corp

-- 2) It’ll prompt you for the jane’s password.

-- 3) The role jane can select data from the forecasts table:
SELECT * FROM forecasts;

-- 4) And insert a row into the contacts table:
INSERT INTO contacts(name, phone) 
VALUES ('Jone Doe','408-102-3459');

-- 5) However, jane cannot insert a row into the forecasts table:
INSERT INTO forecasts(year, month, amount) VALUES(2020,1,1000);

-- 6) After executing the following SET ROLE statement:
SET ROLE planning;

-- 7) The role jane will have privileges granted to planning, not the ones that granted directly to jane or indirectly to marketing.

-- 8) Now, jane can insert a row into the forecasts table:

-- 9) If jane attempts to select data from the contacts table, it will fail because the role planning has no privilege on the contacts table:
-- ERROR:  permission denied for table contacts
SELECT * FROM contacts;

-- To restore the original privileges of jane, you use the RESET ROLE statement:
RESET ROLE;
