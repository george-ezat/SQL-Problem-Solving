WITH start_dates AS (
    SELECT
        Start_Date,
        ROW_NUMBER() OVER (
            ORDER BY
                Start_Date
        ) AS rank
    FROM
        Projects
    WHERE
        Start_Date NOT IN (
            SELECT
                End_Date
            FROM
                Projects
        )
), end_dates AS (
    SELECT
        End_Date,
        ROW_NUMBER() OVER (
            ORDER BY
                End_Date
        ) AS rank
    FROM
        Projects
    WHERE
        End_Date NOT IN (
            SELECT
                Start_Date
            FROM
                Projects
        )
)
SELECT
    Start_Date,
    End_Date
FROM
    start_dates AS sd
    JOIN end_dates AS ed ON sd.rank = ed.rank
ORDER BY
    DATEDIFF(DAY, Start_Date, End_Date),
    Start_Date;