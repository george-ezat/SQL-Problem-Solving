SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM
    visits AS v
WHERE
    NOT EXISTS (
        SELECT 1
        FROM transactions AS t
        WHERE v.visit_id = t.visit_id
    )
GROUP BY
    v.customer_id;
