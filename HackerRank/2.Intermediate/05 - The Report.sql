SELECT
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
    END AS Name,
    G.Grade,
    S.Marks
FROM
    Students AS S
    INNER JOIN Grades AS G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY
    G.Grade DESC,
    CASE
        WHEN G.Grade >= 8 THEN S.Name
    END ASC,
    CASE
        WHEN G.Grade < 8 THEN S.Marks
    END ASC;


-- Note: You can not combine these two CASE statements into one statement
--       because the CASE statement can only have one data type returned
--       (S.Name is VARCHAR but S.Marks is INT)