--Membuat SP login
CREATE PROCEDURE sp_Login
    @username VARCHAR(25),
    @password VARCHAR(255)
AS
BEGIN
    DECLARE @StoredPassword VARCHAR(255);
    DECLARE @IsValid BIT = 0;

    -- Validasi password policy
    IF dbo.CheckPasswordPolicy(@password) = 0
    BEGIN
        PRINT 'Password does not meet the policy requirements!';
        RETURN;
    END

    -- Mencari password yang disimpan berdasarkan Username
    SELECT @StoredPassword = password
    FROM tbl_accounts
    WHERE username = @username;

    -- Jika password ditemukan, cek password
    IF @StoredPassword IS NOT NULL
    BEGIN
        -- Validasi password dengan membandingkan langsung
        IF @password = @StoredPassword
        BEGIN
            SET @IsValid = 1;
        END
    END

    -- Print hasil validasi
    IF @IsValid = 1
    BEGIN
        PRINT 'Login success!';
    END
    ELSE
    BEGIN
        PRINT 'Account not registered!';
    END
END;
