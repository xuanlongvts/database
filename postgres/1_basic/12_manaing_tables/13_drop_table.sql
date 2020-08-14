DROP TABLE IF EXISTS author;
CREATE TABLE authors
(
    author_id INT PRIMARY KEY,
    firstname VARCHAR (50),
    lastname VARCHAR (50)
);

CREATE TABLE pages
(
    page_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    contents TEXT,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

-- Error apear
DROP TABLE authors;

/*
ERROR: cannot drop table authors because other objects depend on it
DETAIL: constraint pages_author_id_fkey on table pages depends on table authors
HINT: Use DROP ... CASCADE to drop the dependent objects too. SQL state: 2BP01
*/

DROP TABLE authors
CASCADE;

-- 3 Drop multiple tables
CREATE TABLE
IF NOT EXISTS tvshows
(
    tvshow_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR,
    release_year SMALLINT
);

CREATE TABLE
IF NOT EXISTS animes
(
    anime_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR,
    release_year SMALLINT,
    PRIMARY KEY
(anime_id)
);

DROP TABLE IF EXISTS tvshows, animes;