-- Display every patient that has at least one admission and show their
-- most recent admission along with the patient and doctor's full name.

SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.admission_date,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
FROM
    admissions AS a
    INNER JOIN patients AS p ON a.patient_id = p.patient_id
    INNER JOIN doctors AS d ON a.attending_doctor_id = d.doctor_id
WHERE a.admission_date = (
        SELECT MAX(a2.admission_date)
        FROM admissions AS a2
        WHERE a.patient_id = a2.patient_id
    );
