-- Solution with LEFT JOINs (Readable)

WITH emp AS (
    SELECT
        E.employee_id,
        E.name,
        S.salary
    FROM
        Employees AS E
        LEFT JOIN Salaries AS S ON E.employee_id = S.employee_id
    UNION
    SELECT
        S.employee_id,
        E.name,
        S.salary
    FROM
        Salaries AS S
        LEFT JOIN Employees AS E ON S.employee_id = E.employee_id
)
SELECT
    employee_id
FROM
    emp
WHERE
    name IS NULL
    OR salary IS NULL
ORDER BY
    employee_id;


-- Solution with NOT IN

SELECT
    employee_id
FROM
    Employees
WHERE
    employee_id NOT IN (
        SELECT employee_id
        FROM Salaries
    )
UNION
SELECT
    employee_id
FROM
    Salaries
WHERE
    employee_id NOT IN (
        SELECT employee_id
        FROM Employees
    )
ORDER BY
    employee_id;