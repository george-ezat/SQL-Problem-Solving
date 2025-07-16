-- Show the first_name, last_name. hire_date of the most recently hired employee.

SELECT
  first_name,
  last_name,
  hire_date
FROM employees
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees
  );