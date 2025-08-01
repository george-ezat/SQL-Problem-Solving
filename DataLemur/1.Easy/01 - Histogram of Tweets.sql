WITH user_tweets AS (
    SELECT
        user_id,
        COUNT(*) AS tweet_bucket
    FROM
        tweets
    WHERE
        YEAR(tweet_date) = 2022 -- (MySQL)
        --(PostgreSQL) EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY
        user_id
)
SELECT
    tweet_bucket,
    COUNT(user_id) AS users_num
FROM
    user_tweets
GROUP BY
    tweet_bucket;