-- Show first name and last name of patients that weight
-- within the range of 100 to 120 (inclusive)

SELECT
  first_name,
  last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;