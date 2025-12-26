-- MSSQL Solution
SELECT
    customer_id
FROM
    customer_transactions
GROUP BY
    customer_id
HAVING
    DATEDIFF(DAY, MIN(transaction_date), MAX(transaction_date)) >= 30
    AND SUM(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 END) >= 3
    AND (SUM(CASE WHEN transaction_type = 'refund' THEN 1.0 ELSE 0 END) / COUNT(*)) < 0.2
ORDER BY
    customer_id;


-- PostgreSQL Solution
SELECT
    customer_id
FROM
    customer_transactions
GROUP BY
    customer_id
HAVING
    MAX(transaction_date) - MIN(transaction_date) >= 30
    AND SUM(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 END) >= 3
    AND (SUM(CASE WHEN transaction_type = 'refund' THEN 1.0 ELSE 0 END) / COUNT(*)) < 0.2
ORDER BY
    customer_id;