-- Readable Solution Using CTE and NOT IN
WITH banned_users AS (
    SELECT users_id
    FROM users
    WHERE banned = 'Yes'
)
SELECT
    t.request_at AS "Day",
    ROUND(AVG(CASE WHEN t.status != 'completed' THEN 1.0 ELSE 0.0 END), 2)
        AS "Cancellation Rate"
FROM
    trips AS t
WHERE
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND NOT t.client_id IN (SELECT users_id FROM banned_users)
    AND NOT t.driver_id IN (SELECT users_id FROM banned_users)
GROUP BY
    t.request_at;


-- In MySQL: Use `` instead of "" for column names
