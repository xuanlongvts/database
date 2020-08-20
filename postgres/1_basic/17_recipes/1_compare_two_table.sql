DROP TABLE IF EXISTS foo;
CREATE TABLE
IF NOT EXISTS foo
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(50)
);

INSERT INTO foo
    (id, name)
VALUES
    (1, 'a'),
    (2, 'b');

DROP TABLE IF EXISTS bar;
CREATE TABLE
IF NOT EXISTS bar
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(50)
);

INSERT INTO bar
    (id, name)
VALUES
    (1, 'a'),
    (2, 'c');

-- Compare
    SELECT id, name, 'not in bar' AS note
    FROM foo
EXCEPT
    SELECT id, name, 'not in bar' AS note
    FROM bar

--
    SELECT id, name, 'not in foo' AS note
    FROM bar
EXCEPT
    SELECT id, name, 'not in foo' AS note
    FROM foo

-- Compare two tables using OUTER JOIN
SELECT id, name
FROM foo
    FULL OUTER JOIN bar USING(id,       name
)
WHERE foo.id IS NULL OR bar.id IS NULL

/*
To find the number of rows that are in the foo table but not bar table and vice versa, we use the COUNT function as follows:
*/
SELECT COUNT(*)
FROM foo
    FULL OUTER JOIN bar USING(id,  name
)
WHERE foo.id IS NULL OR bar.id IS NULL;