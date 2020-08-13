DROP TABLE IF EXISTS publishers;
CREATE TABLE
IF NOT EXISTS publishers
(
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS categoriess;
CREATE TABLE
IF NOT EXISTS categoriess
(
    category_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS books;
CREATE TABLE
IF NOT EXISTS books
(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    isbn VARCHAR NOT NULL,
    published_date DATE NOT NULL,
    description VARCHAR,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY
(category_id) REFERENCES categoriess
(category_id),
    FOREIGN KEY
(publisher_id) REFERENCES publishers
(publisher_id)
);

CREATE VIEW book_info
AS
    SELECT book_id, title, isbn, published_date, name
    FROM books
        INNER JOIN publishers USING(publisher_id) 
    ORDER BY title;

ALTER TABLE books
DROP COLUMN category_id;

-- Error when Drop colun
ALTER TABLE books
DROP COLUMN publisher_id

/*
It stated that the book_info view is using the column publisher_id of the books table. You need to use the
CASCADE option to remove both the publisher_id column and book_info view as shown in the following statement:
*/
ALTER TABLE books
DROP COLUMN publisher_id
CASCADE;

ALTER TABLE books
DROP COLUMN isbn
,
DROP COLUMN description;

-- in command line of postgres
-- \d books   view  result