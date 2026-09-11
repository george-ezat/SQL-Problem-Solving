WITH daily_totals AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
moving_sum AS (
    SELECT
        visited_on,
        ROW_NUMBER() OVER (
            ORDER BY visited_on
        ) AS day_ord,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount
    FROM daily_totals
)
SELECT
    visited_on,
    amount,
    ROUND(amount / 7.0, 2) AS average_amount
FROM
    moving_sum
WHERE
    day_ord >= 7
ORDER BY
    visited_on;

-- we don't need to add a second window function to calculate the
-- avg, because we already calculated the sum. So we can divide it
-- by 7.0 to calc the avg easily.
