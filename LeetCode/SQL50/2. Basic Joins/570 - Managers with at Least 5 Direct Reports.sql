WITH AtLeastFive AS(
    SELECT
        managerId,
        COUNT(managerId) AS CNT
    FROM
        Employee
    GROUP BY
        managerId
    HAVING
        COUNT(managerId) >= 5
)
SELECT
    E.name
FROM
    Employee AS E
    JOIN AtLeastFive AS A ON E.id = A.managerId;

-- You can also use subquery and IN instead