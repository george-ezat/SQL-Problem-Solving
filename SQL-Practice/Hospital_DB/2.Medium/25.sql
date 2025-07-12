-- Show patient_id, first_name, last_name from patients
-- whose does not have any records in the admissions table.
-- (Their patient_id does not exist in any admissions.patient_id rows.)

SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM admissions
  );