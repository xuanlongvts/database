DROP TABLE IF EXISTS character_tests;
CREATE TABLE
IF NOT EXISTS character_tests
(
    id SERIAL PRIMARY KEY,
    x CHAR
(1),
    y VARCHAR
(10),
    z TEXT
);

-- Error
INSERT INTO character_tests
    (x, y, z)
VALUES
    ('Yes', 'This is a test for varchar', 'This is a very long text for the PostgreSQL text column');

INSERT INTO character_tests
    (x, y, z)
VALUES
    ('Y', 'This is a test for varchar', 'This is a very long text for the PostgreSQL text column');

-- Success
INSERT INTO character_tests
    (x, y, z)
VALUES
    ('Y', 'varchar', 'This is a very long text for the PostgreSQL text column');

SELECT *
FROM character_tests;