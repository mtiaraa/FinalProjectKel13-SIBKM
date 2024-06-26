CREATE PROCEDURE AddAbsensi
    @id INT,
	@employee INT,
    @time DATE,
	@status VARCHAR
    
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert new attendance record
    INSERT INTO tbl_absensi(id, employee, time, status)
    VALUES (@id, @employee, @time, @status);

    -- periksa data baru 
    IF @@ROWCOUNT = 0
    BEGIN
        -- jika data gagal, pesan eror muncul
        RAISERROR('Failed to add attendance record.', 16, 1);
    END
    ELSE
    BEGIN
        -- jika berhasil, tampilkan data baru berhasil
        PRINT 'Attendance record added successfully.';
    END
END;
GO

