-- Very Simple and Readable Solution

WITH consecutive_nums AS(
    SELECT
        LAG(num) OVER(ORDER BY id) AS lag,
        num,
        LEAD(num) OVER(ORDER BY id) AS lead
    FROM
        Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    consecutive_nums
WHERE
    num = lag
    AND num = lead;