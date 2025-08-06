-- PostgreSQL

SELECT
    user_id,
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
    -- Notice that you should convert it to DATE, because it is a timestamp
FROM
    posts
WHERE
    EXTRACT(YEAR FROM post_date) = 2021
GROUP BY
    user_id
HAVING
    COUNT(post_id) > 1;


-- MySQL

SELECT
    user_id,
    DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between
FROM
    posts
WHERE
    YEAR(post_date) = 2021
GROUP BY
    user_id
HAVING
    COUNT(post_id) > 1;