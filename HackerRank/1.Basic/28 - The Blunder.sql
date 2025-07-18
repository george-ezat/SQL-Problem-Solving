-- MySQL

SELECT
    CEIL(
        AVG(Salary) - AVG(CAST(REPLACE(CAST(Salary AS CHAR), 0, '') AS DECIMAL))
    ) AS A
FROM EMPLOYEES;

-- MySQL is easier here because SQL Server will truncate to an integer