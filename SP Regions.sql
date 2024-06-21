
INSERT INTO tbl_regions (id, name) VALUES (1, 'Jakarta');
--Membuat SP untuk menambahkan regions
CREATE PROCEDURE Addregions
    @id INT,
    @name VARCHAR(25)
AS
BEGIN
    INSERT INTO tbl_regions (id, name) VALUES (@id, @name);
END;

EXEC Addregions @id = 2, @name = 'Bandung';


--Membuat SP untuk mengedit regions
CREATE PROCEDURE Editregions
    @id INT,
    @name VARCHAR(25)
AS
BEGIN
    BEGIN 
        -- Memperbarui nama region berdasarkan ID
        UPDATE tbl_regions
        SET name = @name
        WHERE id = @id;
        END
END;

-- Menjalankan SP Editregions
EXEC Editregions @id = 1, @name = 'Jakarta';


--Membuat SP untuk menghapus regions
CREATE PROCEDURE Deleteregions
    @id INT
AS
BEGIN
    BEGIN
        -- Menghapus data berdasarkan ID
        DELETE FROM tbl_regions
        WHERE id = @id;
		END
END;

EXEC Deleteregions @id = 2;


