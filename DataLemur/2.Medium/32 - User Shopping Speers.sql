SELECT DISTINCT
    t1.user_id
FROM
    transactions AS t1
    JOIN transactions AS t2 ON t1.transaction_date::DATE = t2.transaction_date::DATE + 1
    JOIN transactions AS t3 ON t3.transaction_date::DATE = t1.transaction_date::DATE + 1
ORDER BY
    t1.user_id;