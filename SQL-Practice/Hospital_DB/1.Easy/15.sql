-- Write a query to find the first_name, last name and birth date
-- of patients who has height greater than 160 and weight greater than 70

SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE height > 160 AND weight > 70;