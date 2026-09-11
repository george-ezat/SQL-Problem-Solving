-- Simple and Readable Solution

WITH cte AS (
    SELECT
        person_name,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS total_weight -- this will calculate the cumulative sum
    FROM queue
)
SELECT person_name
FROM cte
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

-- OR

WITH cte AS (
    SELECT
        person_name,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS total_weight
    FROM queue
)
SELECT person_name
FROM cte
WHERE
    total_weight = (
        SELECT MAX(total_weight)
        FROM cte
        WHERE total_weight <= 1000
    );
