-- Show the percent of patients that have 'M' as their gender.
-- Round the answer to the nearest hundredth number and in percent form.

SELECT
  CONCAT(
    ROUND(
      CAST(SUM(gender = 'M') AS FLOAT)
      	/ COUNT(*) * 100
      ,2)
    ,'%') AS male_percentage
FROM patients;


-- OR

SELECT CONCAT(ROUND(100 * AVG(gender = 'M'), 2), '%') AS male_percentage
FROM patients;