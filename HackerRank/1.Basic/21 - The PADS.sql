WITH data1 AS(
    SELECT
        CASE
            WHEN Occupation = 'Actor' THEN CONCAT(name, '(A)')
            WHEN Occupation = 'Doctor' THEN CONCAT(name, '(D)')
            WHEN Occupation = 'Singer' THEN CONCAT(name, '(S)')
            WHEN Occupation = 'Professor' THEN CONCAT(name, '(P)')
        END AS name,
        ROW_NUMBER() OVER(ORDER BY Name) AS id
    FROM OCCUPATIONS
)
SELECT name
FROM data1
ORDER BY name;

WITH data2 AS(
    SELECT
        CASE
            WHEN o = 'Doctor' THEN CONCAT('There are a total of ', CAST(c AS CHAR), ' doctors.')
            WHEN o = 'Actor' THEN CONCAT('There are a total of ', CAST(c AS CHAR), ' actors.')
            WHEN o = 'Professor' THEN CONCAT('There are a total of ', CAST(c AS CHAR), ' professors.')
            WHEN o = 'Singer' THEN CONCAT('There are a total of ', CAST(c AS CHAR), ' singers.')
        END AS details,
        ROW_NUMBER() OVER(ORDER BY c) as id
    FROM (
        SELECT Occupation AS o, COUNT(Occupation) AS c
        FROM OCCUPATIONS
        GROUP BY Occupation
    ) AS T
)
SELECT details
FROM data2
ORDER BY id;