-- More Readable Solution

WITH orders_2019 AS(
    SELECT
        buyer_id,
        COUNT(*) AS orders_cnt
    FROM
        Orders
    WHERE
        YEAR(order_date) = 2019
    GROUP BY
        buyer_id
)
SELECT
    U.user_id AS buyer_id,
    U.join_date,
    COALESCE(O.orders_cnt, 0) AS orders_in_2019
FROM
    Users AS U
    LEFT JOIN orders_2019 AS O ON U.user_id = O.buyer_id


-- Short Solution

SELECT
    U.user_id AS buyer_id,
    U.join_date,
    COUNT(O.order_id) AS orders_in_2019
FROM
    Users AS U
    LEFT JOIN Orders AS O ON U.user_id = O.buyer_id
    AND YEAR(O.order_date) = 2019
GROUP BY
    U.user_id,
    U.join_date