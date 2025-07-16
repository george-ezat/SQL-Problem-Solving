-- Show all the contact_name, address, city of all customers
-- which are not from 'Germany', 'Mexico', 'Spain'

SELECT
  contact_name,
  address,
  city
FROM customers
WHERE
  country NOT IN ('Germany', 'Mexico', 'Spain');