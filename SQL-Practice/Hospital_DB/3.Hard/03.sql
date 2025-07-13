-- Show patient_id, first_name, last_name, and attending doctor's specialty.
-- Show only the patients who has a diagnosis as 'Epilepsy'
-- and the doctor's first name is 'Lisa'
-- Check patients, admissions, and doctors tables for required information.

SELECT
  P.patient_id,
  P.first_name,
  P.last_name,
  D.specialty
FROM patients P
  INNER JOIN admissions A ON P.patient_id = A.patient_id
  INNER JOIN doctors D ON A.attending_doctor_id = D.doctor_id
WHERE
  A.diagnosis = 'Epilepsy'
  AND D.first_name = 'Lisa';