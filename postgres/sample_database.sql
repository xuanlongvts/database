CREATE DATABASE db_demo;

CREATE TABLE tbl_town(
    id SERIAL PRIMARY KEY,
    code VARCHAR(15) NOT NULL,
    article TEXT,
    department VARCHAR(15) NOT NULL
)

INSERT INTO tbl_town(code, article, department)
SELECT 
	left(md5(i::text), 15),
	md5(random()::text),
	left(md5(i::text), 15)
FROM generate_series(1, 3000000) s(i)

-- Link: https://stackoverflow.com/questions/24841142/how-can-i-generate-big-data-sample-for-postgresql-using-generate-series-and-rand