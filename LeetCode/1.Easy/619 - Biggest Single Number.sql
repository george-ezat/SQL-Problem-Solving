SELECT 
    MAX(num) AS num
FROM (
    SELECT
        num,
        COUNT(num) as CNT
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING
        COUNT(num) = 1
) AS T

-- Note: MAX() will return NULL if the data set is empty (which is required here)