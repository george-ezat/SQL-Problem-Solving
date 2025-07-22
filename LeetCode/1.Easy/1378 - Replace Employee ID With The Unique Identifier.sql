SELECT
    U.unique_id,
    E.name
FROM
    Employees AS E
    LEFT JOIN EmployeeUNI AS U ON E.id = U.id;