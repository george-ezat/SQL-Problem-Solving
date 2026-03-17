-- Show the employee's first_name and last_name, a "num_orders" column
-- with a count of the orders taken, and a column called "Shipped" that
-- displays "On Time" if the order shipped_date is less or equal to
-- the required_date, "Late" if the order shipped late, "Not Shipped"
-- if shipped_date is null.

-- Order by employee last_name, then by first_name, and then descending by number of orders.

WITH cte AS (
    SELECT
        e.first_name,
        e.last_name,
        CASE
            WHEN o.shipped_date <= o.required_date THEN 'On Time'
            WHEN o.shipped_date > o.required_date THEN 'Late'
            WHEN o.shipped_date IS NULL THEN 'Not Shipped'
        END AS shipped
    FROM orders AS o
        INNER JOIN employees AS e ON o.employee_id = e.employee_id
)

SELECT
    first_name,
    last_name,
    COUNT(shipped) AS num_orders,
    shipped
FROM cte
GROUP BY
    first_name,
    last_name,
    shipped
ORDER BY
    last_name ASC,
    first_name ASC,
    num_orders DESC;
