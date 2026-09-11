-- This Solution for PostgreSQL
-- For SQL Server Solution >> Replace the EXTRACT(MONTH ...) with MONTH(sale_date)

WITH seasonal_sales AS (
    SELECT
        CASE
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (1, 2, 12) THEN 'Winter'
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN EXTRACT(MONTH FROM s.sale_date) IN (6, 7, 8) THEN 'Summer'
            ELSE 'Fall'
        END AS season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM
        products AS p
        INNER JOIN sales AS s ON p.product_id = s.product_id
    GROUP BY
        1, 2
),
ranked_seasonal_sales AS (
    SELECT
        season,
        category,
        total_quantity,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY season
            ORDER BY total_quantity DESC, total_revenue DESC, category ASC
        ) AS rnk
    FROM seasonal_sales
)
SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM
    ranked_seasonal_sales
WHERE
    rnk = 1
ORDER BY
    season ASC;
