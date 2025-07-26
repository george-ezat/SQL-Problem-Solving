-- This problem has many different solutions

-- Easiest

SELECT
    MAX(salary) AS SecondHighestSalary
FROM
    Employee
WHERE
    salary < (SELECT MAX(salary) FROM Employee);


-- MySQL and PostgreSQL: LIMIT & OFFSET

SELECT
    (
        SELECT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1
        OFFSET 1
    ) AS SecondHighestSalary;
-- or use shorthand(in MySQL) >> LIMIT 1, 1 >> LIMIT (offset), (row_count)


-- SQL Server: OFFSET & FETCH

SELECT
    (
        SELECT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
    ) AS SecondHighestSalary;


-- Also you can solve it using CTE, subquery, or window function(ROW_COUNT)