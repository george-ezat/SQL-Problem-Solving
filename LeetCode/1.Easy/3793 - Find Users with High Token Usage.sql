WITH cte AS (
    SELECT
        user_id,
        COUNT(1) AS prompt_count,
        MAX(tokens) AS max_tokens,
        ROUND(AVG(tokens * 1.0), 2) AS avg_tokens
    FROM prompts
    GROUP BY user_id
    HAVING COUNT(1) > 2
)

SELECT
    user_id,
    prompt_count,
    avg_tokens
FROM cte
WHERE max_tokens > avg_tokens
ORDER BY
    avg_tokens DESC,
    user_id ASC;
