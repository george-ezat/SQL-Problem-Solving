WITH categories AS (
    SELECT
        SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS low,
        SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS average,
        SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS high
    FROM
        accounts
)
SELECT
    'Low Salary' AS category,
    low AS accounts_count
FROM categories
UNION ALL
SELECT
    'Average Salary' AS category,
    average AS accounts_count
FROM categories
UNION ALL
SELECT
    'High Salary' AS category,
    high AS accounts_count
FROM categories;
