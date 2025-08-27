SELECT
    ROUND(COUNT(t.email_id)::DECIMAL / COUNT(e.email_id), 2) AS confirm_rate
FROM
    emails AS e
    LEFT JOIN texts AS t ON e.email_id = t.email_id
    AND t.signup_action = 'Confirmed';