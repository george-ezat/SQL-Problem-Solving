WITH cte AS(
    SELECT
        e.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_queries
    FROM
        employees AS e
        LEFT JOIN queries AS q ON e.employee_id = q.employee_id
        AND EXTRACT(QUARTER FROM q.query_starttime) = 3
    GROUP BY
        e.employee_id
)
SELECT
    unique_queries,
    COUNT(employee_id) AS employee_count
FROM
    cte
GROUP BY
    unique_queries
ORDER BY
    unique_queries;