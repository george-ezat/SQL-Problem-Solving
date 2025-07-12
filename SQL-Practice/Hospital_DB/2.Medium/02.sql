-- Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column
-- then don't include their name in the output list.
-- If only 1 person is named 'Leo' then include them in the output.


-- Preferred solution
WITH CTE AS(
    SELECT
      first_name,
      COUNT(first_name) AS cnt
    FROM patients
    GROUP BY first_name
    HAVING COUNT(first_name) = 1
)
SELECT first_name
FROM CTE;

-- OR

SELECT first_name
FROM (
    SELECT
      first_name,
      COUNT(first_name) AS cnt
    FROM patients
    GROUP BY first_name
    HAVING COUNT(first_name) = 1
);