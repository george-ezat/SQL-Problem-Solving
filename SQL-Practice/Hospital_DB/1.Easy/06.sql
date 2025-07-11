-- Show first name and last name concatenated into one column to show their full name.

SELECT first_name || ' ' || last_name AS full_name
FROM patients;

-- OR

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;