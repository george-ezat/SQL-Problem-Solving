WITH ranked_employees AS (
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        RANK() OVER (
            PARTITION BY
                E.departmentId
            ORDER BY
                E.salary DESC
            ) AS rank
    FROM
        Employee AS E
        JOIN Department AS D ON E.departmentId = D.id
)
SELECT
    Department,
    Employee,
    Salary
FROM
    ranked_employees
WHERE
    rank = 1;