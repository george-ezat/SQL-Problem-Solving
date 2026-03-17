-- Show the first_name, last_name, and height of the patient with the greatest height.

SELECT
    p1.first_name,
    p1.last_name,
    p1.height
FROM patients AS p1
WHERE p1.height = (
        SELECT MAX(p2.height)
        FROM patients AS p2
    );

-- OR


-- This solution is better when there are many have the same max height
WITH cte AS (
    SELECT
        first_name,
        last_name,
        height,
        ROW_NUMBER() OVER (
            ORDER BY height DESC
        ) AS rnk
    FROM patients
)

SELECT
    first_name,
    last_name,
    height
FROM cte
WHERE rnk = 1;
