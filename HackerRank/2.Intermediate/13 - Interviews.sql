-- This is a really time-consuming problem, so don't give up and try your best.

-- The idea is that you shouldn't do all the joins together, and think which join to do and when
-- And when you combining them at the end, think of the values that could exist on only one of the sides
-- and then think of the NULLs, and after that think of edge cases(may be all of them has values but = 0)

-- I know your reaction right now ;)
-- GOOD LUCK!

WITH cts_chg AS (
    SELECT
        cts.contest_id,
        cts.hacker_id,
        cts.name,
        chg.challenge_id
    FROM contests AS cts
        INNER JOIN colleges AS clg ON cts.contest_id = clg.contest_id
        INNER JOIN challenges AS chg ON clg.college_id = chg.college_id
),

cts_view_stats AS (
    SELECT
        cc.contest_id,
        cc.hacker_id,
        cc.name,
        SUM(vs.total_views) AS sum_tv,
        SUM(vs.total_unique_views) AS sum_tuv
    FROM
        cts_chg AS cc
        INNER JOIN view_stats AS vs ON cc.challenge_id = vs.challenge_id
    GROUP BY cc.contest_id, cc.hacker_id, cc.name
),

cts_sub_stats AS (
    SELECT
        cc.contest_id,
        cc.hacker_id,
        cc.name,
        SUM(ss.total_submissions) AS sum_ts,
        SUM(ss.total_accepted_submissions) AS sum_tas
    FROM cts_chg AS cc
        INNER JOIN submission_stats AS ss ON cc.challenge_id = ss.challenge_id
    GROUP BY cc.contest_id, cc.hacker_id, cc.name
),

result AS (
    SELECT
        COALESCE(t1.contest_id, t2.contest_id) AS cts_id,
        COALESCE(t1.hacker_id, t2.hacker_id) AS hck_id,
        COALESCE(t1.name, t2.name) AS hck_name,
        COALESCE(t2.sum_ts, 0) AS sum_ts,
        COALESCE(t2.sum_tas, 0) AS sum_tas,
        COALESCE(t1.sum_tv, 0) AS sum_tv,
        COALESCE(t1.sum_tuv, 0) AS sum_tuv
    FROM cts_view_stats AS t1
        FULL JOIN cts_sub_stats AS t2 ON t1.contest_id = t2.contest_id
)

SELECT * FROM result
WHERE sum_tv + sum_tuv + sum_ts + sum_tas != 0
ORDER BY cts_id;
