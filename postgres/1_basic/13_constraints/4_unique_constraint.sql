DROP TABLE IF EXISTS person_1;
CREATE TABLE
IF NOT EXISTS person_1
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR
(50),
    last_name VARCHAR
(50),
    email VARCHAR
(250) UNIQUE
);

INSERT INTO person_1
    (first_name,last_name,email)
VALUES('john', 'doe', 'j.doe@postgresqltutorial.com');

SELECT *
FROM person_1;

INSERT INTO person_1
    (first_name,last_name,email)
VALUES('jack', 'doe', 'j.doe@postgresqltutorial.com');

INSERT INTO person_1
    (first_name,last_name,email)
VALUES('jack', 'doe', 'j.doe1@postgresqltutorial.com');

-- Create multi column
DROP TABLE IF EXISTS person_2;
CREATE TABLE
IF NOT EXISTS person_2
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR
(50),
    last_name VARCHAR
(50),
    email VARCHAR
(250),
    phone VARCHAR
(15),
    UNIQUE
(email, phone)
);

SELECT *
FROM person_2;

INSERT INTO person_2
    (first_name,last_name,email, phone)
VALUES('john', 'doe', 'j.doe@postgresqltutorial.com', 123);

INSERT INTO person_2
    (first_name,last_name,email, phone)
VALUES('john', 'doe', 'j.doe@postgresqltutorial.com', 456);

-- Adding unique constraint using a unique index
DROP TABLE IF EXISTS equipment;
CREATE TABLE
IF NOT EXISTS equipment
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(50) NOT NULL,
    equip_id VARCHAR
(50) NOT NULL
);

CREATE UNIQUE INDEX CONCURRENTLY equipment_equip_id ON equipment
(equip_id);

ALTER TABLE equipment
ADD CONSTRAINT unique_equip_id
UNIQUE
USING INDEX equipment_equip_id;

/*

Notice that the ALTER TABLE statement acquires an exclusive lock on the table. If you have any pending transactions, 
it will wait for all transactions to complete before changing the table. 
Therefore, you should check the  pg_stat_activity table to see the current pending transactions that are on-going using the following query:

*/

SELECT
    datid,
    datname,
    usename,
    state
FROM
    pg_stat_activity;