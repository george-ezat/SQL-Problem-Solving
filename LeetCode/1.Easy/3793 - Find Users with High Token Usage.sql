WITH cte AS (
    SELECT
        user_id,
        COUNT(1) AS prompt_count,
        MAX(tokens) AS max_tokens,
        ROUND(AVG(tokens * 1.0), 2) AS avg_tokens
    FROM
        prompts
    GROUP BY
        user_id
    HAVING
        COUNT(1) >= 3
)

SELECT
    user_id,
    prompt_count,
    avg_tokens
FROM
    cte
WHERE
    max_tokens > avg_tokens
ORDER BY
    avg_tokens DESC,
    user_id ASC;


-- OR


WITH user_prompts AS (
    SELECT
        user_id,
        COUNT(prompt) AS prompt_count,
        ROUND(AVG(tokens), 2) AS avg_tokens
    FROM
        prompts
    GROUP BY
        user_id
    HAVING
        COUNT(prompt) >= 3
)

SELECT
    user_id,
    prompt_count,
    avg_tokens
FROM
    user_prompts AS up
WHERE
    EXISTS (
        SELECT
            1
        FROM
            prompts AS p
        WHERE
            up.user_id = p.user_id
            AND up.avg_tokens > p.tokens
    )
ORDER BY
    avg_tokens DESC,
    user_id ASC;
