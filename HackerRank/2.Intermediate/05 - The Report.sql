SELECT
    CASE
        WHEN g.grade > 7 THEN s.name
    END AS std_name,
    g.grade,
    s.marks
FROM
    students AS s
    INNER JOIN grades AS g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY
    g.grade DESC,
    CASE
        WHEN g.grade > 7 THEN s.name
    END,
    CASE
        WHEN g.grade < 8 THEN s.marks
    END;


-- Note: You can not combine these two CASE statements into one statement
--       because the CASE statement can only return one data type
--       (S.Name is VARCHAR but S.Marks is INT)
