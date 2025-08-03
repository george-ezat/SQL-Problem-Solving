SELECT
    page_id
FROM
    pages
WHERE
    page_id NOT IN (
        SELECT
            page_id
        FROM
            page_likes
    )
ORDER BY
    page_id;


-- Another Solution

SELECT
    page_id
FROM
    pages
EXCEPT
SELECT
    page_id
FROM
    page_likes
ORDER BY
    page_id;


-- Another Solution

SELECT
    p.page_id
FROM
    pages AS p
    LEFT JOIN page_likes AS pl ON p.page_id = pl.page_id
WHERE
    pl.page_id IS NULL
ORDER BY
    p.page_id;