-- Show the average unit price rounded to 2 decimal places,
-- the total units in stock, total discontinued products from the products table.

SELECT
  ROUND(AVG(unit_price), 2) AS average_price,
  SUM(units_in_stock) AS total_stock,
  SUM(discontinued) AS total_discontinued
FROM products;