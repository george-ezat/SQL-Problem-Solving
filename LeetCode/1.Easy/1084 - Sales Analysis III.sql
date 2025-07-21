SELECT
    P.product_id,
    P.product_name
FROM
    Product AS P
    JOIN Sales AS S ON P.product_id = S.product_id
GROUP BY
    P.product_id,
    P.product_name
HAVING
    MIN(S.sale_date) >= '2019-01-01'
    AND MAX(S.sale_date) <= '2019-03-31';