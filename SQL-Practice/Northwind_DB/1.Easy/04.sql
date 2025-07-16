-- Show the employee_id, order_id, customer_id, required_date, shipped_date
-- from all orders shipped later than the required date

SELECT
  employee_id,
  order_id,
  customer_id,
  required_date,
  shipped_date
FROM orders
WHERE shipped_date > required_date;