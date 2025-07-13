-- Show the provinces that has more patients identified as 'M' than 'F'.
-- Must only show full province_name

-- Maintainable, Readable Solution
WITH province_patients_count AS (
    SELECT
      province_id,
      SUM(gender = 'M') AS male_count,
      SUM(gender = 'F') AS female_count
    FROM patients P
    GROUP BY
      province_id
  ),
  provinces_with_more_males AS (
    SELECT province_id
    FROM province_patients_count
    WHERE male_count > female_count
  )
SELECT province_name
FROM province_names
WHERE province_id IN (
    SELECT *
    FROM provinces_with_more_males
  );

-- OR (more intelligent)

SELECT PN.province_name
FROM province_names PN
  INNER JOIN patients P ON PN.province_id = P.province_id
GROUP BY PN.province_name
HAVING
  SUM(
    CASE
      WHEN P.gender = 'M' THEN 1
      ELSE -1
    END
  ) > 0;

-- the sum here is the difference between males and females
-- if its value is +ve, hence males are more