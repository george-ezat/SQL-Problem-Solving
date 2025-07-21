SELECT
    P.product_name,
    S.year,
    S.price
FROM
    Sales AS S
    JOIN Product AS P ON S.product_id = P.product_id;