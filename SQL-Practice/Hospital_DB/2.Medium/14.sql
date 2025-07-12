-- Show the province_id(s), sum of height; where the total
-- sum of its patient's height is greater than or equal to 7,000.

SELECT
  province_id,
  SUM(height) AS sum_height
FROM patients
group by province_id
HAVING SUM(height) >= 7000;