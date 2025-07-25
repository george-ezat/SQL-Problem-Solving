-- MySQL Solution

WITH first_login AS(
    SELECT
        player_id,
        MIN(event_date) AS first_date
    FROM
        Activity
    GROUP BY
        player_id
), consecutive_login AS(
    SELECT
        COUNT(*) AS consecutive_cnt
    FROM
        first_login AS FL
        JOIN Activity AS A ON FL.player_id = A.player_id
        AND DATE_ADD(FL.first_date, INTERVAL 1 DAY) = A.event_date
)
SELECT
    ROUND(
        (SELECT consecutive_cnt FROM consecutive_login)
        /
        (SELECT COUNT(DISTINCT player_id) FROM Activity)
        , 2) AS fraction;

-- Do not forget that you can solve it in SQL Server but you will cast
-- the counts to decimal. also you will use DATEADD(DAY, 1, FL.first_date)
-- instead of DATE_ADD().


-- Note: your solution may be slightly different from mine.