/*
NULLIF(argument_1,argument_2);

The NULLIF function returns a null value if argument_1 equals to argument_2, otherwise it returns argument_1.
*/
SELECT NULLIF(1,1);

SELECT NULLIF(1,0);

SELECT NULLIF('A', 'B');

-- PostgreSQL NULLIF function example
DROP TABLE IF EXISTS posts;
CREATE TABLE
IF NOT EXISTS posts
(
    id SERIAl PRIMARY KEY,
    title VARCHAR
(255) NOT NULL,
    excerpt VARCHAR
(150),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

INSERT INTO posts
    (title, excerpt, body)
VALUES
    ('test post 1', 'test post excerpt 1', 'test post body 1'),
    ('test post 2', '', 'test post body 2'),
    ('test post 3', null , 'test post body 3');

SELECT id, title, excerpt, body
FROM posts;

-- left(string,n)
SELECT left('w3resource',3);
/*
We see the null value in the excerpt column. To substitute this null value, we can use the COALESCE function as follows:
*/
SELECT id, title, COALESCE(excerpt, LEFT(body, 40)) AS excerpt
FROM posts;

/*
Unfortunately, there is mix between null value and ”(empty) in the excerpt column. This is why we need to use the NULLIF function:
*/
SELECT id, title, COALESCE(NULLIF(excerpt, ''), LEFT(body, 40)) AS excerpt
FROM posts;

-- Use NULLIF to prevent division-by-zero error
DROP TABLE IF EXISTS members;
CREATE TABLE
IF NOT EXISTS members
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR
(50) NOT NULL,
    last_name VARCHAR
(50) NOT NULL,
    gender SMALLINT -- 1: male, 2: female
);

TRUNCATE TABLE members
RESTART IDENTITY;

INSERT INTO members
    (first_name, last_name, gender)
VALUES
    ('John', 'Doe', 1
),
    ('David', 'Dave', 1),
    ('Bush', 'Lily', 2);

SELECT *
FROM members;

SELECT
    (
        SUM(
            CASE 
                WHEN gender = 1 THEN 1
            ELSE
                0
            END
        )/
        SUM(
            CASE
                WHEN gender = 2 THEN 1
            ELSE
                0
            END
        )
    ) * 100 AS "Male/Female ratio"
FROM members;

DELETE FROM members WHERE gender = 2;
-- And execute the query to calculate the male/female ratio again, we got the following error message: [Err] ERROR: division by zero
SELECT
    (
        SUM(
            CASE
                WHEN gender = 1 THEN 1
            ELSE
                0
            END
        )/
        NULLIF(
            SUM(
                CASE
                    WHEN gender = 2 THEN 1
                ELSE
                    0
                END
            ),
            0
        )
    ) * 100 AS "Male/Female ratio"
FROM members;

-- The NULLIF function checks if the number of female members is zero, it returns null. 
-- The total of male members is divided by a null value returns a null value, which is correct.

