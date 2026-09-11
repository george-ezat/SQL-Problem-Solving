-- Readable Solution

WITH first_orders AS (
    SELECT
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rnk
    FROM
        Delivery
)
SELECT
    ROUND(
        100.0 * AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1
                ELSE 0
            END
        ), 2
    ) AS immediate_percentage
FROM
    first_orders
WHERE
    rnk = 1;
