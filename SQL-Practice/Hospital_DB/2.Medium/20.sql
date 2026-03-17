-- For each doctor, display their id, full name, and the first
-- and last admission date they attended.

SELECT
    D.doctor_id,
    CONCAT(D.first_name, ' ', D.last_name) AS full_name,
    MIN(A.admission_date) AS first_admission_date,
    MAX(A.admission_date) AS last_admission_date
FROM doctors AS D
    INNER JOIN admissions AS A ON D.doctor_id = A.attending_doctor_id
GROUP BY
    D.doctor_id,
    full_name;
