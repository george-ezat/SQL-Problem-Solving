-- When we reach the last student and find its id is odd
-- but there is no one next! so we will not swap.
-- And that's why we set the default for LEAD is student itself

-- Note: the default value will be used when the LEAD return NULL

SELECT
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
        ELSE LEAD(student, 1, student) OVER(ORDER BY id)
    END AS student
FROM
    Seat
ORDER BY
    id;