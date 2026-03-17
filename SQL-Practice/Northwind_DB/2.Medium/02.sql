-- Show the category_name and the average product unit price
-- for each category rounded to 2 decimal places.

SELECT
    c.category_name,
    ROUND(AVG(p.unit_price), 2) AS average_unit_price
FROM products AS p
    INNER JOIN categories AS c ON p.category_id = c.category_id
GROUP BY c.category_name;
