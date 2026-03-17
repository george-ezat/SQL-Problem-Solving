-- Display the total amount of patients for each province. Order by descending.

SELECT
    PN.province_name,
    COUNT(P.patient_id) AS patient_count
FROM patients AS P
    INNER JOIN province_names AS PN ON P.province_id = PN.province_id
GROUP BY PN.province_name
ORDER BY patient_count DESC;
