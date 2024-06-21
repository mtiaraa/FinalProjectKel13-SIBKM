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


-- SP Forgot Password
CREATE PROCEDURE sp_forgot_password
    @username VARCHAR(25),
    @new_password VARCHAR(255),
    @otp INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_accounts WHERE username = @username)
    BEGIN
        RAISERROR('Username not found', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM tbl_accounts WHERE otp = @otp AND is_expired = 0)
    BEGIN
        RAISERROR('Invalid OTP', 16, 1)
        RETURN
    END

    UPDATE tbl_accounts
    SET password = @new_password, is_used = 1
    WHERE username = @username

    UPDATE tbl_accounts
    SET is_expired = 1
    WHERE otp = @otp
END


-- SP Generate Kode OTP
CREATE PROCEDURE sp_generate_otp
    @username VARCHAR(25)
AS
BEGIN
    DECLARE @otp INT
    SET @otp = ABS(CHECKSUM(NEWID())) % 1000000

    UPDATE tbl_accounts
    SET otp = @otp, is_expired = 0
    WHERE username = @username

    SELECT @otp AS otp
END