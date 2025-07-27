WITH student_scores AS (
    SELECT DISTINCT
        student_id,
        subject,
        FIRST_VALUE (score) OVER (
            PARTITION BY
                student_id,
                subject
            ORDER BY
                exam_date
        ) AS first_score,
        LAST_VALUE (score) OVER (
            PARTITION BY
                student_id,
                subject
            ORDER BY
                exam_date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
        ) AS latest_score
    FROM
        Scores
)
SELECT
    *
FROM
    student_scores
WHERE
    latest_score > first_score
ORDER BY
    student_id,
    subject;

-- The default frame for LAST_VALUE is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW,
-- which means it will often just return the value of the current row. To get the true
-- last value of the entire partition, you must specify the frame as I did.