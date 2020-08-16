/*
When storing a date value, PostgreSQL uses the  yyyy-mm-dd format e.g., 2000-12-31. 
It also uses this format for inserting data into a date column.
*/

DROP TABLE IF EXISTS documents_date;
CREATE TABLE
IF NOT EXISTS documents_date
(
    document_id SERIAL PRIMARY KEY,
    header_text VARCHAR
(255) NOT NULL,
    posting_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO documents_date
    (header_text)
VALUES
    ('Billing to customer XYZ');

SELECT *
FROM documents_date;

---- PostgreSQL DATE functions
DROP TABLE IF EXISTS employees_date;
CREATE TABLE
IF NOT EXISTS employees_date
(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR
(255) NOT NULL,
    last_name VARCHAR
(255) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees_date
    (first_name, last_name, birth_date, hire_date)
VALUES
    ('Shannon', 'Freeman', '1980-01-01', '2005-01-01'),
    ('Sheila', 'Wells', '1978-02-05', '2003-01-01'),
    ('Ethel', 'Webb', '1975-01-01', '2001-01-01');

SELECT *
FROM employees_date;

-- 1) Get the current date
SELECT NOW()
::DATE;

SELECT CURRENT_DATE as date_now;

-- 2) Output a PostgreSQL date value in a specific format
SELECT TO_CHAR(NOW()
::DATE, 'dd/mm/yyyy') as DATE_NOW;

SELECT TO_CHAR(NOW()
::DATE, 'Mon dd, yyyy');

-- 3) Get the interval between two dates
SELECT first_name, last_name, now() - hire_date as diff
FROM employees_date;

-- 4) Calculate ages in years, months, and days
SELECT first_name, last_name, TO_CHAR(AGE(birth_date), 'yy-mm-dd')
FROM employees_date;

SELECT first_name, last_name, TO_CHAR(AGE('2015-01-01', birth_date), 'yy-mm-dd')
FROM employees_date;

-- 5) Extract year, quarter, month, week, day from a date value
SELECT employee_id, first_name, last_name,
    EXTRACT (YEAR FROM birth_date) AS YEAR,
    EXTRACT (YEAR FROM birth_date) AS MONTH,
    EXTRACT (YEAR FROM birth_date) AS DAY
FROM employees_date;
