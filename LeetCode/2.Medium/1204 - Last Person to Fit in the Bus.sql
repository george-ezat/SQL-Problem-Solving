-- Simple and Readable Solution

WITH bus_turns AS (
    SELECT
        person_name,
        SUM(weight) OVER (
            ORDER BY
                turn
        ) AS total_weight -- this will calc the cumulative sum
    FROM
        Queue
)
SELECT
    person_name
FROM
    bus_turns
WHERE
    total_weight = (
        SELECT MAX(total_weight)
        FROM bus_turns
        WHERE total_weight <= 1000
    )