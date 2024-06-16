--Membuat SP untuk menambahkan permissions
CREATE PROCEDURE AddPermission
    @name VARCHAR(100)
AS
BEGIN
    INSERT INTO tbl_permissions (name)
    VALUES (@name);
END
GO

-- Menjalankan stored procedure AddPermission
EXEC AddPermission 'EXECUTE';


-- Membuat SP untuk mengupdate data permissions
CREATE PROCEDURE EditPermission
    @id INT,
    @name VARCHAR(100)
AS
BEGIN
    UPDATE tbl_permissions
    SET name = @name
    WHERE id = @id;
END
GO

-- Menjalankan stored procedure EditPermission
EXEC EditPermission 1,'UPDATE';



--Membuat SP untuk menghapus data permissions
CREATE PROCEDURE Remove_Permission
    @PermissionID INT
AS
BEGIN
    DELETE FROM tbl_permissions
    WHERE id = @PermissionID;
END
GO


-- menjalankan SP Remove_permission
EXEC Remove_Permission 1;
