SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'
    OR employee_id IN (
        SELECT
            employee_id
        FROM
            Employee
        GROUP BY
            employee_id
        HAVING
            COUNT(*) = 1
    );


-- OR


WITH emp_dept AS (
    SELECT
        employee_id,
        department_id,
        primary_flag,
        COUNT(department_id) OVER (
            PARTITION BY employee_id
        ) AS cnt
    FROM
        employee
)

SELECT
    employee_id,
    department_id
FROM
    emp_dept
WHERE
    primary_flag = 'Y'
    OR cnt = 1;
