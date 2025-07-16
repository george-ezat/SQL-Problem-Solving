-- Show how much money the company lost due to giving discounts each year,
-- order the years from most recent to least recent. Round to 2 decimal places

SELECT
  YEAR(O.order_date) AS orders_year,
  ROUND(
    SUM(OD.discount * OD.quantity * P.unit_price),
    2
  ) AS discount_amount
FROM orders O
  INNER JOIN order_details OD ON O.order_id = OD.order_id
  INNER JOIN products P ON OD.product_id = P.product_id
GROUP BY YEAR(O.order_date)
ORDER BY orders_year DESC;