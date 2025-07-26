SELECT
    P.product_id,
    COALESCE(
        CAST(SUM(P.price * U.units) / SUM(U.units) AS DECIMAL(10,2))
        , 0) AS average_price
FROM
    Prices AS P
    LEFT JOIN UnitsSold AS U ON U.product_id = P.product_id
    AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY
    P.product_id;