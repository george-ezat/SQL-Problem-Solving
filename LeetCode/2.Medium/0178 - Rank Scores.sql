SELECT
    score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS rnk
FROM
    Scores
ORDER BY
    score DESC;
