SELECT
    7 AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM
    user_actions AS july
WHERE
    EXTRACT(YEAR FROM event_date) = 2022
    AND EXTRACT(MONTH FROM event_date) = 7
    AND EXISTS(
        SELECT 1
        FROM
            user_actions AS june
        WHERE
            july.user_id = june.user_id
            AND EXTRACT(YEAR FROM june.event_date) = 2022
            AND EXTRACT(MONTH FROM june.event_date) = 6
    );