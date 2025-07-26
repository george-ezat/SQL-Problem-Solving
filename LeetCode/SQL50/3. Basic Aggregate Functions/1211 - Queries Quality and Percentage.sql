-- This is MySQL solution

SELECT
    query_name,
    CAST(AVG(rating / position) AS DECIMAL(10, 2)) AS quality,
    CAST(
            (AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100) AS DECIMAL(10, 2)
        ) AS poor_query_percentage
FROM
    Queries
GROUP BY
    query_name;


-- In SQL Server, I think you should know now that you need to cast rating(or position)
-- to decimal. also in poor_query_percentage use 1.0 instead