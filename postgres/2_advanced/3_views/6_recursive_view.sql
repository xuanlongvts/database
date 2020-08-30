/*
CREATE RECURSIVE VIEW view_name(columns) AS
SELECT columns;

CREATE VIEW view_name 
AS
    WITH RECURSIVE cte_name (columns) AS (
    SELECT ...)
    SELECT columns FROM cte_name;
*/

-- The following recursive query returns the employee and their managers up to the CEO level using a common table expression or CTE.
SELECT * FROM employeess;

--
WITH RECURSIVE reporting_line AS (
        SELECT employee_id, full_name AS subordinates
        FROM employeess
        WHERE manager_id IS NULL
    UNION ALL
        SELECT e.employee_id, (rl.subordinates || ' > ' || e.full_name) AS subordinates
        FROM employeess e
        INNER JOIN reporting_line rl 
        ON e.manager_id = rl.employee_id
) 
SELECT employee_id, subordinates
FROM reporting_line
ORDER BY employee_id;

-- You can use the CREATE RECURSIVE VIEW statement to convert the query into a recursive view as follows:
CREATE RECURSIVE VIEW reporting_line(employee_id, subordinates) AS
SELECT
    employee_id, full_name AS subordinates
FROM employeess
WHERE manager_id IS NULL
UNION ALL
    SELECT e.employee_id, (rl.subordinates || ' > ' || e.full_name)
    FROM employeess e
    INNER JOIN reporting_line rl
    ON e.manager_id = rl.employee_id;

--
SELECT * FROM reporting_line;