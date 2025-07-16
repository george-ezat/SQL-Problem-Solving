-- Show the employee's first_name and last_name, a "num_orders" column
-- with a count of the orders taken, and a column called "Shipped" that
-- displays "On Time" if the order shipped_date is less or equal to
-- the required_date, "Late" if the order shipped late, "Not Shipped"
-- if shipped_date is null.

-- Order by employee last_name, then by first_name, and then descending by number of orders.

WITH CTE AS(
    SELECT
      E.first_name,
      E.last_name,
      CASE
        WHEN O.shipped_date <= O.required_date THEN 'On Time'
        WHEN O.shipped_date > O.required_date THEN 'Late'
        WHEN O.shipped_date IS NULL THEN 'Not Shipped'
      END AS shipped
    FROM orders O
      INNER JOIN employees E ON O.employee_id = E.employee_id
  )
SELECT
  first_name,
  last_name,
  COUNT(shipped) AS num_orders,
  shipped
FROM CTE
GROUP BY
  first_name,
  last_name,
  shipped
ORDER BY
  last_name,
  first_name,
  num_orders DESC;