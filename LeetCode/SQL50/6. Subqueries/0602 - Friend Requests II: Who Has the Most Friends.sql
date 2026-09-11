-- SQL Server

WITH all_friends AS (
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
    all_friends
GROUP BY
    id
ORDER BY
    num DESC;

-- In MySQL/PostgreSQL: use LIMIT 1 instead of TOP 1
