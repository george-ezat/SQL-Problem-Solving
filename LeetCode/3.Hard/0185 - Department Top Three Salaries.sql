WITH top3 AS (
    SELECT
        d.name AS department,
        e.name AS employee,
        e.salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY e.salary DESC
        ) AS rnk
    FROM
        Employee AS e
        INNER JOIN Department AS d ON e.departmentId = d.id
)
SELECT
    department,
    employee,
    salary
FROM
    top3
WHERE
    rnk <= 3;
