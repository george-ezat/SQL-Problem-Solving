SELECT
    TOP 1 CITY,
    LEN (CITY) AS NAME_LENGTH
FROM STATION
ORDER BY
    NAME_LENGTH DESC,
    CITY;


SELECT
    TOP 1 CITY,
    LEN (CITY) AS NAME_LENGTH
FROM STATION
ORDER BY
    NAME_LENGTH,
    CITY;


-- Note: The solution consists of the two queries