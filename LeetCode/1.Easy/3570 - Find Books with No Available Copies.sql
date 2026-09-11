WITH borrowed AS (
    SELECT
        book_id,
        COUNT(*) AS cnt
    FROM
        borrowing_records
    WHERE
        return_date IS NULL
    GROUP BY
        book_id
)

SELECT
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    lb.total_copies AS current_borrowers
FROM
    library_books AS lb
    INNER JOIN borrowed AS b ON lb.book_id = b.book_id
        AND lb.total_copies = b.cnt
ORDER BY
    current_borrowers DESC,
    lb.title ASC;
