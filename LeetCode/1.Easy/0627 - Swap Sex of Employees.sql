UPDATE Salary
SET
    sex
    = CASE sex
        WHEN 'f' THEN 'm'
        ELSE 'f'
    END;
