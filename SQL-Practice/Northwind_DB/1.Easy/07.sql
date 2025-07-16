-- Show the company_name, contact_name, fax number of all
-- customers that has a fax number. (not null)

SELECT
  company_name,
  contact_name,
  fax
FROM customers
WHERE fax IS NOT NULL;