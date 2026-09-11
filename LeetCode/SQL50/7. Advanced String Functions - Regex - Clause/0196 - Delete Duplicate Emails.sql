WITH duplicate_emails AS (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) AS rnk
    FROM Person
)

DELETE FROM Person
WHERE id IN (
        SELECT id FROM duplicate_emails
        WHERE rnk > 1
    );


-- OR

DELETE FROM person
WHERE id NOT IN (
        SELECT MIN(id)
        FROM person
        GROUP BY email
    );
