SELECT
    P.project_id,
    ROUND(AVG(E.experience_years), 2) AS average_years
FROM
    Project AS P
    JOIN Employee AS E ON P.employee_id = E.employee_id
GROUP BY
    P.project_id;

-- Note: This solution will give you wrong answer in SQL Server,
-- but will be accepted in MySQL and PostgreSQL

-- If you want to use it in SQL Server CAST the experience_years to DECIMAL
-- >> CAST(E.experience_years AS DECIMAL(10,2))