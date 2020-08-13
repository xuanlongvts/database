DROP TABLE IF EXISTS linkss;
CREATE TABLE
IF NOT EXISTS linkss
(
    link_id SERIAL PRIMARY KEY,
    title VARCHAR
(512) NOT NULL,
    url VARCHAR
(1024) NOT NULL
);

ALTER TABLE linkss
ADD COLUMN active boolean;

ALTER TABLE linkss
DROP COLUMN active;

ALTER TABLE linkss
RENAME COLUMN title TO link_title;

ALTER TABLE linkss
ADD COLUMN target VARCHAR
(10);

ALTER TABLE linkss
ALTER COLUMN target
SET
DEFAULT '_blank';

INSERT INTO linkss
    (link_title, url)
VALUES('PostgreSQL Tutorial', 'https://www.postgresqltutorial.com/');

ALTER TABLE linkss
ADD CHECK (target IN ('_self', '_blank', '_parent', '_top'));

-- Error when target column check in some values
INSERT INTO linkss
    (link_title, url, target)
VALUES
    ('Postgress', 'http:
//www.postgresql.org/', 'whatever');

-- The following statement adds a UNIQUE constraint to the url column of the links table:
ALTER TABLE linkss
ADD CONSTRAINT unique_url UNIQUE (url);

INSERT INTO linkss
    (
    link_title, url
    )
VALUES
    ('Postgres', 'https://www.postgresqltutorial.com/');

ALTER TABLE linkss
RENAME TO urls;

SELECT *
FROM urls;