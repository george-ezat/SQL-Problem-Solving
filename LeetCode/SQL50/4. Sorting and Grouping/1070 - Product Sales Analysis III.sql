-- Using JOIN and CTE

WITH first_product_year AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM sales
    GROUP BY product_id
)
SELECT
    p.product_id,
    p.first_year,
    s.quantity,
    s.price
FROM first_product_year AS p
    INNER JOIN sales AS s ON p.product_id = s.product_id
        AND p.first_year = s.year;

-- Using RANK and CTE

WITH sorted_sales AS (
    SELECT
        product_id,
        year,
        quantity,
        price,
        RANK() OVER (
            PARTITION BY product_id
            ORDER BY year
        ) AS rnk
    FROM
        sales
)
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    sorted_sales
WHERE
    rnk = 1;
