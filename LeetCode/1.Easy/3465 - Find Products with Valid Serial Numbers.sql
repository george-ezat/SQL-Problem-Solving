-- PostgreSQL

SELECT
    product_id,
    product_name,
    description
FROM
    products
WHERE
    description ~ '\mSN[0-9]{4}-[0-9]{4}\M'
ORDER BY
    product_id;

-- Note:
--  the word boundary in PostgreSQL is \m for the start, \M for the end.
--  and this is not the standard for RegEx(it will not work anywhere except PostgreSQL)

-- In MySQL: WHERE REGEXP_LIKE(description, '\\bSN[0-9]{4}-[0-9]{4}\\b', 'c')
--           'c' >> means case-sensitive
--           \b >> word boundary standard