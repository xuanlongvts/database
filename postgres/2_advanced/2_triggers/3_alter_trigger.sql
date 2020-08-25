DROP TABLE IF EXISTS employees_alter_trigger;
CREATE TABLE IF NOT EXISTS employees_alter_trigger(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary decimal(11, 2) NOT NULL DEFAULT 0
);

-- check_salary
create or replace function check_salary()
    returns trigger
    language plpgsql
as $$
begin
    if (new.salary - old.salary) / (old.salary) >= 1 then
        raise 'The salary increment cannot that high.';
    end if;

    return new;
end;
$$

-- validate_salary
create or replace function validate_salary()
    returns trigger
    language plpgsql
as $$
begin
    if (new.salary - old.salary) / (old.salary) >= 1 then
        raise 'The salary increment cannot that high.';
    end if;

    return new;
end;
$$

--
create trigger before_update_salary
    before update
    on employees_alter_trigger
    for each row
    execute procedure check_salary();

--
INSERT INTO employees_alter_trigger(first_name, last_name, salary)
VALUES
    ('John','Doe',100000);

SELECT * FROM employees_alter_trigger;

--
UPDATE employees_alter_trigger
SET salary = 200000
WHERE employee_id = 1;

--
ALTER TRIGGER before_update_salary
on employees_alter_trigger
RENAME TO salary_before_update;

-- Replacing triggers
-- In order to do so, you can use the DROP TRIGGER and CREATE TRIGGER statements. You can also wrap these statements in a transaction.
drop trigger if exists salary_before_update
on employees_alter_trigger;

do $$
begin

    create trigger salary_before_update
        before update
        on employees_alter_trigger
        for each row
        execute procedure validate_salary();

    commit;
end;
$$
