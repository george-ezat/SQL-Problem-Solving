-- Show all columns for patient_id 542's most recent admission_date.

SELECT *
FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC;
LIMIT 1;

-- OR (for SQL-Server)

SELECT TOP 1 *
FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC;