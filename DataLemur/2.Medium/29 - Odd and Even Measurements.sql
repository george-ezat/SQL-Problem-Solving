WITH numbered_ms AS(
    SELECT
        measurement_time::DATE AS measurement_day,
        measurement_value,
        ROW_NUMBER() OVER(
            PARTITION BY measurement_time::DATE
            ORDER BY measurement_time
        ) AS n
    FROM
        measurements
)
SELECT
    measurement_day,
    SUM(CASE WHEN n % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN n % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
    -- OR (PostgreSQL ONLY)
    -- SUM(measurement_value) FILTER (WHERE n % 2 <> 0) AS odd_sum,
    -- SUM(measurement_value) FILTER (WHERE n % 2 = 0) AS even_sum
FROM
    numbered_ms
GROUP BY
    measurement_day;