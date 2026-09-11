SELECT
    machine_id,
    ROUND(
        SUM(
            CASE
                WHEN activity_type = 'start' THEN -1 * timestamp ELSE timestamp
            END
        )
        / COUNT(DISTINCT process_id), 3
    ) AS processing_time
FROM
    activity
GROUP BY
    machine_id;
