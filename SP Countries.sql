--Membuat SP untuk menambahkan countries
CREATE PROCEDURE Addcountries
    @id CHAR(3),
    @name VARCHAR(40),
    @region INT
AS
BEGIN
    BEGIN TRY
        -- Memeriksa apakah region yang diberikan ada di tabel tbl_regions
        IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @region)
        BEGIN
            RAISERROR('Region ID does not exist', 16, 1);
            RETURN;
        END

        -- Menambahkan data baru ke tabel tbl_countries
        INSERT INTO tbl_countries (id, name, region) 
        VALUES (@id, @name, @region);
    END TRY
    BEGIN CATCH
        -- Menangani error
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;

--Menjalankan SP Addcountries
EXEC Addcountries @id = 'IDN', @name = 'Indonesia', @region = 2; 


--Membuat SP untuk mengedit countries
CREATE PROCEDURE EditCountries
    @id CHAR(3),
    @name VARCHAR(40),
    @region INT
AS
BEGIN
    -- Update data di tabel tbl_countries
    UPDATE tbl_countries
    SET name = @name,
        region = @region
    WHERE id = @id;
END;


-- Mengubah data negara dengan ID di tabel tbl_countries
EXEC EditCountries @id = 'MLY', @name = 'Malaysia', @region = 2;


--Membuat SP untuk menghapus countries
CREATE PROCEDURE DeleteCountry
    @id CHAR(3)
AS
BEGIN
    -- Hapus data dari tabel tbl_countries
    DELETE FROM tbl_countries
    WHERE id = @id;
END;

-- Menghapus data negara dengan ID 'MLY' di tabel tbl_countries
EXEC DeleteCountry @id = 'MLY';
