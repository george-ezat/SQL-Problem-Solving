WITH one_action_days AS (
    SELECT
        user_id,
        action_date,
        MIN(action) AS action
    FROM activity
    GROUP BY
        user_id,
        action_date
    HAVING COUNT(*) = 1
),

groups AS (
    SELECT
        user_id,
        action_date,
        action,
        DATEADD(DAY, -ROW_NUMBER() OVER (
            PARTITION BY user_id, action
            ORDER BY action_date
        ), action_date) AS grp
    FROM one_action_days
),

streaks AS (
    SELECT
        user_id,
        action,
        COUNT(*) AS streak_length,
        MIN(action_date) AS start_date,
        MAX(action_date) AS end_date
    FROM groups
    GROUP BY user_id, action, grp
    HAVING COUNT(*) > 4
),

ranked_streaks AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY streak_length DESC
        ) AS rnk
    FROM streaks
)

SELECT
    user_id,
    action,
    streak_length,
    start_date,
    end_date
FROM ranked_streaks
WHERE rnk = 1
ORDER BY
    streak_length DESC,
    user_id ASC;
