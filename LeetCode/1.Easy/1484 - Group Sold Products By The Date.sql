-- SQL Server

WITH unq_sales AS (
    SELECT DISTINCT
        sell_date,
        product
    FROM activities
)

SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (
        ORDER BY product
    ) AS products
FROM
    unq_sales
GROUP BY
    sell_date
ORDER BY
    sell_date;

-- IN PostgreSQL: STRING_AGG(product, ',' ORDER BY product)
-- IN MySQL:      GROUP_CONCAT(product ORDER BY product SEPARATOR ',')
