SELECT
    user_id,
    ROUND(
        AVG(
            CASE WHEN activity_type = 'free_trial' THEN activity_duration END
        ), 2
    ) AS trial_avg_duration,
    ROUND(
        AVG(
            CASE WHEN activity_type = 'paid' THEN activity_duration END
        ), 2
    ) AS paid_avg_duration
FROM
    UserActivity
WHERE
    activity_type != 'cancelled'
GROUP BY
    user_id
HAVING
    COUNT(DISTINCT activity_type) = 2;

-- Notice that if you added an ELSE inside CASE, the avg will be wrong
-- This happens because AVG neglect NULLs by default, so without ELSE
-- the average will be calculated correctly for each activity_type.
