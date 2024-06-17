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


-- Code By : Cahyani Putri Riyanto--

-- --Membuat Functin func_gender
CREATE FUNCTION dbo.ValidateGender (@gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;

    -- Periksa apakah gender valid ('M' atau 'F')
    IF @gender IN ('Male', 'Female')
    BEGIN
        SET @IsValid = 1; -- True (valid)
    END
    ELSE
    BEGIN
        SET @IsValid = 0; -- False (invalid)
    END

    RETURN @IsValid;
END;
GO



-- Membuat FUNCTION func_password_policy
CREATE FUNCTION dbo.CheckPasswordPolicy
(
    @password VARCHAR(255)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT = 1; -- Default: password valid

    -- Panjang minimal password (minimal 8 karakter)
    IF LEN(@password) < 8
        SET @isValid = 0;

    -- Memeriksa apakah password mengandung huruf besar (uppercase)
    IF @isValid = 1 AND @password = LOWER(@password)
        SET @isValid = 0;

    -- Memeriksa apakah password mengandung huruf kecil (lowercase)
    IF @isValid = 1 AND @password = UPPER(@password)
        SET @isValid = 0;

    -- Memeriksa apakah password mengandung angka
    IF @isValid = 1 AND @password NOT LIKE '%[0-9]%'
        SET @isValid = 0;

    -- Memeriksa apakah password mengandung karakter khusus (simbol)
    IF @isValid = 1 AND @password NOT LIKE '%[!@#$%^&*()-=_+{};:"|,.<>?]%'
        SET @isValid = 0;

    RETURN @isValid;
END;



DECLARE @password NVARCHAR(100) = 'Passw0rd!';

IF dbo.CheckPasswordPolicy(@password) = 1
    PRINT 'Password memenuhi kebijakan.';
ELSE
    PRINT 'Password tidak memenuhi kebijakan.';

