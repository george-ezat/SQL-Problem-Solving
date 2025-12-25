WITH high_traffic AS(
    SELECT
        id,
        visit_date,
        people,
        -- Since id and row_number increment by 1 for consecutive records, their
        -- difference (id - row_number) remains constant within a consecutive block.
        id - row_number() OVER(ORDER BY visit_date) AS grp
    FROM Stadium
    WHERE people >= 100
),
consecutive_groups AS(
    -- This enables us to count how many rows in each group to identify the needed groups.
    SELECT grp
    FROM high_traffic
    GROUP BY grp
    HAVING count(*) > 2
)
SELECT id, visit_date, people
FROM high_traffic
WHERE grp IN (SELECT grp FROM consecutive_groups)
ORDER BY visit_date;