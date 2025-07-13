-- All patients who have gone through admissions, can see their medical
-- documents on our site. Those patients are given a temporary password
-- after their first admission. Show the patient_id and temp_password.
-- The password must be the following, in order:
--   1. patient_id
--   2. the numerical length of patient's last_name
--   3. year of patient's birth_date

SELECT
  DISTINCT P.patient_id,
  CONCAT(
    P.patient_id,
    LEN(P.last_name),
    YEAR(P.birth_date)
  ) AS temp_password
FROM patients P
  INNER JOIN admissions A ON P.patient_id = A.patient_id;