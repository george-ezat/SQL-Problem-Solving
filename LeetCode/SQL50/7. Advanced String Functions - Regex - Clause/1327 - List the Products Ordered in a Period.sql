SELECT
    P.product_name,
    SUM(O.unit) AS unit
FROM
    Orders AS O
    JOIN Products AS P ON O.product_id = P.product_id
WHERE
    O.order_date LIKE '2020-02%'
GROUP BY
    P.product_name
HAVING
    SUM(O.unit) >= 100;