-- Show first and last name, allergies from patients which have
-- allergies to either 'Penicillin' or 'Morphine'. Show results
-- ordered ascending by allergies then by first_name then by last_name.

SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE
  allergies IN('Penicillin', 'Morphine')
ORDER BY
  allergies ASC,
  first_name ASC,
  last_name ASC;