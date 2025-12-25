WITH levels_cte AS (
    -- Calculate vertical depth (Level 1 = Top Manager)
    SELECT
        employee_id,
        employee_name,
        1 AS level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT 
        e.employee_id,
        e.employee_name,
        l.level + 1
    FROM Employees e
    JOIN levels_cte l ON e.manager_id = l.employee_id
),
relationships_cte AS (
    -- Map every manager to all their descendants (direct & indirect)
    -- Start with self-reference to simplify recursion
    SELECT
        employee_id AS manager_id,
        employee_id AS member_id,
        salary AS member_salary
    FROM Employees

    UNION ALL

    SELECT
        rc.manager_id,
        e.employee_id,
        e.salary
    FROM relationships_cte rc
    JOIN Employees e ON rc.member_id = e.manager_id
)
SELECT
    l.employee_id,
    l.employee_name,
    l.level,
    -- Subtract 1 to exclude the manager themselves
    COUNT(r.member_id) - 1 AS team_size,
    SUM(r.member_salary) AS budget
FROM levels_cte l
    JOIN relationships_cte r ON l.employee_id = r.manager_id
GROUP BY
    l.employee_id,
    l.employee_name,
    l.level
ORDER BY
    l.level ASC,
    budget DESC,
    l.employee_name ASC;