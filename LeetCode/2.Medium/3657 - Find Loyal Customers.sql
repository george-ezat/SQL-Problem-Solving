-- PostgreSQL Solution

SELECT
    customer_id
FROM
    customer_transactions
GROUP BY
    customer_id
HAVING
    COUNT(CASE WHEN transaction_type = 'purchase' THEN 1 END) >= 3
    AND MAX(transaction_date) - MIN(transaction_date) >= 30
    AND AVG(CASE WHEN transaction_type = 'refund' THEN 1.0 ELSE 0.0 END) < 0.2
ORDER BY
    customer_id;


-- In MSSQL: Use DATEDIFF(DAY, MIN(transaction_date), MAX(transaction_date))
