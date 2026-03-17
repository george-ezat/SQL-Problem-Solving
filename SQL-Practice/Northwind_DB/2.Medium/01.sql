-- Show the ProductName, CompanyName, CategoryName
-- from the products, suppliers, and categories table

SELECT
    p.product_name,
    s.company_name,
    c.category_name
FROM products AS p
    INNER JOIN suppliers AS s ON p.supplier_id = s.supplier_id
    INNER JOIN categories AS c ON p.category_id = c.category_id;
