-- Show patient_id, first_name, last_name from patients
-- whose does not have any records in the admissions table.
-- (Their patient_id does not exist in any admissions.patient_id rows.)

SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients AS p
WHERE p.patient_id NOT IN (
        SELECT a.patient_id
        FROM admissions AS a
    );
