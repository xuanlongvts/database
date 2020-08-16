/*
Name	    Storage Size	    Min	                            Max
-------------------------------------------------------------------------------
SMALLINT	2 bytes	            -32,768	                        +32,767
INTEGER	    4 bytes	            -2,147,483,648	                +2,147,483,647
BIGINT	    8 bytes	            -9,223,372,036,854,775,808	    +9,223,372,036,854,775,807
*/
DROP TABLE IF EXISTS books_integer;
CREATE TABLE
IF NOT EXISTS books_integer
(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR
(255) NOT NULL,
    page SMALLINT NOT NULL CHECK
(page > 0),
    population INT NOT NULL CHECK
(population > 0),
    price BIGINT CHECK
(price > 0)
);