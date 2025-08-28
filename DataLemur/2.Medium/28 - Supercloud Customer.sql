WITH cust_prod AS (
    SELECT
        cc.customer_id,
        COUNT(DISTINCT p.product_category) AS cnt
    FROM
        customer_contracts AS cc
        JOIN products AS p ON cc.product_id = p.product_id
    GROUP BY
        cc.customer_id
)
SELECT
    customer_id
FROM
    cust_prod
WHERE
    cnt = (SELECT COUNT(DISTINCT product_category) FROM products);