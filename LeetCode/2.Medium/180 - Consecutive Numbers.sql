-- Very Simple and Readable Solution

-- This solution is not strictly correct; It ignores id gaps.
-- If the table has IDs 1, 2, 5 and all have num = 7, LEAD and LAG
-- will see them as consecutive and return 7 as a result.

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


-- A Strictly Correct Solution:

WITH cte AS (
    SELECT
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) as grp
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
GROUP BY num, grp
HAVING COUNT(*) >= 3;

-- If IDs and Row Numbers both increment by 1, their difference (id - rn)
-- will stay CONSTANT for a consecutive block.