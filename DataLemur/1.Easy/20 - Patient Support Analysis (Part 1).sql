WITH uhg_calls AS(
    SELECT
        policy_holder_id,
        COUNT(case_id) AS calls
    FROM
        callers
    GROUP BY
        policy_holder_id
    HAVING
        COUNT(case_id) >= 3
)
SELECT
    COUNT(*) AS policy_holder_count
FROM
    uhg_calls;