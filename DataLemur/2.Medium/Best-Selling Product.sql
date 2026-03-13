WITH ranked_product_sales AS (
    SELECT
        p.product_name,
        p.category_name,
        ROW_NUMBER() OVER (
            PARTITION BY p.category_name
            ORDER BY ps.sales_quantity DESC, ps.rating DESC
        ) AS rnk
    FROM products AS p
        INNER JOIN product_sales AS ps ON p.product_id = ps.product_id
)

SELECT
    product_name,
    category_name
FROM ranked_product_sales
WHERE rnk = 1
ORDER BY category_name;
