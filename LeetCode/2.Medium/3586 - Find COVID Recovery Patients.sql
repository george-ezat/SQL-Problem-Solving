WITH FirstPositive AS (
    SELECT
        patient_id,
        MIN(test_date) AS first_pos_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    MIN(t.test_date) - fp.first_pos_date AS recovery_time
    -- Replacement for SQL Server:
    -- DATEDIFF(DAY, fp.first_pos_date, MIN(t.test_date)) AS recovery_time
FROM FirstPositive fp
    JOIN covid_tests t ON fp.patient_id = t.patient_id 
        AND t.result = 'Negative'
        AND t.test_date > fp.first_pos_date
    JOIN patients p ON fp.patient_id = p.patient_id
GROUP BY
    p.patient_id,
    p.patient_name,
    p.age,
    fp.first_pos_date
ORDER BY
    recovery_time,
    p.patient_name;