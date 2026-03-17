-- Show the provinces that has more patients identified as 'M' than 'F'.
-- Must only show full province_name

-- Maintainable, Readable Solution
WITH province_patients_count AS (
    SELECT
        province_id,
        SUM(gender = 'M') AS male_count,
        SUM(gender = 'F') AS female_count
    FROM patients
    GROUP BY province_id
),

provinces_with_more_males AS (
    SELECT province_id
    FROM province_patients_count
    WHERE male_count > female_count
)

SELECT province_name
FROM province_names
WHERE province_id IN (
        SELECT province_id
        FROM provinces_with_more_males
    );

-- OR (more intelligent)

SELECT pn.province_name
FROM province_names AS pn
    INNER JOIN patients AS p ON pn.province_id = p.province_id
GROUP BY pn.province_name
HAVING
    SUM(
        CASE
            WHEN p.gender = 'M' THEN 1
            ELSE -1
        END
    ) > 0;

-- the sum here is the difference between males and females
-- if its value is +ve, hence males are more
