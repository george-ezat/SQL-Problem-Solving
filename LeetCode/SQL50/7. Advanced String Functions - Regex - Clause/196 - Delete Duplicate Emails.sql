WITH duplicate_emails AS(
    SELECT
        id,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS e_rank
    FROM
        Person
)
DELETE FROM Person
WHERE id in (SELECT id FROM duplicate_emails WHERE e_rank > 1);