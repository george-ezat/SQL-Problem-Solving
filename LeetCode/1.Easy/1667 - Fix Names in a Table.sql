SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LEN(name) - 1))) AS name
FROM
    users
ORDER BY
    user_id;

-- In PostgreSQL and MySQL use LENGTH() instead of LEN()
