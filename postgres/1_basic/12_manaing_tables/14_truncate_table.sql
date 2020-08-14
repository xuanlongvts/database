DROP TABLE IF EXISTS tvshows, animes;
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

INSERT INTO tvshows
    (title, release_year)
VALUES
    ('samsung', 1990),
    ('dell', 1992
);

INSERT INTO animes
    (title, release_year)
VALUES
    ('dance', 1990),
    ('jump', 1992
);

-- Truncate without restart identity
TRUNCATE TABLE tvshows;

SELECT *
FROM tvshows;

-- Truncate and restart identity
TRUNCATE TABLE tvshows
RESTART IDENTITY;

-- Trancate multi table
TRUNCATE TABLE tvshows
, animes RESTART IDENTITY;

SELECT *
FROM animes;

-- TRUNCATE use CASCADE if table has dependency
DROP TABLE IF EXISTS author, pages;
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

-- Error appear
TRUNCATE TABLE authors;

-- use CASCADE
TRUNCATE TABLE authors
CASCADE;