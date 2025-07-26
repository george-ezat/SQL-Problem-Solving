-- Using JOIN and CTE

WITH first_years AS(
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
)
SELECT
    S.product_id,
    FS.first_year,
    S.quantity,
    S.price
FROM
    Sales AS S
    JOIN first_years AS FS ON S.product_id = FS.product_id
    AND S.year = FS.first_year


-- Using correlated subquery

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    Sales AS S
WHERE
    year =  (
        SELECT
            MIN(year)
        FROM
            Sales AS S2
        WHERE
            S.product_id = S2.product_id
    )