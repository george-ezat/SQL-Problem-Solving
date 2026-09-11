WITH user_confirmations AS (
    SELECT
        user_id,
        ROUND(
            AVG(CASE WHEN action = 'confirmed' THEN 1.0 ELSE 0.0 END),
            2
        ) AS confirmation_rate
    FROM
        Confirmations
    GROUP BY
        user_id
)
SELECT
    u.user_id,
    COALESCE(uc.confirmation_rate, 0) AS confirmation_rate
FROM
    Signups AS u
    LEFT JOIN user_confirmations AS uc ON u.user_id = uc.user_id;
