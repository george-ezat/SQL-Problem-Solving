SELECT
    CAST(
        (
            (MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W))
        ) AS DECIMAL(10, 4)
    ) AS Manhatten_Distance
FROM STATION;

-- Manhatten Distance between two points: |x1 - x2| + |y1 - y2|

-- Note: We need the absolute value, so we will use abs or calc (max - min) instead
-- because it will return the abs value