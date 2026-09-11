-- Easy Solution Using CTE, HAVING, SUM(CASE ...)

WITH book_stats AS (
    SELECT
        book_id,
        MAX(session_rating) - MIN(session_rating) AS rating_spread,
        ROUND(
            1.0 * COUNT(CASE WHEN session_rating != 3 THEN 1 END) / COUNT(*), 2
        ) AS polarization_score
    FROM
        reading_sessions
    GROUP BY
        book_id
    HAVING
        COUNT(*) >= 5
        AND MIN(session_rating) <= 2  -- This ensures that at least one session have low_rating
        AND MAX(session_rating) >= 4  -- This ensures that at least one session have high_rating
)
SELECT
    b.*,
    bs.rating_spread,
    bs.polarization_score
FROM
    book_stats AS bs
    INNER JOIN books AS b ON bs.book_id = b.book_id
WHERE
    bs.polarization_score >= 0.6
ORDER BY
    bs.polarization_score DESC,
    b.title DESC;
