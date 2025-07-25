-- SQL Server

WITH most_friends AS (
    SELECT
        requester_id AS id
    FROM
        RequestAccepted
    UNION ALL
    SELECT
        accepter_id
    FROM
        RequestAccepted
)
SELECT
    TOP 1 id,
    COUNT(id) AS num
FROM
    most_friends
GROUP BY
    id
ORDER BY
    num DESC;

-- In MySQL: use LIMIT 1 instead of TOP 1