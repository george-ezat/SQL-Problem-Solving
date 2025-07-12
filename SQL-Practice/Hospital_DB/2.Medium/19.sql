-- Show first_name, last_name, and the total number of admissions attended for each doctor.
-- Every admission has been attended by a doctor.

SELECT
  D.first_name,
  D.last_name,
  COUNT(A.patient_id) AS admissions_total
FROM doctors D
  INNER JOIN admissions A ON D.doctor_id = A.attending_doctor_id
GROUP BY
  D.first_name,
  D.last_name;