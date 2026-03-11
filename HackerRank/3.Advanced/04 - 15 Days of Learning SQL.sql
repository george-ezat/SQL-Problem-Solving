WITH hackers_streaks AS (
    SELECT
        submission_date,
        hacker_id,
        DENSE_RANK() OVER (
            PARTITION BY hacker_id
            ORDER BY submission_date
        ) AS cum_count
    FROM submissions
),

streaks_from_day1 AS (
    SELECT
        submission_date,
        COUNT(DISTINCT hacker_id) AS unq_hackers_cnt
    FROM hackers_streaks
    WHERE cum_count = DAY(submission_date)
    GROUP BY submission_date
),

hacker_submissions AS (
    SELECT
        hacker_id,
        submission_date,
        COUNT(submission_id) AS hacker_sub_cnt
    FROM submissions
    GROUP BY hacker_id, submission_date
),

highest_submissions AS (
    SELECT
        hs.submission_date,
        hs.hacker_id,
        h.name,
        ROW_NUMBER() OVER (
            PARTITION BY hs.submission_date
            ORDER BY hs.hacker_sub_cnt DESC, hs.hacker_id ASC
        ) AS rnk
    FROM hacker_submissions AS hs
        INNER JOIN hackers AS h ON hs.hacker_id = h.hacker_id
)

SELECT
    t1.submission_date,
    t1.unq_hackers_cnt,
    t2.hacker_id,
    t2.name
FROM streaks_from_day1 AS t1
    INNER JOIN highest_submissions AS t2
        ON t1.submission_date = t2.submission_date
WHERE t2.rnk = 1
ORDER BY t1.submission_date;
