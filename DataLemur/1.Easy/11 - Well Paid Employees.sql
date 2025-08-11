SELECT
    e.employee_id,
    e.name
FROM
    employee AS e
    JOIN employee AS m ON e.manager_id = m.employee_id
    AND e.salary > m.salary;