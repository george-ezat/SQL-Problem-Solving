-- We are looking for a specific patient. Pull all columns for
-- the patient who matches the following criteria:
--   - First_name contains an 'r' after the first two letters.
--   - Identifies their gender as 'F'
--   - Born in February, May, or December
--   - Their weight would be between 60kg and 80kg
--   - Their patient_id is an odd number
--   - They are from the city 'Kingston'

SELECT *
FROM patients
WHERE
  (first_name LIKE '__r%')
  AND (gender = 'F')
  AND (MONTH(birth_date) IN (2, 5, 12))
  AND (weight BETWEEN 60 AND 80)
  AND (patient_id % 2 <> 0)
  AND (city = 'Kingston');