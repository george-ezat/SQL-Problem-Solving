WITH ordered_functions AS (
    SELECT
        X,
        Y,
        ROW_NUMBER() OVER (ORDER BY X) AS RN
    FROM functions
)

SELECT DISTINCT
    f1.X,
    f1.Y
FROM ordered_functions AS f1
    INNER JOIN ordered_functions AS f2 ON f1.RN != f2.RN
        AND f1.X = f2.Y
        AND f1.Y = f2.X
WHERE f1.X <= f1.Y
ORDER BY f1.X;


-- OR Using UNION ALL (More Optimized)


SELECT
    f1.X,
    f1.Y
FROM Functions AS f1
    INNER JOIN Functions AS f2 ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X < f1.Y

UNION ALL

SELECT
    X,
    Y
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) > 1
ORDER BY X;
