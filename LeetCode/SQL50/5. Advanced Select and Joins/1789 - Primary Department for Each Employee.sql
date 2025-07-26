WITH primary_dept AS(
    SELECT
        employee_id,
        COUNT(department_id) AS cnt
    FROM
        Employee
    GROUP BY
        employee_id
    HAVING
        COUNT(department_id) = 1
)
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'
    OR employee_id IN (
        SELECT employee_id
        FROM primary_dept
    );