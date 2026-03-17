-- Show how much money the company lost due to giving discounts each year,
-- order the years from most recent to least recent. Round to 2 decimal places

SELECT
    YEAR(o.order_date) AS orders_year,
    ROUND(
        SUM(od.discount * od.quantity * P.unit_price),
        2
    ) AS discount_amount
FROM orders AS o
    INNER JOIN order_details AS od ON o.order_id = od.order_id
    INNER JOIN products AS P ON od.product_id = P.product_id
GROUP BY YEAR(o.order_date)
ORDER BY orders_year DESC;
