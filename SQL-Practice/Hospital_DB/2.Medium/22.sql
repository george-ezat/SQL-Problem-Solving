-- For every admission, display the patient's full name, their admission diagnosis,
-- and their doctor's full name who diagnosed their problem.

SELECT
  CONCAT(P.first_name, ' ', P.last_name) AS patient_name,
  A.diagnosis,
  CONCAT(D.first_name, ' ', D.last_name) AS doctor_name
FROM admissions A
  INNER JOIN patients P ON A.patient_id = P.patient_id
  INNER JOIN doctors D ON A.attending_doctor_id = D.doctor_id;