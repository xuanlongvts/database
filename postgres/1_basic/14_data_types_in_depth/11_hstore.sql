-- Enable PostgreSQL hstore extension
CREATE EXTENSION hstore;

DROP TABLE IF EXISTS books_hstore;
CREATE TABLE
IF NOT EXISTS books_hstore
(
    id SERIAL PRIMARY KEY,
    title VARCHAR
(255),
    attr hstore
);

INSERT INTO books_hstore
    (title, attr)
VALUES
    (
        'Postgres Tutorial',
        '
            "paperback" => "234",
            "publisher" => "postgresqltutorial.com",
            "language" => "English",
            "ISBN-13" => "978-1449370000",
            "weight" => "11.2 ounces",
        '
    );

SELECT *
FROM books_hstore;

INSERT INTO books_hstore
    (title, attr)
VALUES
    (
        'PostgreSQL Cheat Sheet',
        '
            "paperback" => "5",
            "publisher" => "postgresqltutorial.com",
            "language"  => "English",
            "ISBN-13"   => "978-1449370001",
            "weight"    => "1 ounces"
        '
	);

-- Query value for a specific key
SELECT attr -> 'ISBN-13'
AS isbn
FROM books_hstore;

-- Use value in the WHERE clause
SELECT title, attr -> 'weight'
as weight
FROM books_hstore
WHERE attr -> 'ISBN-13' = '978-1449370001';

-- Add key-value pairs to existing rows"freeshipping"=>"yes"
UPDATE books_hstore
SET attr = attr || '"freeshipping"=>"yes"'
::hstore;

SELECT title, attr -> 'freeshipping'
AS freeshipping
FROM books_hstore;

-- Update existing key-value pair
UPDATE books_hstore
SET attr = attr || '"freeshipping"=>"no"'
::hstore WHERE id = 1;

-- Remove existing key-value pair
UPDATE books_hstore
SET attr =
delete(attr, 'freeshipping');

-- Check for a specific key in hstore column
INSERT INTO books_hstore
    (title, attr)
VALUES
    (
        'PostgreSQL 11',
        '
            "paperback" => "5",
        '
	);
SELECT title, attr -> 'publisher'
AS publisher, attr
FROM books_hstore
WHERE attr ? 'publisher';

-- Check for a key-value pair
SELECT title, attr
FROM books_hstore
WHERE attr
@> '"weight"=>"11.2 ounces"'::hstore

-- Query rows that contain multiple specified keys
SELECT title, attr
FROM books_hstore
WHERE attr
?& ARRAY['language', 'weight'];

-- Get all keys from an hstore column
-- To get all keys from an hstore column, you use the akeys () function as follows:
SELECT akeys(attr)
FROM books_hstore;

-- Or you can use the skey() function if you want PostgreSQL to return the result as a set.
SELECT skeys(attr)
FROM books_hstore;

-- Get all values from an hstore column
SELECT avals(attr)
FROM books_hstore;

-- Or you can use the svals() function if you want to get the result as a set.
SELECT svals(attr)
FROM books_hstore;

-- Convert hstore data to JSON
SELECT title, hstore_to_json(attr) json
FROM books_hstore;

-- Convert hstore data to sets
SELECT title, (EACH(attr)).*
FROM books_hstore;