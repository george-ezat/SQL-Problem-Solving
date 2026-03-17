-- Show first name, last name, and the full province name of each patient.
-- Example: 'Ontario' instead of 'ON'

SELECT
    p.first_name,
    p.last_name,
    pn.province_name
FROM patients AS p
    INNER JOIN province_names AS pn ON p.province_id = pn.province_id;
