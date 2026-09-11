WITH ranked_products AS (
    SELECT
        store_id,
        product_name,
        quantity,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY price DESC
        ) AS rnk,
        COUNT(*) OVER (
            PARTITION BY store_id
        ) AS cnt
    FROM
        inventory
),
imbalance_pairs AS (
    SELECT
        store_id,
        product_name,
        quantity,
        rnk
    FROM
        ranked_products
    WHERE
        cnt >= 3
        AND rnk IN (1, cnt)
)
SELECT
    t1.store_id,
    s.store_name,
    s.location,
    t1.product_name AS most_exp_product,
    t2.product_name AS cheapest_product,
    ROUND(1.0 * t2.quantity / t1.quantity, 2) AS imbalance_ratio
FROM
    imbalance_pairs AS t1
    INNER JOIN imbalance_pairs AS t2
        ON t1.store_id = t2.store_id AND t1.rnk < t2.rnk
    INNER JOIN stores AS s ON t1.store_id = s.store_id
WHERE
    t1.quantity < t2.quantity
ORDER BY
    imbalance_ratio DESC,
    s.store_name ASC;
