DROP TABLE IF EXISTS courses;

CREATE TABLE courses
(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(500),
    published_date date
);

INSERT INTO courses
    (course_name, description, published_date)
VALUES
    ('PostgreSQL for Developers', 'A complete PostgreSQL for Developers', '2020-07-13'),
    ('PostgreSQL Admininstration', 'A PostgreSQL Guide for DBA', NULL),
    ('PostgreSQL High Performance', NULL, NULL),
    ('PostgreSQL Bootcamp', 'Learn PostgreSQL via Bootcamp', '2013-07-11'),
    ('Mastering PostgreSQL', 'Mastering PostgreSQL in 21 Days', '2012-06-30');

SELECT *
FROM courses;

UPDATE courses
SET published_date = '2020-08-01'
WHERE course_id = 3;

UPDATE courses
SET published_date = '2020-10-01'
WHERE course_id = 2
RETURNING *