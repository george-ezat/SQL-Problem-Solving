-- SQL Server

WITH cte AS (
    SELECT
        t.id,
        y.temperature AS yesterday,
        t.temperature AS today
    FROM
        Weather AS y
        INNER JOIN Weather AS t ON DATEDIFF(DAY, y.recordDate, t.recordDate) = 1
)
SELECT
    id
FROM
    cte
WHERE
    today > yesterday;


-- IN MySQL => use TIMESTAMPDIFF() instead of DATEDIFF()
-- IN PostgreSQL => use (t.recordDate - y.recordDate)
