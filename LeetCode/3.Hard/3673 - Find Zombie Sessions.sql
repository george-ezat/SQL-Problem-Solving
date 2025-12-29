-- This Solution for PostgreSQL

WITH session_metrics AS (
    SELECT
        session_id,
        user_id,
        EXTRACT(EPOCH FROM (MAX(event_timestamp) - MIN(event_timestamp))) / 60 AS session_duration_minutes,
        -- Replacement for SQL Server
        -- DATEDIFF(SECOND, MIN(event_timestamp), MAX(event_timestamp)) / 60 AS session_duration_minutes,
        SUM(CASE WHEN event_type = 'scroll' THEN 1.0 ELSE 0 END) AS scroll_count,
        SUM(CASE WHEN event_type = 'click' THEN 1.0 ELSE 0 END) AS click_count,
        SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_count
    FROM app_events
    GROUP BY
        user_id,
        session_id
)
SELECT
    session_id,
    user_id,
    session_duration_minutes,
    scroll_count
FROM session_metrics
WHERE
    session_duration_minutes > 30
    AND scroll_count >= 5
    AND purchase_count = 0
    AND (click_count / scroll_count) < 0.2
ORDER BY
    scroll_count DESC,
    session_id ASC;