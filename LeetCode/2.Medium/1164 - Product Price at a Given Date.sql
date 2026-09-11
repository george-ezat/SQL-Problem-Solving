WITH latest_changes AS (
    SELECT
        product_id,
        MAX(change_date) AS latest_change_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY
        product_id
),
latest_prices AS (
    SELECT
        l.product_id,
        p.new_price AS price
    FROM
        latest_changes AS l
        INNER JOIN Products AS p ON l.product_id = p.product_id
            AND l.latest_change_date = p.change_date
),
initial_prices AS (
    SELECT DISTINCT
        product_id,
        10 AS initial_price
    FROM
        Products
)
SELECT
    p.product_id,
    COALESCE(lp.price, p.initial_price) AS price
FROM
    initial_prices AS p
    LEFT JOIN latest_prices AS lp ON p.product_id = lp.product_id;
