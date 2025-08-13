SELECT
    e.user_id
FROM
    emails AS e
    JOIN texts AS t ON e.email_id = t.email_id
WHERE
    e.signup_date + INTERVAL '1 day' = t.action_date
    AND t.signup_action = 'Confirmed';


-- MySQL

SELECT
    e.user_id
FROM
    emails AS e
    JOIN texts AS t ON e.email_id = t.email_id
WHERE
    DATEDIFF(t.action_date, e.signup_date) = 1
    AND t.signup_action = 'Confirmed';