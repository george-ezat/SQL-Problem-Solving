-- MySQL Solution

WITH first_player_login AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM
        Activity
    GROUP BY
        player_id
),
consecutive_login AS (
    SELECT
        COUNT(*) AS consecutive_cnt
    FROM
        first_player_login AS pl
        INNER JOIN Activity AS a ON pl.player_id = a.player_id
            AND DATE_ADD(pl.first_login, INTERVAL 1 DAY) = a.event_date
)
SELECT
    ROUND(
        (SELECT consecutive_cnt FROM consecutive_login)
        /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction;

-- Do not forget that you can solve it in SQL Server but you will cast
-- the counts to decimal.

-- instead of DATE_ADD()
-- >> SQL Server: DATEADD(DAY, 1, pl.first_login)
-- >> PostgreSQL: pl.first_login + INTERVAL '1 day' = a.event_date


-- OR (More Optimized)

WITH first_player_login AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM
        activity
    GROUP BY
        player_id
)
SELECT
    ROUND(
        1.0 * COUNT(a.player_id) / COUNT(pl.player_id),
        2
    ) AS fraction
FROM
    first_player_login AS pl
    LEFT JOIN activity AS a ON pl.player_id = a.player_id
        AND pl.first_login + INTERVAL '1 day' = a.event_date;
