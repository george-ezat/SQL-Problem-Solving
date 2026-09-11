SELECT
    tweet_id
FROM
    tweets
WHERE
    LEN(content) > 15;

-- In PostgreSQL and MySQL: LENGTH(content) > 15
