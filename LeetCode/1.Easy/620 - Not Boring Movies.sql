SELECT *
FROM
    Cinema
WHERE
    id % 2 <> 0
    AND description <> 'boring'
ORDER BY
    rating DESC;