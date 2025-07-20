SELECT
    E.name AS Employee
FROM
    Employee AS E
    JOIN Employee AS M ON E.managerId = M.id
    AND E.salary > M.salary;


-- OR


SELECT
    E.name AS Employee
FROM
    Employee AS E
    JOIN Employee AS M ON E.managerId = M.id
WHERE
    E.salary > M.salary;