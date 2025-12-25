-- Readable Solution Using CTE and NOT IN
WITH banned_users AS(
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
)
SELECT
    request_at AS Day,
    ROUND(SUM(CASE WHEN status LIKE 'cancelled%' THEN 1.0 ELSE 0 END) /
    COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips t
WHERE
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND client_id NOT IN (SELECT users_id FROM banned_users)
    AND driver_id NOT IN (SELECT users_id FROM banned_users)
GROUP BY request_at;


-- Another Solution with Joins
SELECT
    request_at AS Day,
    ROUND(SUM(CASE WHEN status LIKE 'cancelled%' THEN 1.0 ELSE 0 END) /
    COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips t
    JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No'
    JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE
    request_at between '2013-10-01' and '2013-10-03'
GROUP BY request_at;