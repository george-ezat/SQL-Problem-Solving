WITH CTE AS(
    SELECT
            H.hacker_id AS id,
            H.name AS name,
            S.challenge_id,
            MAX(S.score) AS score
        FROM
            Hackers AS H
            INNER JOIN Submissions AS S ON H.hacker_id = S.hacker_id
        GROUP BY
            H.hacker_id,
            H.name,
            S.challenge_id
)
SELECT
    id,
    name,
    SUM(score) AS total_score
FROM
    CTE
GROUP BY
    id,
    name
HAVING
    SUM(score) > 0
ORDER BY
    total_score DESC,
    id;