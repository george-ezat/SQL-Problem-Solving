WITH product_pairs AS (
    SELECT
        p1.product_id AS product1_id,
        p2.product_id AS product2_id,
        COUNT(*) AS customer_count
    FROM
        ProductPurchases AS p1
        INNER JOIN ProductPurchases AS p2
            ON p1.user_id = p2.user_id AND p1.product_id < p2.product_id
    GROUP BY
        p1.product_id,
        p2.product_id
    HAVING
        COUNT(*) >= 3
)
SELECT
    p.product1_id,
    p.product2_id,
    i1.category AS product1_category,
    i2.category AS product2_category,
    p.customer_count
FROM
    product_pairs AS p
    INNER JOIN ProductInfo AS i1 ON p.product1_id = i1.product_id
    INNER JOIN ProductInfo AS i2 ON p.product2_id = i2.product_id
ORDER BY
    p.customer_count DESC,
    p.product1_id ASC,
    p.product2_id ASC;
