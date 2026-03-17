-- For every admission, display the patient's full name, their admission diagnosis,
-- and their doctor's full name who diagnosed their problem.

SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.diagnosis,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
FROM admissions AS a
    INNER JOIN patients AS p ON a.patient_id = p.patient_id
    INNER JOIN doctors AS d ON a.attending_doctor_id = d.doctor_id;
