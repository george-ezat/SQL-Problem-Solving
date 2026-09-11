SELECT
    u.unique_id,
    e.name
FROM
    Employees AS e
    LEFT JOIN EmployeeUNI AS u ON e.id = u.id;
