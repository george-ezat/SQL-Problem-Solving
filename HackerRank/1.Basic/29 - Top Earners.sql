SELECT
    months * salary AS max_earnings,
    COUNT(months * salary)
FROM employee
WHERE
    (months * salary) = (
        SELECT TOP 1 months * salary AS max_earn
        FROM employee
        ORDER BY max_earn DESC
    )
GROUP BY (months * salary);

-- For MySQL Solution you will replace TOP 1 with LIMIT 1

-- Note: You can use order by in a subquery in case of using TOP(SQL-Server) or LIMIT(MySQL/PostgreSQL)
