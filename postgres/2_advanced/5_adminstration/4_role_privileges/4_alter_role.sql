-- To change attributes of a role, you use the following form of ALTER ROLE statement:
-- ALTER ROLE role_name [WITH] option;
/*
SUPERUSER | NOSUPERUSER – determine if the role is a superuser or not.
CREATEDB | NOCREATEDB– allow the role to create new databases.
CREATEROLE | NOCREATEROLE – allow the role to create or change roles.
INHERIT | NOINHERIT – determine if the role to inherit privileges of roles of which it is a member.
LOGIN | NOLOGIN – allow the role to log in.
REPLICATION | NOREPLICATION – determine if the role is a replication roles.
BYPASSRLS | NOBYPASSRLS – determine if the role to by pass a row-level security (RLS) policy.
CONNECTION LIMIT limit – specify the number of concurrent connection a role can made, -1 means unlimited.
PASSWORD 'password' | PASSWORD NULL – change the role’s password.
VALID UNTIL 'timestamp' – set the date and time after which the role’s password is no long valid.

The following rules are applied:

Superusers can change any of those attributes for any role.
Roles that have the CREATEROLE attribute can change any of these attributes for only non-superusers and no-replication roles.
Ordinal roles can only change their passwords.
*/

-- First, log in to the PostgreSQL using the postgres role.
CREATE ROLE calf LOGIN PASSWORD 'demo123';

-- Second, create a new role called calf using the CREATE ROLE statement:
ALTER ROLE calf SUPERUSER;
-- In command line enter \du calf

-- The following statement sets the password of the role calf to expire until the end of 2050:

ALTER ROLE calf VALID UNTIL '2050-01-01';

-- Using the PostgreSQL ALTER ROLE to rename roles
-- ALTER ROLE role_name TO new_name;
ALTER ROLE calf RENAME TO elephant;

-- Using the PostgreSQL ALTER ROLE to change a role’s session default for a configuration variable
-- The following ALTER ROLE statement changes the role’s session default for a configuration variable:
/*
ALTER ROLE role_name | CURRENT_USER | SESSION_USER | ALL
[IN DATABASE database_name]
SET configuration_param = { value | DEFAULT }

First, specify the name of the role that you want to modify the role’s session default, or use the CURRENT_USER, 
or SESSION_USER. You use the ALL option to change the settings for all roles.

Second, specify a database name after the IN DATABASE keyword to change only for sessions in the named database.
In case you omit the IN DATABASE clause, the change will be applied to all databases.

Third, specify the configuration parameter and the new value in the SET clause.

Superusers can change session defaults of any roles. Roles with the CREATEROLE attribute can set the defaults for non-superuser roles. 
Ordinary roles can only set defaults for themselves. Only superusers can change a setting for all roles in all databases.
*/

/*
The following example uses the ALTER ROLE to give the role elephant a non-default, 
database-specific setting of the client_min_messages parameter:
*/
ALTER ROLE elephant
IN DATABASE dvdrental_test
SET client_min_messages = NOTICE;