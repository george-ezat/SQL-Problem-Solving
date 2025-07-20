-- According to Triangle Inequality Theorem:
-- any two sides of a triangle must be greater than the length of the third side.

SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND x + z > y  AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;