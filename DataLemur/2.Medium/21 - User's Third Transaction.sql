WITH user_trans AS(
    SELECT
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY transaction_date
        ) AS day_ord
    FROM
        transactions
)
SELECT
    user_id,
    spend,
    transaction_date
FROM
    user_trans
WHERE
    day_ord = 3;