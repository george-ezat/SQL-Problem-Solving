-- SQL Server

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @result INT;

    WITH ranked_salaries AS(
        SELECT
            salary,
            DENSE_RANK() OVER(
                ORDER BY salary DESC
            ) AS rnk
        FROM
            Employee
    )
    SELECT
        @result = salary
    FROM
        ranked_salaries
    WHERE
        rnk = @N;

    RETURN @result;
END


-- MySQL

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
        SELECT
            DISTINCT salary
        FROM
            Employee
        ORDER BY
            salary DESC
        LIMIT
            N, 1
    );
END
