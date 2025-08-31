WITH stock_d AS (
    SELECT
        ticker,
        MAX(OPEN) AS highest_open,
        MIN(OPEN) AS lowest_open
    FROM
        stock_prices
    GROUP BY
        ticker
)
SELECT
    sd.ticker,
    TO_CHAR (sp1.date, 'Mon-YYYY') AS highest_mth,
    sd.highest_open,
    TO_CHAR (sp2.date, 'Mon-YYYY') AS lowest_mth,
    sd.lowest_open
FROM
    stock_d AS sd
    JOIN stock_prices AS sp1 ON sd.ticker = sp1.ticker
    AND sp1.open = sd.highest_open
    JOIN stock_prices AS sp2 ON sd.ticker = sp2.ticker
    AND sp2.open = sd.lowest_open
ORDER BY
    sd.ticker;