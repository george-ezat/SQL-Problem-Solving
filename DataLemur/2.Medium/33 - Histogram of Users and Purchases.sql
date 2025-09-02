WITH last_transactions AS (
    SELECT
        user_id,
        transaction_date,
        COUNT(product_id) AS purchase_count,
        ROW_NUMBER() OVER (
            PARTITION BY
                user_id
            ORDER BY
                transaction_date DESC
        ) AS rnk
    FROM
        user_transactions
    GROUP BY
        user_id,
        transaction_date
)
SELECT
    transaction_date,
    user_id,
    purchase_count
FROM
    last_transactions
WHERE
    rnk = 1
ORDER BY
    transaction_date;