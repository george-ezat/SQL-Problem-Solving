-- Show the first_name, last_name, and height of the patient with the greatest height.

select
  first_name,
  last_name,
  height
FROM patients
WHERE height = (
    SELECT MAX(height)
    FROM patients
  );

-- OR


-- This solution is better when there are many have the same max height
WITH CTE AS(
    SELECT
      first_name,
      last_name,
      height,
      ROW_NUMBER() OVER(
        ORDER BY height desc
      ) AS RANK
    FROM patients
  )
SELECT
  first_name,
  last_name,
  height
FROM CTE
WHERE RANK = 1;