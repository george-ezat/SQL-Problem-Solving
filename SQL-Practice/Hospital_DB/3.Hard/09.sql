-- For each day display the total amount of admissions on that day.
-- Display the amount changed from the previous date.

WITH admission_days AS(
    SELECT
      admission_date,
      COUNT(patient_id) AS admission_day
    FROM admissions
    GROUP BY admission_date
  )
SELECT
  admission_date,
  admission_day,
  admission_day - LAG(admission_day) OVER(
    ORDER BY
      admission_date
  ) AS admission_count_change
FROM admission_days;