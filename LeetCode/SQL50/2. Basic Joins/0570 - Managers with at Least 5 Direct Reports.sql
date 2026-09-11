WITH at_least_five AS (
    SELECT managerId AS id
    FROM employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT e.name
FROM
    at_least_five AS fv
    INNER JOIN employee AS e ON fv.id = e.id;
