-- Show all allergies ordered by popularity. Remove NULL values from query.

SELECT
    allergies,
    COUNT(patient_id) AS total_diagnosis
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC;
