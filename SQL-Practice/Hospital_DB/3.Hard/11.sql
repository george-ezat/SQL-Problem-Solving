-- We need a breakdown for the total amount of admissions each doctor has started each year.
-- Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.

SELECT
  D.doctor_id,
  CONCAT(D.first_name, ' ', D.last_name) AS doctor_name,
  D.specialty,
  YEAR(admission_date) AS selected_year,
  COUNT(patient_id) AS total_admissions
FROM doctors AS D
  INNER JOIN admissions A ON D.doctor_id = A.attending_doctor_id
GROUP BY
  D.doctor_id,
  doctor_name,
  D.specialty,
  selected_year
ORDER BY
  D.doctor_id ASC,
  selected_year ASC;