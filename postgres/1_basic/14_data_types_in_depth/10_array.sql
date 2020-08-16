DROP TABLE IF EXISTS contacts_arr;
CREATE TABLE
IF NOT EXISTS contacts_arr
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(100),
    phones TEXT []
);

SELECT *
FROM contacts_arr;

INSERT INTO contacts_arr
    (name, phones)
VALUES
    ('LongLe', ARRAY
['123', '456']);

INSERT INTO contacts_arr
    (name, phones)
VALUES('John Doe', ARRAY
[ '(408)-589-5846','(408)-589-5555' ]);

INSERT INTO contacts_arr
    (name, phones)
VALUES('Lily Bush', '{"(408)-589-5841"}'),
    ('William Gate', '{"(408)-589-5842","(408)-589-58423"}');

INSERT INTO contacts_arr
    (name, phones)
VALUES
    ('Abc', '{"(012)-3456"}'),
    ('Def', '{"(024)-567", "(034)-789"}');

SELECT name, phones[1]
FROM contacts_arr;

SELECT name
FROM contacts_arr
WHERE phones
[2] = '(034)-789';

-- Modifying PostgreSQL array
UPDATE contacts_arr SET phones[2]
= '(408)-589-5843' WHERE id = 3;

-- The following statement updates an array as a whole.
UPDATE contacts_arr SET phones = '{"(408)-589-5843"}' WHERE id = 3;

-- Search in PostgreSQL Array
SELECT name, phones
FROM contacts_arr
WHERE '(408)-589-5555' = ANY(phones);

/*
-- Expand Arrays
-- PostgreSQL provides the unnest () function to expand an array to a list of rows. 
For example,  the following query expands all phone numbers of the phones array.
*/
SELECT name, unnest(phones)
FROM contacts_arr;


