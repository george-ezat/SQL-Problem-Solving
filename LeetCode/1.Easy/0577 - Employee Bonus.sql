SELECT
    e.name,
    b.bonus
FROM
    Employee AS e
    LEFT JOIN Bonus AS b ON e.empId = b.empId
WHERE
    b.bonus IS NULL
    OR b.bonus < 1000;
