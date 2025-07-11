-- Show all columns for patients who have one of the
-- following patient_ids: 1,45,534,879,1000

SELECT *
FROM patients
WHERE patient_id IN(1, 45, 534, 879, 1000);