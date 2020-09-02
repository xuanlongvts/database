-- The REVOKE statement revokes previously granted privileges on database objects from a role.
/*
REVOKE privilege | ALL
ON TABLE table_name |  ALL TABLES IN SCHEMA schema_name
FROM role_name;
*/

-- Step 1. Create a role and grant privileges
CREATE ROLE jim
LOGIN PASSWORD 'demo123';

-- Second, grant all privileges on the film table to the role jim:
GRANT ALL
ON candidates
TO jim;

-- Finally, grant the SELECT privilege on the actor table to the role jim:
GRANT SELECT
ON candidates
TO jim;

-- test
SELECT * FROM candidates;

-- Step 2. Revoke privileges from a role
REVOKE SELECT
ON candidates
FROM jim;

-- To revoke all privileges on the candidates table from the role jim, you use REVOKE statement with the ALL option like this:
REVOKE ALL
ON candidates
FROM jim;