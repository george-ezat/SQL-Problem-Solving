-- PostgreSQL Solution

SELECT
    *
FROM
    Users
WHERE
    email ~ '^[A-Za-z0-9\_]+@[A-Za-z]+\.com$'
ORDER BY
    user_id;

-- In MySQL: WHERE email REGEXP '^[A-Za-z0-9\_]+@[A-Za-z]+\\.com$'
