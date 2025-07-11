-- Show how many patients have a birth_date with 2010 as the birth year.

SELECT COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

-- OR

SELECT COUNT(*) AS total_patients
FROM patients
WHERE birth_date between '2010-01-01' AND '2010-12-31';

-- OR

SELECT COUNT(*) AS total_patients
FROM patients
WHERE birth_date LIKE '2010%';