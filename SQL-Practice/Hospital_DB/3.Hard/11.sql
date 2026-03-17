-- We need a breakdown for the total amount of admissions each doctor has started each year.
-- Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.

WITH cte AS (
    SELECT
        attending_doctor_id AS doctor_id,
        YEAR(admission_date) AS selected_year,
        COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY
        attending_doctor_id,
        YEAR(admission_date)
)

SELECT
    cte.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialty,
    cte.selected_year,
    cte.total_admissions
FROM cte
    INNER JOIN doctors AS d ON cte.doctor_id = d.doctor_id
ORDER BY
    cte.doctor_id ASC,
    cte.selected_year ASC;
