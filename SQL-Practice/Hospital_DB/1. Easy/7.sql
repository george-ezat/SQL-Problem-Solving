-- Show first name, last name, and the full province name of each patient.
-- Example: 'Ontario' instead of 'ON'

select
  first_name,
  last_name,
  province_name
FROM patients P
  INNER JOIN province_names PN ON P.province_id = PN.province_id;