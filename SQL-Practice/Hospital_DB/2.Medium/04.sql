-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
-- Primary diagnosis is stored in the admissions table.

SELECT
  P.patient_id,
  P.first_name,
  P.last_name
FROM patients P
  INNER JOIN admissions A ON P.patient_id = A.patient_id
WHERE A.diagnosis = 'Dementia';

-- OR

SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );