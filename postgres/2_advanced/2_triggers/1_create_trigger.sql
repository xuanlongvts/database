DROP TABLE IF EXISTS employees_trigger;
CREATE TABLE IF NOT EXISTS employees_trigger(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL
);

INSERT INTO employees_trigger(first_name, last_name)
VALUES
    ('John', 'Doe'),
    ('Lily', 'Bush');

DROP TABLE IF EXISTS employee_audits;
CREATE TABLE IF NOT EXISTS employee_audits(
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    changed_on TIMESTAMP(6) NOT NULL 
);

--
create or replace function log_last_name_changes()
    returns trigger
    language plpgsql
as $$
begin
    if new.last_name <> old.last_name then
        insert into employee_audits(employee_id, last_name, changed_on)
        values
            (old.id, old.last_name, now());
    end if;

    return new;
end;
$$

/*
CREATE TRIGGER trigger_name 
    {BEFORE | AFTER} { event }
    ON table_name
    [FOR [EACH] { ROW | STATEMENT }]
        EXECUTE PROCEDURE trigger_function
*/
create trigger last_name_changes
    before update
    on employees_trigger
    for each row
    execute procedure log_last_name_changes();


-- 
SELECT * FROM employees_trigger;
SELECT * FROM employee_audits;

--
UPDATE employees_trigger SET last_name = 'Bush' WHERE id = 2;