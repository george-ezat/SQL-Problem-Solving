-- This Solution for PostgreSQL
-- For SQL Server Solution >> Replace the EXTRACT(MONTH ...) with MONTH(sale_date)

WITH sales_with_season AS (
    SELECT *,
        CASE
            WHEN EXTRACT(MONTH FROM sale_date) IN (1,2,12) THEN 'Winter'
            WHEN EXTRACT(MONTH FROM sale_date) IN (3,4,5) THEN 'Spring'
            WHEN EXTRACT(MONTH FROM sale_date) IN (6,7,8) THEN 'Summer'
            ELSE 'Fall'
        END AS season
    FROM sales
),
seasonal_stats AS (
    SELECT
        s.season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.price * s.quantity) AS total_revenue
    FROM
        sales_with_season s
        JOIN products p ON s.product_id = p.product_id
    GROUP BY
        season, category
),
ranked_seasonal_stats AS (
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY season
            ORDER BY total_quantity DESC, total_revenue DESC
        ) AS rnk
    FROM seasonal_stats
)
SELECT
    season, category, total_quantity, total_revenue
FROM ranked_seasonal_stats
WHERE rnk = 1
ORDER BY season;