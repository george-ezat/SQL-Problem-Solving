-- Show the category_name and the average product unit price
-- for each category rounded to 2 decimal places.

SELECT
  C.category_name,
  ROUND(AVG(P.unit_price), 2) AS average_unit_price
FROM products P
  INNER JOIN categories C ON P.category_id = C.category_id
GROUP BY C.category_name;