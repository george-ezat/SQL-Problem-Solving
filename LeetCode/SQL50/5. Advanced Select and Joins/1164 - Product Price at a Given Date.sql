WITH latest_changes AS (
    SELECT
        product_id,
        MAX(change_date) AS change_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY
        product_id
),
latest_prices AS (
    SELECT
        P.product_id,
        P.new_price AS price
    FROM
        Products AS P
        JOIN latest_changes AS L ON P.product_id = L.product_id
        AND P.change_date = L.change_date
),
distinct_products AS (
    SELECT DISTINCT
        product_id
    FROM
        Products
)
SELECT
    DP.product_id,
    COALESCE(LP.price, 10) AS price
FROM
    distinct_products AS DP
    LEFT JOIN latest_prices AS LP ON DP.product_id = LP.product_id;