WITH q1 AS (
    SELECT
        product_id
    FROM
        sales
    GROUP BY
        product_id
    HAVING
        MIN(sale_date) >= '2019-01-01'
        AND MAX(sale_date) <= '2019-03-31'
)

SELECT
    q1.product_id,
    p.product_name
FROM q1
    INNER JOIN product AS p ON q1.product_id = p.product_id;
