--QUERY BY RIFKI FAUZIFAZR

--SP untuk menambahkan data pada tbl_roles
CREATE PROCEDURE sp_add_role
    @id INT,
    @name VARCHAR(50)
AS
BEGIN
    INSERT INTO tbl_roles (id, name)
    VALUES (@id, @name)
END

--SP untuk mengupdate data pada tbl_roles
CREATE PROCEDURE sp_update_role
    @id INT,
    @name VARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_roles WHERE id = @id)
    BEGIN
        RAISERROR('Role not found', 16, 1)
        RETURN
    END

    UPDATE tbl_roles
    SET name = @name
    WHERE id = @id
END

--SP untuk menghapus data pada tbl_roles
CREATE PROCEDURE sp_delete_role
    @id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_roles WHERE id = @id)
    BEGIN
        RAISERROR('Role not found', 16, 1)
        RETURN
    END

    DELETE FROM tbl_roles
    WHERE id = @id
END