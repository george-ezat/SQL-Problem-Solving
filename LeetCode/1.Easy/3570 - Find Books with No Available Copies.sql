WITH borrowed AS(
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
    LB.book_id,
    LB.title,
    LB.author,
    LB.genre,
    LB.publication_year,
    LB.total_copies AS current_borrowers
FROM
    library_books AS LB
    JOIN borrowed AS B ON LB.book_id = B.book_id
    AND LB.total_copies = B.cnt
ORDER BY
    current_borrowers DESC,
    LB.title;

-- You can use subquery with IN instead, but this is more readable.