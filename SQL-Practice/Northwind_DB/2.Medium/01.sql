-- Show the ProductName, CompanyName, CategoryName
-- from the products, suppliers, and categories table

SELECT
  P.product_name,
  S.company_name,
  C.category_name
FROM products P
  INNER JOIN suppliers S ON P.supplier_id = S.supplier_id
  INNER JOIN categories C ON P.category_id = C.category_id;