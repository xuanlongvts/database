DROP TABLE IF EXISTS mailing_list;
CREATE TABLE
IF NOT EXISTS mailing_list
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    CHECK
(
        first_name !~ '\s'
        AND
        last_name !~ '\s'
    )
);

/*
In this table, both first_name and last_name columns do not accept null and spaces. Instead of defining the CHECK constraint, you can
create a contact_name domain and reuse it in multiple columns.

The following statement uses the CREATE DOMAIN to create a new domain called contact_name with the VARCHAR datatype and 
do not accept NULL and spaces:
*/
CREATE DOMAIN contact_name AS VARCHAR NOT NULL CHECK
(VALUE !~ '\s');

DROP TABLE IF EXISTS mailing_list_1;
CREATE TABLE
IF NOT EXISTS mailing_list_1
(
    id SERIAL PRIMARY KEY,
    first_name contact_name,
    last_name contact_name,
    email VARCHAR NOT NULL
);

-- Error PostgreSQL issued the following error because the first name contains a space:
INSERT INTO mailing_list_1
    (first_name, last_name, email)
VALUES('Jame V', 'Doe', 'jame.doe@example.com');

-- Success
INSERT INTO mailing_list_1
    (first_name, last_name, email)
VALUES('Jane', 'Doe', 'jane.doe@example.com');

SELECT *
FROM mailing_list_1;

-- To change or remove a domain, you use the ALTER DOMAIN or DROP DOMAIN respectively.

-- To view all domains in the current database, you use the \dD command as follows:

-- Getting domain information
SELECT typname
FROM pg_catalog.pg_type
    JOIN pg_catalog.pg_namespace
    ON pg_namespace.oid = pg_type.typnamespace
WHERE 
	typtype = 'd' and nspname = 'public';

-- PostgreSQL CREATE TYPE
-- Create a Composite Type
DROP TYPE IF EXISTS full_address;
CREATE TYPE full_address AS
(
    city VARCHAR
(100),
    stree VARCHAR
(255)
);

CREATE TABLE
IF NOT EXISTS shipping_type
(
    name VARCHAR
(50),
    address full_address
);

INSERT INTO shipping_type
    (name, address)
VALUES
    ('John', ('Northampton', 'Tower St')
),
('Tom', ROW
('Bracknell', 'Market St'));

SELECT *
FROM shipping_type;