SELECT
    item_count
FROM
    items_per_order
WHERE
    order_occurrences = (
        SELECT MAX(order_occurrences)
        FROM items_per_order
    )
ORDER BY
    item_count;