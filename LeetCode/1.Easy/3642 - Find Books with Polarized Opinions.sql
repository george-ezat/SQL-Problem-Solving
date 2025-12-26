-- Easy Solution Using CTE, HAVING, SUM(CASE ...)

WITH book_stats AS (
    SELECT
        book_id,
        MAX(session_rating) - MIN(session_rating) AS rating_spread,
        ROUND(
            SUM(CASE WHEN session_rating <= 2 OR session_rating >= 4 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)
            , 2
        ) AS polarization_score
    FROM reading_sessions
    GROUP BY book_id
    HAVING COUNT(*) >= 5
        AND MIN(session_rating) <= 2  -- This ensures that at least one session have low_rating
        AND MAX(session_rating) >= 4  -- This ensures that at least one session have high_rating
)
SELECT
    b.*,
    s.rating_spread,
    s.polarization_score
FROM
    book_stats s
    JOIN books b ON s.book_id = b.book_id
WHERE s.polarization_score >= 0.6
ORDER BY
    s.polarization_score DESC,
    b.title DESC;