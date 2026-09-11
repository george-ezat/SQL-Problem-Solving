WITH positive_patients AS (
    SELECT
        patient_id,
        MIN(test_date) AS first_pos
    FROM
        covid_tests
    WHERE
        result = 'Positive'
    GROUP BY
        patient_id
),
recovered_patients AS (
    SELECT
        pp.patient_id,
        MIN(ct.test_date) - pp.first_pos AS recovery_time
    FROM
        positive_patients AS pp
        INNER JOIN covid_tests AS ct ON pp.patient_id = ct.patient_id
            AND ct.result = 'Negative'
            AND pp.first_pos < ct.test_date
    GROUP BY
        pp.patient_id,
        pp.first_pos
)
SELECT
    rp.patient_id,
    p.patient_name,
    p.age,
    rp.recovery_time
FROM
    recovered_patients AS rp
    INNER JOIN patients AS p ON rp.patient_id = p.patient_id
ORDER BY
    rp.recovery_time ASC,
    p.patient_name ASC;
