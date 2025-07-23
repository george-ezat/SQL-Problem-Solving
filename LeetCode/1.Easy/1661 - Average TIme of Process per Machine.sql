WITH machine_processes AS(
    SELECT
        machine_id,
        process_id,
        SUM(CASE WHEN activity_type = 'start' THEN timestamp ELSE 0 END) AS st,
        SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE 0 END) AS en
    FROM
        Activity
    GROUP BY
        machine_id,
        process_id
)
SELECT
    machine_id,
    ROUND((SUM(en - st) / COUNT(process_id)), 3) AS processing_time
FROM
    machine_processes
GROUP BY
    machine_id;