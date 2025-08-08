-- Easiest Solution with Self Join

SELECT
    COUNT(DISTINCT j1.company_id) duplicate_companies
FROM
    job_listings AS j1
    JOIN job_listings AS j2 ON j1.company_id = j2.company_id
    AND j1.title = j2.title
    AND j1.job_id <> j2.job_id;


-- Another Solution Using CTE

WITH duplicates AS(
    SELECT
        company_id,
        title,
        COUNT(*) AS cnt
    FROM
        job_listings
    GROUP BY
        company_id,
        title
    HAVING
        COUNT(*) > 1
)
SELECT
    COUNT(DISTINCT company_id) as duplicate_companies
FROM
    duplicates;