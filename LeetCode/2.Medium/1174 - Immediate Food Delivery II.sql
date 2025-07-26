-- Readable Solution

WITH first_orders AS (
    SELECT
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY
                customer_id
            ORDER BY
                order_date
        ) AS order_rank
    FROM
        Delivery
)
SELECT
    ROUND(
        AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1.0
                ELSE 0.0
            END
        ) * 100.0,
        2
    ) AS immediate_percentage
FROM
    first_orders
WHERE
    order_rank = 1;