SELECT
    CASE
        WHEN A + B > C AND A = B AND A = C THEN 'Equilateral'
        WHEN A + B > C AND A = B AND A <> C THEN 'Isosceles'
        WHEN A + B > C AND C = B AND A <> C THEN 'Isosceles'
        WHEN A + B > C AND A = C AND A <> B THEN 'Isosceles'
        WHEN A + B > C AND A <> B AND A <> C THEN 'Scalene'    
        ELSE 'Not A Triangle'
    END AS Triangle
FROM TRIANGLES;