UPDATE Salary
SET sex =
    CASE sex
        WHEN 'f' THEN 'm'
        WHEN 'm' THEN 'f'
    END;