SELECT
    e.employee_id
FROM
    employees AS e
WHERE
    e.manager_id IS NOT NULL
    AND e.salary < 30000
    AND NOT EXISTS (
        SELECT
            1
        FROM
            employees AS m
        WHERE
            e.manager_id = m.employee_id
    )
ORDER BY
    e.employee_id;
