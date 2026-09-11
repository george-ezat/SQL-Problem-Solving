-- Solution with NOT Exists

SELECT
    employee_id
FROM
    employees AS e
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            salaries AS s
        WHERE
            e.employee_id = s.employee_id
    )

UNION ALL

SELECT
    employee_id
FROM
    salaries AS s
WHERE
    NOT EXISTS (
        SELECT 1
        FROM employees AS e
        WHERE s.employee_id = e.employee_id
    )
ORDER BY
    employee_id;


-- Solution with LEFT JOINs

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

SELECT employee_id
FROM
    emp
WHERE
    name IS NULL
    OR salary IS NULL
ORDER BY
    employee_id;


-- OR with FULL JOIN

SELECT
    COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM
    employees AS e
    FULL JOIN salaries AS s ON e.employee_id = s.employee_id
WHERE
    e.name IS NULL OR s.salary IS NULL
ORDER BY
    employee_id;
