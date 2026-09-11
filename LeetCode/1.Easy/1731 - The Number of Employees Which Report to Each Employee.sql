SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM
    employees AS m
    INNER JOIN employees AS e ON m.employee_id = e.reports_to
GROUP BY
    m.employee_id,
    m.name
ORDER BY
    m.employee_id;


-- In SQL Server: cast the age to decimal and add the second parameter in ROUND (0)
