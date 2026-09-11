WITH account_tsc AS (
    SELECT
        account,
        SUM(amount) AS balance
    FROM
        transactions
    GROUP BY
        account
    HAVING
        SUM(amount) > 10000
)

SELECT
    u.name,
    t.balance
FROM
    account_tsc AS t
    INNER JOIN users AS u ON t.account = u.account;
