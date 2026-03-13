WITH UserCategories AS (
    SELECT DISTINCT
        p.user_id,
        i.category
    FROM ProductPurchases AS p
        INNER JOIN ProductInfo AS i ON p.product_id = i.product_id
)

SELECT
    t1.category AS category1,
    t2.category AS category2,
    COUNT(t1.user_id) AS customer_count
FROM UserCategories AS t1
    INNER JOIN UserCategories AS t2 ON t1.user_id = t2.user_id
        AND t1.category < t2.category
GROUP BY
    t1.category,
    t2.category
HAVING COUNT(t1.user_id) > 2
ORDER BY
    customer_count DESC,
    category1 ASC,
    category2 ASC;
