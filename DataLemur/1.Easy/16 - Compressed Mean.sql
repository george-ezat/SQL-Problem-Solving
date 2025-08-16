SELECT
    ROUND(
        SUM(item_count::DECIMAL * order_occurrences)
        /
        SUM(order_occurrences)
        , 1) AS mean
FROM
    items_per_order;

-- Note that if you don't specify any of the columns to be decimal
-- the division will be integer division