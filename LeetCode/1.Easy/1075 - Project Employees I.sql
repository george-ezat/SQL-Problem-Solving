SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    project AS p
    INNER JOIN employee AS e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;

-- Note: This solution will give you wrong answer in SQL Server,
-- but will be accepted in MySQL and PostgreSQL

-- If you want to use it in SQL Server CAST the experience_years to DECIMAL
-- >> CAST(e.experience_years AS DECIMAL(10,2))
