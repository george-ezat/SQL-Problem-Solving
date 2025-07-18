WITH data1 AS(
    SELECT
        h.hacker_id,
        h.name,
        COUNT(DISTINCT challenge_id) AS total_challenges
    FROM
        Hackers h
        INNER JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY
        h.hacker_id,
        h.name
), data2 AS(
    SELECT
        total_challenges,
        count(total_challenges) AS cnt
    FROM data1
    GROUP BY total_challenges
)
SELECT *
FROM data1
WHERE total_challenges NOT IN (
    SELECT total_challenges
    FROM data2
    WHERE
        cnt > 1
        AND total_challenges <> (SELECT max(total_challenges) FROM data1)
)
ORDER BY
    total_challenges DESC,
    hacker_id;