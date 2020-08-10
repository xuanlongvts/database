DROP TABLE IF EXISTS persons;
CREATE TABLE persons
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    email VARCHAR(255)
);

COPY persons
(first_name, last_name, dob, email)
FROM '/Users/lelong/work/bitbucket/database/postgres/1_basic/11_import_export_data/persons.csv'
DELIMITER ','
CSV HEADER;

-- Run for import from pgAdmin
TRUNCATE TABLE persons
RESTART IDENTITY;

-- insert more
INSERT INTO persons
    (first_name, last_name, dob, email)
VALUES
    ('Nam', 'Nguyen', '2020-10-01', 'namnguyen@gmail.com')
RETURNING *;

SELECT *
FROM persons