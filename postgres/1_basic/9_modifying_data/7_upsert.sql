DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE,
    email VARCHAR NOT NULL,
    active bool NOT NULL DEFAULT true
);

INSERT INTO customers
    (name, email)
VALUES
    ('IBM', 'contact@ibm.com'),
    ('Microsoft', 'contact@microsoft.com'),
    ('Intel', 'contact@intel.com');

/*
INSERT INTO table_name
    (column_list)
VALUES(value_list)
ON CONFLICT target action;
*/

--
INSERT INTO customers
    (name, email)
VALUES
    ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT ON CONSTRAINT customers_name_key
DO NOTHING;

-- OR equivalent
INSERT INTO customers
    (name, email)
VALUES
    ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT
(name) 
DO NOTHING;

INSERT INTO customers
    (name, email)
VALUES
    ('Microsoft_1', 'hotline@microsoft.com')
ON CONFLICT ON CONSTRAINT customers_name_key
DO NOTHING RETURNING *;

/*
Suppose, you want to concatenate the new email with the old email when inserting a customer that already exists, in this case, 
you use the UPDATE clause as the action of the INSERT statement as follows:
*/

INSERT INTO customers
    (name, email)
VALUES
    ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT
(name)
DO
UPDATE SET email = EXCLUDED.email || ';' || customers.email
RETURNING *