WITH cte AS (
    SELECT
        num,
        id - ROW_NUMBER() OVER (
            PARTITION BY num
            ORDER BY id
        ) AS grp
    FROM Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM
    cte
GROUP BY
    num,
    grp
HAVING
    COUNT(*) >= 3;

-- If IDs and Row Numbers both increment by 1, their difference (id - rn)
-- will stay CONSTANT for a consecutive block.
