DROP TABLE IF EXISTS table_name_id_seq;
CREATE TABLE
IF NOT EXISTS table_name_id_seq
(
    id SERIAl PRIMARY KEY,
    name VARCHAR NOT NULL
);

INSERT INTO table_name_id_seq
    (name)
VALUES('Orange')
RETURNING *;

INSERT INTO table_name_id_seq
    (id, name)
VALUES(DEFAULT, 'Apple')
RETURNING
*;

SELECT *
FROM table_name_id_seq

SELECT currval(pg_get_serial_sequence
('table_name_id_seq', 'id'));

/*

Name            Storage Size            Range
------------    ------------            ---------------
SMALLSERIAL     2 bytes                 1 to 32,767
SERIAL          4 bytes                 1 to 2,147,483,647
BIGSERIAL       8 bytes                 1 to 9,223,372,036,854,775,807

*/