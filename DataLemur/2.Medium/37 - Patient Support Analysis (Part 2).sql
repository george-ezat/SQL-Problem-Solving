SELECT
    ROUND(
        100.0 * SUM(1) FILTER (WHERE call_category = 'n/a' or call_category IS NULL)
        / COUNT(*)
    , 1) AS uncategorised_call_pct
FROM callers;