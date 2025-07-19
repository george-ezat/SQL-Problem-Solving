DECLARE @I INT = 3,     -- Starting value for prime candidate (beginning from 3)
    @J INT = 2,         -- Divisor for checking if @I is prime (starts from 2)
    @N INT = 1000,      -- Upper limit for prime numbers to check (up to 1000)
    @output VARCHAR(1000) = '2',
    @is_prime BIT = 1;

WHILE @I < @N
BEGIN
    SET @is_prime = 1
    SET @J = 2
    WHILE @J < @I
    BEGIN
        IF (@I % @J = 0)
        BEGIN
            SET @is_prime = 0
            BREAK
        END
        SET @J = @J + 1
    END
    IF (@is_prime = 1)
        SET @output = @output + '&' + CAST(@I AS VARCHAR)
    SET @I = @I + 1
END

PRINT(@output);