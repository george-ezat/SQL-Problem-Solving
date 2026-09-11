-- More Readable Solution

WITH orders_2019 AS (
    SELECT
        buyer_id,
        COUNT(*) AS orders_cnt
    FROM
        Orders
    WHERE
        order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY
        buyer_id
)
SELECT
    u.user_id AS buyer_id,
    u.join_date,
    COALESCE(o.orders_cnt, 0) AS orders_in_2019
FROM
    Users AS u
    LEFT JOIN orders_2019 AS o ON u.user_id = o.buyer_id;


-- Short Solution

SELECT
    u.user_id AS buyer_id,
    u.join_date,
    COUNT(o.order_id) AS orders_in_2019
FROM
    Users AS u
    LEFT JOIN Orders AS o ON u.user_id = o.buyer_id
        AND o.order_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY
    u.user_id,
    u.join_date;
