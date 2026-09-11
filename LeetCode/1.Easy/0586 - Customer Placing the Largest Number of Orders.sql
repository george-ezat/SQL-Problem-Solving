SELECT
    TOP 1 AS customer_number
FROM
    Orders
GROUP BY
    customer_number
ORDER BY
    COUNT(*) DESC;

-- Use "LIMIT 1" instead of "TOP 1" in MySQL and PostgreSQL
