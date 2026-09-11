WITH ranked_employee_salaries AS (
    SELECT
        name AS employee,
        salary,
        departmentId AS id,
        RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM
        employee
),
highest_salary_employees AS (
    SELECT
        employee,
        salary,
        id
    FROM
        ranked_employee_salaries
    WHERE rnk = 1
)
SELECT
    d.name AS department,
    e.employee,
    e.salary
FROM
    highest_salary_employees AS e
    INNER JOIN department AS d ON e.id = d.id;
