--QUERY BY RIFKI FAUZIFAZR

--SP Untuk menambahkan data pada tbl_locations
CREATE PROCEDURE AddLocation
    @id INT,
    @street_address VARCHAR(40),
    @postal_code VARCHAR(12),
    @city VARCHAR(30),
    @state_province VARCHAR(25),
    @country CHAR(3)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_countries WHERE id = @country)
    BEGIN
        RAISERROR('Invalid country', 16, 1)
        RETURN
    END

    INSERT INTO tbl_locations (id, street_address, postal_code, city, state_province, country)
    VALUES (@id, @street_address, @postal_code, @city, @state_province, @country)
END

--SP Untuk mengupdate data pada tbl_locations
CREATE PROCEDURE UpdateLocation
    @id INT,
    @street_address VARCHAR(40),
    @postal_code VARCHAR(12),
    @city VARCHAR(30),
    @state_province VARCHAR(25),
    @country CHAR(3)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_locations WHERE id = @id)
    BEGIN
        RAISERROR('Location not found', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM tbl_countries WHERE id = @country)
    BEGIN
        RAISERROR('Invalid country', 16, 1)
        RETURN
    END

    UPDATE tbl_locations
    SET street_address = @street_address,
        postal_code = @postal_code,
        city = @city,
        state_province = @state_province,
        country = @country
    WHERE id = @id
END

--SP Untuk menghaous data pada tbl_locations

CREATE PROCEDURE sp_delete_location
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_locations WHERE id = @id)
    BEGIN
        RAISERROR('Location not found', 16, 1)
        RETURN
    END

    DELETE FROM tbl_locations
    WHERE id = @id
END

