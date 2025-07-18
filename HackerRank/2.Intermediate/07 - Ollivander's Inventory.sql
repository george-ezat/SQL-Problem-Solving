-- For each age see the powers and find the minimum coins gets that power

WITH CTE AS (
    SELECT
        W.id AS id,
        WP.age AS age,
        W.coins_needed AS coins,
        W.power AS power,
        ROW_NUMBER() OVER (
            PARTITION BY
                WP.age,
                W.power
            ORDER BY
                W.coins_needed
        ) AS wand_rank
    FROM
        Wands W
        JOIN Wands_Property WP ON W.code = WP.code
    WHERE
        WP.is_evil = 0
)
SELECT
    id,
    age,
    coins,
    power
FROM
    CTE
WHERE
    wand_rank = 1
ORDER BY
    power DESC,
    age DESC;