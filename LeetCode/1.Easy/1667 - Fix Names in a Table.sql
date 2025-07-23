SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2, LEN(name)))) AS name
FROM
    Users
ORDER BY
    user_id;

-- In MySQL use LENGTH() instead of LEN()