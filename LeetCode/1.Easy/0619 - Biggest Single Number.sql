WITH cte AS (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING
        COUNT(num) = 1
)

SELECT
    MAX(num) AS num
FROM
    cte;

-- Note: MAX() will return NULL if the data set is empty (which is required here)
