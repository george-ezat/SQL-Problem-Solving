WITH Indexed_Table AS (
    SELECT
        X,
        Y,
        ROW_NUMBER() OVER (ORDER BY X) AS ROW_NUMBER
    FROM
        Functions
)
SELECT
    TOP 50 PERCENT
    T1.X,
    T1.Y
FROM
    Indexed_Table AS T1
    JOIN Indexed_Table AS T2 ON T1.X = T2.Y
    AND T1.Y = T2.X
    AND T1.row_number <> T2.row_number
ORDER BY
    X;