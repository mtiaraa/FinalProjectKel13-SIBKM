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


-- Membuat Function format email
CREATE FUNCTION func_email_format
(
    @email VARCHAR(25)
)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT

    -- Memeriksa apakah format email valid
    IF @email LIKE '%_@__%.__%'
        AND @email NOT LIKE '%[^a-zA-Z0-9._@%-]%'
        AND @email LIKE '[A-Za-z0-9]%@[A-Za-z0-9]%.[A-Za-z]%[A-Za-z]%'
    BEGIN
        SET @Result = 1 --  Jika format memenuhi kondisi True
    END
    ELSE
    BEGIN
        SET @Result = 2 -- Jika format tidak memenuhi kondisi False
    END

    RETURN @Result
END;
GO



-- Code By : CAHYANI PUTRI RIYANTO--

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



-- Query by Rifki Fauzifazr
-- Function nomor telepon
CREATE FUNCTION func_phone_number (@phone VARCHAR(20))
RETURNS VARCHAR(1)
AS
BEGIN
    DECLARE @isValid VARCHAR(1) = '2'; -- Default value is False

    IF @phone NOT LIKE '%[^0-9]%' AND LEN(@phone) >= 10 AND LEN(@phone) <= 20
        SET @isValid = '1'; -- True

    RETURN @isValid;
END;

-- cek apakah functions sudah bisa dijalankan
SELECT dbo.func_phone_number('1234567890') AS IsValid; -- Output: 1 (True)
SELECT dbo.func_phone_number('12345678') AS IsValid; -- Output: 2 (False)
SELECT dbo.func_phone_number('12345678901234567890') AS IsValid; -- Output: 2 (False)
SELECT dbo.func_phone_number('12345678a') AS IsValid; -- Output: 2 (False)

-- Function password match
CREATE FUNCTION func_password_match (@newPassword VARCHAR(255), @confirmPassword VARCHAR(255))
RETURNS VARCHAR(1)
AS
BEGIN
    DECLARE @isMatch VARCHAR(1) = '2'; -- Default value is False

    IF @newPassword = @confirmPassword
        SET @isMatch = '1'; -- True

    RETURN @isMatch;
END;

-- cek apakah functions sudah bisa dijalankan
SELECT dbo.func_password_match('password', 'password') AS IsMatch; -- Output: 1 (True)
SELECT dbo.func_password_match('password', 'pass123') AS IsMatch; -- Output: 2 (False)