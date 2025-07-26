-- MySQL solution

SELECT
    contest_id,
    CAST(
        (COUNT(user_id) / (SELECT COUNT(user_id) FROM Users)) * 100
        AS DECIMAL(10, 2)
    ) AS percentage
FROM
    Register
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id;

-- In SQL Server do not forget to cast the count to decimal