CREATE TEMPORARY
TABLE myTableTemp
(c INT);


-- Error myTableTemp does not exists  --> Not access
SELECT *
FROM myTableTemp;

CREATE TABLE
IF NOT EXISTS myTableTemp1
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

-- Select to end and run
CREATE TEMPORARY TABLE
IF NOT EXISTS myTableTemp1
(
    id_tmp SERIAL PRIMARY KEY
);

SELECT *
FROM myTableTemp1;