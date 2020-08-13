DROP TABLE IF EXISTS customerss
CASCADE;

CREATE TABLE
IF NOT EXISTS customerss
(
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR NOT NULL
);

ALTER TABLE customerss
ADD COLUMN phone VARCHAR;

ALTER TABLE customerss
ADD COLUMN fax VARCHAR;

ALTER TABLE customerss
ADD COLUMN email VARCHAR;

INSERT INTO customerss
    (customer_name)
VALUES
    ('Apple'),
    ('Samsung'),
    ('Google');

SELECT *
FROM customerss;

-- ERROR: column "contact_name" contains null values
ALTER TABLE customerss
ADD COLUMN contact_name VARCHAR NOT NULL;

-- Fix
ALTER TABLE customerss
ADD COLUMN contact_name VARCHAR;

UPDATE customerss
SET contact_name = 'John Doe'
WHERE id = 1;

UPDATE customerss
SET contact_name = 'Mary Doe'
WHERE id = 2;

UPDATE customerss
SET contact_name = 'Lily Bush'
WHERE id = 3;

ALTER TABLE customerss
ALTER COLUMN contact_name
SET
NOT NULL;