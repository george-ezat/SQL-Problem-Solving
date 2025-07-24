-- PostgreSQL Solution

SELECT
    user_id,
    email
FROM
    Users
WHERE
    email ~ '^[A-Za-z0-9\_]+@[A-Za-z]+\.com$'
ORDER BY
    user_id;

-- In MySQL: WHERE email REGEXP '^[A-Za-z0-9\_]+@[A-Za-z]+\\.com$'