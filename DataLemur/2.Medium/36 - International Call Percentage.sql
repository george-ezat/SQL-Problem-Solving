SELECT
    ROUND(
        100.0 * SUM(CASE WHEN i1.country_id <> i2.country_id THEN 1 ELSE 0 END)
        /
        COUNT(*), 1) AS pct
FROM
    phone_calls AS c
    JOIN phone_info AS i1 ON c.caller_id = i1.caller_id
    JOIN phone_info AS i2 ON c.receiver_id = i2.caller_id;

-- OR this instead (PostgreSQL only)

-- ROUND(
--     100.0 * SUM(1) FILTER(WHERE i1.country_id <> i2.country_id)
--     /
--     COUNT(*), 1) AS pct