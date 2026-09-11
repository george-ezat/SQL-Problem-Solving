SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;

-- OR
WITH cte AS (
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER (
            PARTITION BY
                player_id
            ORDER BY
                event_date
        ) AS rnk
    FROM
        activity
)
SELECT
    player_id,
    event_date AS first_login
FROM
    cte
WHERE
    rnk = 1;
