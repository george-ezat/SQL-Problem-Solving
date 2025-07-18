WITH CTE AS(
    SELECT
        S.Name,
        P.Salary,
        F.Friend_ID
    FROM
        Students AS S
        JOIN Friends AS F ON S.ID = F.ID
        JOIN Packages AS P ON S.ID = P.ID
)
SELECT
    Name
FROM
    CTE
    JOIN Packages AS P2 ON CTE.Friend_ID = P2.ID
WHERE
    P2.Salary > CTE.Salary
ORDER BY
    P2.Salary;