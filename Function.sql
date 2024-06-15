-- Membuat FUNCTION func_salary
CREATE FUNCTION func_salary (@salary INT)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    DECLARE @min_salary INT = 4000000; -- Rp 4 juta
    DECLARE @max_salary INT = 54000000; -- Rp 54 juta

    IF @salary >= @min_salary AND @salary <= @max_salary
    BEGIN
        SET @result = 1; -- True
    END
    ELSE
    BEGIN
        SET @result = 2; -- False
    END

    RETURN @result;
END;
GO
