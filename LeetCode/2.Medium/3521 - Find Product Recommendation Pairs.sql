WITH PairedPurchases AS (
    SELECT
        t1.product_id AS product1_id,
        t2.product_id AS product2_id,
        COUNT(*) AS customer_count
    FROM ProductPurchases AS t1
        INNER JOIN ProductPurchases AS t2
            ON t1.user_id = t2.user_id AND t1.product_id < t2.product_id
    GROUP BY
        t1.product_id,
        t2.product_id
    HAVING COUNT(*) > 2
)

SELECT
    pp.product1_id,
    pp.product2_id,
    i1.category AS product1_category,
    i2.category AS product2_category,
    pp.customer_count
FROM PairedPurchases AS pp
    INNER JOIN ProductInfo AS i1 ON pp.product1_id = i1.product_id
    INNER JOIN ProductInfo AS i2 ON pp.product2_id = i2.product_id
ORDER BY
    pp.customer_count DESC,
    pp.product1_id ASC,
    pp.product2_id ASC;
