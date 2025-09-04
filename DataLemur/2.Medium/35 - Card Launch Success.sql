WITH first_month AS (
    SELECT
        card_name,
        issued_amount,
        ROW_NUMBER() OVER (
            PARTITION BY
                card_name
            ORDER BY
                issue_year,
                issue_month
        ) AS rnk
    FROM
        monthly_cards_issued
)
SELECT
    card_name,
    issued_amount
FROM
    first_month
WHERE
    rnk = 1
ORDER BY
    issued_amount DESC;