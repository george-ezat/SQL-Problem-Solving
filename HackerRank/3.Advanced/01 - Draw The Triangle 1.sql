DECLARE @COLUMNS INT = 20;
DECLARE @TEMP INT = 0;
DECLARE @LINE VARCHAR(50) = '';

WHILE @COLUMNS > 0
    BEGIN
        SET @TEMP = @COLUMNS;
        WHILE @TEMP > 0
        BEGIN
            SET @LINE = @LINE + '* '
            SET @TEMP = @TEMP - 1
        END
        PRINT(@LINE)
        SET @COLUMNS = @COLUMNS - 1
        SET @LINE = ''
    END