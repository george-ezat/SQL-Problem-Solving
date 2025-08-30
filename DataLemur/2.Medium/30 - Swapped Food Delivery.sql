SELECT
    order_id,
    CASE
        WHEN order_id % 2 <> 0 THEN COALESCE(LEAD(item) OVER(ORDER BY order_id), item)
        WHEN order_id % 2 = 0 THEN LAG(item) OVER(ORDER BY order_id)
    END AS item
FROM
    orders;