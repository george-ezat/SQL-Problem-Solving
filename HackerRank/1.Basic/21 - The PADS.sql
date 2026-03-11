SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM Occupations
ORDER BY Name;

SELECT
    CONCAT(
        'There are a total of ', COUNT(Name), ' ', LOWER(Occupation), 's.'
    )
FROM Occupations
GROUP BY
    Occupation
ORDER BY
    COUNT(Name),
    Occupation;


-- Other Solution using CASE WHEN

SELECT
    CASE
        WHEN Occupation = 'Actor' THEN CONCAT(Name, '(A)')
        WHEN Occupation = 'Doctor' THEN CONCAT(Name, '(D)')
        WHEN Occupation = 'Singer' THEN CONCAT(Name, '(S)')
        WHEN Occupation = 'Professor' THEN CONCAT(Name, '(P)')
    END
FROM Occupations
ORDER BY Name;

WITH Cte AS (
    SELECT
        Occupation,
        COUNT(Name) AS Cnt
    FROM Occupations
    GROUP BY Occupation
)

SELECT
    CASE
        WHEN
            Occupation = 'Doctor'
            THEN CONCAT('There are a total of ', CAST(Cnt AS CHAR), ' doctors.')
        WHEN
            Occupation = 'Actor'
            THEN CONCAT('There are a total of ', CAST(Cnt AS CHAR), ' actors.')
        WHEN
            Occupation = 'Professor'
            THEN
                CONCAT(
                    'There are a total of ', CAST(Cnt AS CHAR), ' professors.'
                )
        WHEN
            Occupation = 'Singer'
            THEN CONCAT('There are a total of ', CAST(Cnt AS CHAR), ' singers.')
    END
FROM Cte
ORDER BY
    Cnt,
    Occupation;
