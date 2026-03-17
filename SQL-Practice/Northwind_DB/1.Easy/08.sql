-- Show the first_name, last_name. hire_date of the most recently hired employee.

SELECT
    e1.first_name,
    e1.last_name,
    e1.hire_date
FROM employees AS e1
WHERE e1.hire_date = (
        SELECT MAX(e2.hire_date)
        FROM employees AS e2
    );
