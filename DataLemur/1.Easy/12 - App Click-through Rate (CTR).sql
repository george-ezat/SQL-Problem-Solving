SELECT
    app_id,
    ROUND(
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) * 100.0
        /
        SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END)
        , 2) AS ctr
FROM
    events
WHERE
    EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY
    app_id;