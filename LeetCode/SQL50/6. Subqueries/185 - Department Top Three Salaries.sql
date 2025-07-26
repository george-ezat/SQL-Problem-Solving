WITH top3 AS(
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER(
            PARTITION BY
                D.name
            ORDER BY
                E.salary DESC
        ) AS ranked_salary
    FROM
        Employee AS E
        JOIN Department AS D ON E.departmentId = D.id
)
SELECT
    Department,
    Employee,
    Salary
FROM
    top3
WHERE
    ranked_salary < 4;