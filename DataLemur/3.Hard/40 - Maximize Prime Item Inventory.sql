WITH summary AS(
    SELECT
        SUM(square_footage) FILTER(WHERE item_type = 'prime_eligible') AS prime_sq_ft,
        COUNT(item_id) FILTER(WHERE item_type = 'prime_eligible') AS prime_cnt,
        SUM(square_footage) FILTER(WHERE item_type = 'not_prime') AS not_prime_sq_ft,
        COUNT(item_id) FILTER(WHERE item_type = 'not_prime') AS not_prime_cnt
    FROM
        inventory
),
max_area AS(
    SELECT
        FLOOR(500000 / prime_sq_ft) * prime_sq_ft AS prime_area
    FROM
        summary
)
SELECT
    'prime_eligible' AS item_type,
    FLOOR(500000 / prime_sq_ft) * prime_cnt AS item_count
FROM
    summary
UNION ALL
SELECT
    'not_prime' AS item_type,
    FLOOR((SELECT 500000 - prime_area FROM max_area) / not_prime_sq_ft) * not_prime_cnt AS item_count
FROM
    summary;