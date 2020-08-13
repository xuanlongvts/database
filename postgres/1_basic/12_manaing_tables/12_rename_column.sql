DROP TABLE IF EXISTS customer_groups;
CREATE TABLE
IF NOT EXISTS customer_groups
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS customers_new;
CREATE TABLE
IF NOT EXISTS customers_new
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    email VARCHAR,
    group_id INT,
    FOREIGN KEY
(group_id) REFERENCES customer_groups
(id)
);

ALTER TABLE customer_groups
RENAME COLUMN group_name TO name;

DROP VIEW IF EXISTS customer_data;
CREATE VIEW customer_data
AS
    SELECT c.id, c.name, g.name customer_group
    FROM customers_new c INNER JOIN customer_groups g ON c.id = g.id;

-- rename name column
ALTER TABLE customers_new
RENAME COLUMN email TO contact_email;

ALTER TABLE customer_groups
RENAME COLUMN name TO group_name;

/*
In terminal Postgres enter   \d+ customer_data  to show structer change
*/

-- Rename multi
ALTER TABLE customers_new
RENAME COLUMN name TO customer_name;

ALTER TABLE customers_new
RENAME COLUMN phone TO contact_phone;