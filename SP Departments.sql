-- Code By : Cahyani Putri Riyanto--


--Membuat SP untuk menambahkan departments
CREATE PROCEDURE Adddepartments
    @id INT,
    @name VARCHAR(30),
    @location INT
AS
BEGIN
    -- Memeriksa apakah location yang diberikan ada di tabel tbl_locations
    IF NOT EXISTS (SELECT 1 FROM tbl_locations WHERE id = @location)
    BEGIN
        RAISERROR('Location ID does not exist', 16, 1);
        RETURN;
    END

    -- Menambahkan data ke tabel tbl_departments
    INSERT INTO tbl_departments (id, name, location)
    VALUES (@id, @name, @location);
END;

-- Menambahkan data ke tabel tbl_departments menggunakan Stored Procedure
EXEC Adddepartments @id = 1, @name = 'Human Resources', @location = 1;


--Membuat SP untuk mengedit departments
CREATE PROCEDURE Editdepartments
    @id INT,
    @name VARCHAR(30),
    @location INT
AS
BEGIN
    -- Memeriksa apakah location yang diberikan ada di tabel tbl_locations
    IF NOT EXISTS (SELECT 1 FROM tbl_locations WHERE id = @location)
    BEGIN
        RAISERROR('Location ID does not exist', 16, 1);
        RETURN;
    END

    -- Memeriksa apakah department yang diberikan ada di tabel tbl_departments
    IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @id)
    BEGIN
        RAISERROR('Department ID does not exist', 16, 1);
        RETURN;
    END

    -- Update data di tabel tbl_departments
    UPDATE tbl_departments
    SET name = @name,
        location = @location
    WHERE id = @id;
END;

-- Mengubah data departemen dengan ID 1 di tabel tbl_departments
EXEC Editdepartments @id = 1, @name = 'Human Resources', @location = 1;



--Membuat SP untuk menghapus departments
CREATE PROCEDURE Deletedepartments
    @id INT
AS
BEGIN
    -- Hapus data dari tabel tbl_departments
    DELETE FROM tbl_departments
    WHERE id = @id;
END;

-- Menghapus data departemen dengan ID 1 di tabel tbl_departments
EXEC Deletedepartments @id = 1;
