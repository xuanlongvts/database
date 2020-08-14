/*
--  SET NULL
--  SET DEFAULT
--  RESTRICT
--  NO ACTION
--  CASCADE
*/

DROP TABLE IF EXISTS customers_1;
DROP TABLE IF EXISTS contacts_1;

CREATE TABLE
IF NOT EXISTS customers_1
(
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
(255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS contacts_1
(
    contact_id SERIAL PRIMARY KEY,
    customer_id INT,
    contact_name VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    CONSTRAINT fk_customer
    FOREIGN KEY
(customer_id) REFERENCES customers_1
(customer_id)
);

INSERT INTO customers_1
    (name)
VALUES
    ('BlueBird Inc'),
    ('Dolphin LLC');

INSERT INTO contacts_1
    (customer_id, contact_name, phone, email)
VALUES
    (1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
    (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
    (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');

SELECT *
FROM customers_1;

SELECT *
FROM contacts_1;

-- Error because  ON DELETE NO ACTION
DELETE FROM customers_1 WHERE customer_id = 1;

----------- SET NULL
DROP TABLE IF EXISTS customers_2;
DROP TABLE IF EXISTS contacts_2;

CREATE TABLE
IF NOT EXISTS customers_2
(
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
(255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS contacts_2
(
    contact_id SERIAL PRIMARY KEY,
    customer_id INT,
    contact_name VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    CONSTRAINT fk_customer
    FOREIGN KEY
(customer_id) REFERENCES customers_2
(customer_id) ON
DELETE
SET NULL
);

INSERT INTO customers_2
    (name)
VALUES('BlueBird Inc'),
    ('Dolphin LLC');

INSERT INTO contacts_2
    (customer_id, contact_name, phone, email)
VALUES(1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
    (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
    (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');

SELECT *
FROM customers_2;

SELECT *
FROM contacts_2;

DELETE FROM customers_2 WHERE customer_id = 1;

----------- CASCADE
DROP TABLE IF EXISTS customers_3;
DROP TABLE IF EXISTS contacts_3;

CREATE TABLE
IF NOT EXISTS customers_3
(
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
(255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS contacts_3
(
    contact_id SERIAL PRIMARY KEY,
    customer_id INT,
    contact_name VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    CONSTRAINT fk_customer
    FOREIGN KEY
(customer_id) REFERENCES customers_3
(customer_id) ON
DELETE CASCADE
);

INSERT INTO customers_3
    (name)
VALUES('BlueBird Inc'),
    ('Dolphin LLC');

INSERT INTO contacts_3
    (customer_id, contact_name, phone, email)
VALUES(1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
    (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
    (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');

SELECT *
FROM customers_3;

SELECT *
FROM contacts_3;

DELETE FROM customers_3 WHERE customer_id = 1;

----------- SET DEFAULT
DROP TABLE IF EXISTS customers_4;
DROP TABLE IF EXISTS contacts_4;

CREATE TABLE
IF NOT EXISTS customers_4
(
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
(255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS contacts_4
(
    contact_id SERIAL PRIMARY KEY,
    customer_id INT,
    contact_name VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    CONSTRAINT fk_customer
    FOREIGN KEY
(customer_id) REFERENCES customers_4
(customer_id) ON
DELETE
SET
DEFAULT
);

INSERT INTO customers_4
    (name)
VALUES('BlueBird Inc'),
    ('Dolphin LLC');

INSERT INTO contacts_4
    (customer_id, contact_name, phone, email)
VALUES(1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
    (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
    (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');

SELECT *
FROM customers_4;

SELECT *
FROM contacts_4;

DELETE FROM customers_4 WHERE customer_id = 1;


----- Add a foreign key constraint to an existing table
DROP TABLE IF EXISTS customers_5;
DROP TABLE IF EXISTS contacts_5;

CREATE TABLE
IF NOT EXISTS customers_5
(
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
(255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS contacts_5
(
    contact_id SERIAL PRIMARY KEY,
    customer_id INT,
    contact_name VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100)
);

SELECT *
FROM customers_5;

SELECT *
FROM contacts_5;

INSERT INTO customers_5
    (name)
VALUES('BlueBird Inc'),
    ('Dolphin LLC');

INSERT INTO contacts_5
    (customer_id, contact_name, phone, email)
VALUES(1, 'John Doe', '(408)-111-1234', 'john.doe@bluebird.dev'),
    (1, 'Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev'),
    (2, 'David Wright', '(408)-222-1234', 'david.wright@dolphin.dev');


-- Add foreign key
ALTER TABLE contacts_5
ADD CONSTRAINT fk_customer_5
FOREIGN KEY (customer_id) REFERENCES customers_5
(customer_id)
ON DELETE CASCADE;

DELETE FROM customers_5 WHERE customer_id = 1;