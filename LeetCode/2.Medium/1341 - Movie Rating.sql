WITH user_ratings AS (
    SELECT
        user_id,
        COUNT(*) AS ratings_count
    FROM MovieRating
    GROUP BY user_id
),
top_user AS (
    SELECT u.name AS user_name
    FROM
        user_ratings AS ur
        INNER JOIN users AS u ON ur.user_id = u.user_id
    ORDER BY
        ratings_count DESC,
        user_name ASC
    LIMIT 1
),
movie_feb_ratings AS (
    SELECT
        movie_id,
        AVG(rating::DECIMAL) AS average_rating
    FROM
        MovieRating
    WHERE
        created_at >= '2020-02-01'
        AND created_at < '2020-03-01'
    GROUP BY movie_id
),
top_movie AS (
    SELECT m.title AS movie_title
    FROM
        movie_feb_ratings AS mr
        INNER JOIN movies AS m ON mr.movie_id = m.movie_id
    ORDER BY
        average_rating DESC,
        movie_title ASC
    LIMIT 1
)
SELECT user_name AS results
FROM top_user
UNION ALL
SELECT movie_title
FROM top_movie;


-- This solution is optimized to aggregate before joining tables
