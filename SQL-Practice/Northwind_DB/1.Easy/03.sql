-- Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26

SELECT
  order_date,
  shipped_date,
  customer_id,
  freight
FROM orders
WHERE order_date = '2018-02-26';