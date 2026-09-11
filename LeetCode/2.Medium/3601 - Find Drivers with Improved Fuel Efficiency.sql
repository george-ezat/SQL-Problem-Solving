WITH trip_halfs AS (
    SELECT
        driver_id,
        AVG(
            CASE
                WHEN EXTRACT(MONTH FROM trip_date) < 7
                    THEN distance_km / fuel_consumed
            END
        ) AS first_half_avg,
        AVG(
            CASE
                WHEN EXTRACT(MONTH FROM trip_date) > 6
                    THEN distance_km / fuel_consumed
            END
        ) AS second_half_avg
    FROM
        trips
    GROUP BY
        driver_id
)
SELECT
    th.driver_id,
    d.driver_name,
    ROUND(th.first_half_avg, 2) AS first_half_avg,
    ROUND(th.second_half_avg, 2) AS second_half_avg,
    ROUND(th.second_half_avg - th.first_half_avg, 2) AS efficiency_improvement
FROM trip_halfs AS th
    INNER JOIN drivers AS d ON th.driver_id = d.driver_id
WHERE
    th.second_half_avg > th.first_half_avg
ORDER BY
    efficiency_improvement DESC,
    d.driver_name ASC;
