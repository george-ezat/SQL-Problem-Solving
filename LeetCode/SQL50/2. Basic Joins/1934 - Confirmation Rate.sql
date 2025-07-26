WITH confirmed_avg AS (
    SELECT
        user_id,
        ROUND(
            AVG(CASE WHEN action = 'confirmed' THEN 1.0 ELSE 0.0 END)
        , 2) AS confirmation_rate
    FROM
        Confirmations
    GROUP BY
        user_id
)
SELECT
    S.user_id,
    COALESCE(C.confirmation_rate, 0) AS confirmation_rate
FROM
    Signups AS S
    LEFT JOIN confirmed_avg AS C ON S.user_id = C.user_id;