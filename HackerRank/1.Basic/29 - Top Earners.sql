SELECT
    months * salary AS Max_Earnings,
    COUNT(months * salary)
FROM Employee
WHERE
    (months * salary) = (
        SELECT TOP 1 months * salary AS Max_Earn
        FROM Employee
        ORDER BY Max_Earn DESC
    )
GROUP BY (months * salary)

-- For MySQL Solution you will replace TOP 1 with LIMIT 1

-- Note: You can use order by in a subquery in case of using TOP(SQL-Server) or LIMIT(MySQL/PostgreSQL)