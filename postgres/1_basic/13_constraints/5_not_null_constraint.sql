DROP TABLE IF EXISTS invoices;
CREATE TABLE
IF NOT EXISTS invoices
(
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    qty NUMERIC NOT NULL CHECK
(qty > 0),
    price NUMERIC CHECK
(price > 0)
);

INSERT INTO invoices
    (product_id, qty, price)
VALUES
    (
        NULL, 10, 1
);

INSERT INTO invoices
    (product_id, qty, price)
VALUES
    (
        1, 10, 1
);

SELECT *
FROM invoices;

-----
DROP TABLE IF EXISTS production_orders;
CREATE TABLE
IF NOT EXISTS production_orders
(
    id SERIAL PRIMARY KEY,
    description VARCHAR
(250) NOT NULL,
    material_id VARCHAR
(50),
    qty NUMERIC,
    start_date DATE,
    finish_date DATE 
);

INSERT INTO production_orders
    (description)
VALUES('Make
for Infosys inc.');

SELECT *
FROM production_orders;

/*
To add the NOT NULL constraint to a column that already contains NULL, you need to update NULL to non-NULL first, like this:
*/
UPDATE production_orders SET qty = 1;

ALTER TABLE production_orders
ALTER COLUMN qty
SET
NOT NULL;

UPDATE production_orders
SET material_id = 'abc', start_date = '2015-09-01', finish_date = '2015-09-01';

ALTER TABLE production_orders
ALTER material_id
SET
NOT NULL,
ALTER start_date
SET
NOT NULL,
ALTER finish_date
SET
NOT NULL;

-- Error because qty has set NOT NULL:
UPDATE production_orders SET qty =
NULL;

/*
Besides the NOT NULL constraint, you can use a CHECK constraint to force a column to accept not NULL values. 
The NOT NULL constraint is equivalent to the following CHECK constraint:

This is useful because sometimes you may want either column a or b is not null, but not both.
*/

DROP TABLE IF EXISTS users_1;
CREATE TABLE users_1
(
    id serial PRIMARY KEY,
    username VARCHAR (50),
    password VARCHAR (50),
    email VARCHAR (50),
    CONSTRAINT username_email_notnull CHECK (
    NOT
    (
     ( username IS NULL OR username = '' )
        AND
        ( email IS NULL OR email = '' )
   )
 )
);

-- Work
INSERT INTO users_1
    (username, email)
VALUES
    ('user1', NULL),
    (NULL, 'abc@gmail.com'),
    ('user2', '');

-- Error
INSERT INTO users_1
    (username, email)
VALUES
    (NULL, NULL);

SELECT *
FROM users_1;