DROP TABLE IF EXISTS employees_1;
CREATE TABLE
IF NOT EXISTS employees_1
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR
(50),
    last_name VARCHAR
(50),
    birth_date DATE CHECK
(birth_date > '1900-01-01'),
    join_date DATE CHECK
(join_date > birth_date),
    salary NUMERIC CHECK
(salary > 0)
);

SELECT *
FROM employees_1;

INSERT INTO employees_1
    (first_name, last_name, birth_date, join_date, salary)
VALUES
    ('Long', 'Le', '1990-10-1', '1992-1-1', -100);

INSERT INTO employees_1
    (first_name, last_name, birth_date, join_date, salary)
VALUES
    ('Long', 'Le', '1990-10-1', '1992-1-1', 10000);


-- Define PostgreSQL CHECK constraints for existing tables
DROP TABLE IF EXISTS prices_list;
CREATE TABLE
IF NOT EXISTS prices_list
(
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL
);

ALTER TABLE prices_list
ADD CONSTRAINT price_discount_check
CHECK (
    price > 0 AND discount > 0 AND price > discount
);

ALTER TABLE prices_list
ADD CONSTRAINT valid_range_check
CHECK (
    valid_to >= valid_from
);

INSERT INTO prices_list
    (product_id, price, discount, valid_from, valid_to)
VALUES
    (1, 10, 20, '2000-10-20', '2000-11-20');

SELECT *
FROM prices_list;