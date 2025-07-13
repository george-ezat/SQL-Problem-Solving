-- Sort the province names in ascending order in such a way
-- that the province 'Ontario' is always on top.

SELECT province_name
FROM province_names
ORDER BY
  CASE
    WHEN province_name = 'Ontario' THEN 1
    ELSE 2
  END,
  province_name ASC;