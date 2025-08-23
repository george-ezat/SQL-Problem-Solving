WITH stats AS(
    SELECT
        ab.age_bucket,
        SUM(CASE WHEN ac.activity_type = 'send' THEN ac.time_spent ELSE 0 END) AS send_time,
        SUM(CASE WHEN ac.activity_type = 'open' THEN ac.time_spent ELSE 0 END) AS open_time
    FROM activities AS ac
        JOIN age_breakdown AS ab ON ac.user_id = ab.user_id
    WHERE
        ac.activity_type IN ('send', 'open')
    GROUP BY
        ab.age_bucket
)
SELECT
    age_bucket,
    ROUND(100.0 * send_time / (send_time + open_time), 2) AS send_perc,
    ROUND(100.0 * open_time / (send_time + open_time), 2) AS open_perc
FROM
    stats;