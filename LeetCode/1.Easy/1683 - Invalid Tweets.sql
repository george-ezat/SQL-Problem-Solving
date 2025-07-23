-- MySQL solution

SELECT
    tweet_id
FROM
    Tweets
WHERE
    LENGTH(content) > 15;

-- In SQL Server it may give a time limit !!