DROP TABLE IF EXISTS links;

CREATE TABLE links
(
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    last_update DATE
);

INSERT INTO links
    (url, name)
VALUES
    ('https://www.postgresqltutorial.com', 'PostgreSQL Tutorial')
RETURNING *

INSERT INTO links
    (url, name)
VALUES
    ('http://www.oreilly.com', 'O''Reilly Media')
RETURNING name as name_link

INSERT INTO links
    (url, name, last_update)
VALUES
    ('https://www.google.com', 'Google', '2022-06-01')
RETURNING *

INSERT INTO links
    (url, name)
VALUES('http://www.postgresql.org', 'PostgreSQL')
RETURNING id