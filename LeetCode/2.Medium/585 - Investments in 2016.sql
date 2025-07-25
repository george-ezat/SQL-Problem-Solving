-- We want to sum tiv_2016, where no one else has the same location
-- and its tiv_2015 must have appeared more than once.

WITH PolicyCounts AS (
    SELECT
        tiv_2016,
        COUNT(*) OVER (
            PARTITION BY
                lat,
                lon
        ) AS LocationCount,
        COUNT(*) OVER (
            PARTITION BY
                tiv_2015
        ) AS Tiv2015Count
    FROM
        Insurance
)
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    PolicyCounts
WHERE
    LocationCount = 1
    AND Tiv2015Count > 1;