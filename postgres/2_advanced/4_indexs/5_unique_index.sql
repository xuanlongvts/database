/*
CREATE UNIQUE INDEX index_name
ON table_name(column_name, [...]);

Note that only B-tree indexes can be declared as unique indexes.

When you define an UNIQUE index for a column, the column cannot store multiple rows with the same values.

If you define a UNIQUE index for two or more columns, the combined values in these columns cannot be duplicated in multiple rows.

PostgreSQL treats NULL as distinct value, therefore, you can have multiple NULL values in a column with a UNIQUE index.

When you define a primary key or a unique constraint for a table, PostgreSQL automatically creates a corresponding UNIQUE index.
*/
CREATE TABLE IF NOT EXISTS employees_index (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

SELECT * FROM pg_indexes WHERE tablename = 'employees_index';

--
ALTER TABLE employees_index
ADD mobile_phone VARCHAR(20);

--
CREATE UNIQUE INDEX idx_employees_mobile_phone
ON employees_index(mobile_phone);

INSERT INTO employees_index(first_name, last_name, email, mobile_phone)
VALUES ('John','Doe','john.doe@postgresqltutorial.com', '(408)-555-1234');

/*
ERROR:  duplicate key value violates unique constraint "idx_employees_mobile_phone"
DETAIL:  Key (mobile_phone)=((408)-555-1234) already exists.
*/
INSERT INTO employees_index(first_name, last_name, email, mobile_phone)
VALUES ('Mary','Jane','mary.jane@postgresqltutorial.com', '(408)-555-1234');

--
ALTER TABLE employees_index
ADD work_phone VARCHAR(20),
ADD extension VARCHAR(5);

CREATE UNIQUE INDEX idx_employees_workphone
ON employees_index(work_phone, extension);

INSERT INTO employees_index(first_name, last_name, work_phone, extension)
VALUES('Lily', 'Bush', '(408)-333-1234','1212');

INSERT INTO employees_index(first_name, last_name, work_phone, extension)
VALUES('Joan', 'Doe', '(408)-333-1234','1211');

/*
ERROR:  duplicate key value violates unique constraint "idx_employees_workphone"
DETAIL:  Key (work_phone, extension)=((408)-333-1234, 1211) already exists.
*/
INSERT INTO employees(first_name, last_name, work_phone, extension)
VALUES('Tommy', 'Stark', '(408)-333-1234','1211');