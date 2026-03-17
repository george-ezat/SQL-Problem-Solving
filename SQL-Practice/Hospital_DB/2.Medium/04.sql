-- Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'.
-- Primary diagnosis is stored in the admissions table.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients AS p
    INNER JOIN admissions AS a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

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
