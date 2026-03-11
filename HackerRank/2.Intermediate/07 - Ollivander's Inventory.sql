-- For each age see the powers and find the minimum coins gets that power

WITH CTE AS (
    SELECT
        W.id,
        WP.age,
        W.coins_needed AS coins,
        W.power,
        ROW_NUMBER() OVER (
            PARTITION BY
                WP.age,
                W.power
            ORDER BY
                W.coins_needed
        ) AS wand_rank
    FROM
        Wands AS W
        INNER JOIN Wands_Property AS WP ON W.code = WP.code
    WHERE WP.is_evil = 0
)

SELECT
    id,
    age,
    coins,
    power
FROM CTE
WHERE wand_rank = 1
ORDER BY
    power DESC,
    age DESC;
