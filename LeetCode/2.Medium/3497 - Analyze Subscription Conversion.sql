-- MySQL

SELECT
    user_id,
    ROUND(
        AVG(
            CASE WHEN activity_type = 'free_trial' THEN activity_duration END
        ), 2) AS trial_avg_duration,
    ROUND(
        AVG(
            CASE WHEN activity_type = 'paid' THEN activity_duration END
        ), 2) AS paid_avg_duration
FROM
    UserActivity
WHERE
    activity_type IN ('free_trial', 'paid')
GROUP BY
    user_id
HAVING
    COUNT(DISTINCT activity_type) = 2; -- for each user


-- In SQL Server: Cast activity_duration to DECIMAL