SELECT
    contest_id,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM users),
        2
    ) AS percentage
FROM
    register
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;
