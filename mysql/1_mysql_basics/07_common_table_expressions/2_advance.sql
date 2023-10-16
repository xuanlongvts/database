# Recursive total number
WITH RECURSIVE cte_count (n)
AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM cte_count
    WHERE n < 3
)
SELECT n
FROM cte_count;

# Recursive level staff
WITH RECURSIVE employee_paths AS (
    SELECT
        employeeNumber,
        reportsTo managerNumber,
        officeCode,
        1 lvl
    FROM employees
    WHERE reportsTo IS NULL
        UNION ALL
        SELECT
            e.employeeNumber,
            e.reportsTo,
            e.officeCode,
            lvl + 1
        FROM employees e 
        INNER JOIN employee_paths ep ON ep.employeeNumber = e.reportsTo 
)
SELECT 
    employeeNumber,
    managerNumber,
    lvl,
    city
FROM employee_paths ep
INNER JOIN offices o USING (officeCODE)
ORDER BY lvl, city;
