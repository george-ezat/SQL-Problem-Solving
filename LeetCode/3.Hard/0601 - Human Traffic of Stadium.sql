WITH high_traffic_groups AS (
    SELECT
        id,
        visit_date,
        people,
        -- Since id and row_number increment by 1 for consecutive records, their
        -- difference (id - row_number) remains constant within a consecutive block.
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM stadium
    WHERE people >= 100
),
consecutive_groups AS (
    SELECT grp
    FROM high_traffic_groups
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
SELECT
    t.id,
    t.visit_date,
    t.people
FROM
    high_traffic_groups AS t
    INNER JOIN consecutive_groups AS c ON t.grp = c.grp
ORDER BY
    t.visit_date ASC;
