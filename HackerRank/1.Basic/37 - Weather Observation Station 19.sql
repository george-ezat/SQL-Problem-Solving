SELECT
    CAST(
        SQRT(
            POWER(MAX(LONG_W) - MIN(LONG_W), 2) + POWER(MAX(LAT_N) - MIN(LAT_N), 2)
        ) AS DECIMAL(10, 4)
    ) AS EuclideanDistance
FROM STATION;


-- Euclidean Distance between two points: sqrt(power(x1 - x2, 2) + power(y1 - y2, 2))