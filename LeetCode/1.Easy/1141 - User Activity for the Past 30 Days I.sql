-- SQL Server

SELECT
    activity_date AS DAY,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    activity_date BETWEEN DATEADD(DAY, -29, '2019-07-27') AND '2019-07-27'
GROUP BY
    activity_date;


-- In MySQL: use DATE_SUB('2019-07-27', INTERVAL 29 DAY) instead
-- In MySQL: use DATE '2019-07-27' - INTERVAL '29 days' instead