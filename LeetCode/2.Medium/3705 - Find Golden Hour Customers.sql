WITH customer_stats AS (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        AVG(
            CASE
                WHEN EXTRACT(HOUR FROM order_timestamp)
                    IN (11, 12, 13, 18, 19, 20) THEN 1.0
                ELSE 0.0
            END
        ) AS peak_hour_rate,
        ROUND(AVG(order_rating), 2) AS average_rating,
        AVG(CASE WHEN order_rating IS NOT NULL THEN 1.0 ELSE 0.0 END)
            AS rating_rate
    FROM
        restaurant_orders
    GROUP BY
        customer_id
    HAVING
        COUNT(*) >= 3
)
SELECT
    customer_id,
    total_orders,
    ROUND(peak_hour_rate * 100) AS peak_hour_percentage,
    average_rating
FROM
    customer_stats
WHERE
    peak_hour_rate >= 0.6
    AND average_rating >= 4.0
    AND rating_rate >= 0.5
ORDER BY
    average_rating DESC,
    customer_id DESC;
