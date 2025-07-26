-- MySQL

WITH greatest_ratings AS (
    SELECT
        U.name AS user_name,
        COUNT(MR.movie_id) AS cnt
    FROM
        MovieRating AS MR
        JOIN Users AS U ON MR.user_id = U.user_id
    GROUP BY
        U.user_id,
        U.name
    ORDER BY
        cnt DESC,
        user_name
    LIMIT 1
), highest_avg_movie AS (
    SELECT
        M.title AS movie_name,
        AVG(rating) AS avg_rating
    FROM
        MovieRating AS MR
        JOIN Movies AS M ON MR.movie_id = M.movie_id
    WHERE
        created_at LIKE '2020-02%'
    GROUP BY
        M.movie_id,
        M.title
    ORDER BY
        avg_rating DESC,
        movie_name
    LIMIT 1
)
SELECT
    user_name AS results
FROM
    greatest_ratings
UNION ALL
SELECT
    movie_name
FROM
    highest_avg_movie;


-- In SQL Server: use TOP 1 instead of LIMIT 1
-- and cast the rating to Decimal calc the right avg