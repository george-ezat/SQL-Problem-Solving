-- SQL Server

WITH CTE AS(
    SELECT
        T.id,
        Y.temperature AS yesterday,
        T.temperature AS today
    FROM
        Weather AS Y
        JOIN Weather AS T ON DATEDIFF(DAY, Y.recordDate, T.recordDate) = 1
)
SELECT
    id
FROM
    CTE
WHERE
    today > yesterday;


-- IN MySQL => use TIMESTAMPDIFF() instead of DATEDIFF()
-- IN PostgreSQL => use (T.recordDate - Y.recordDate)