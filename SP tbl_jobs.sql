--Membuat SP AddJob
CREATE PROCEDURE AddJob
    @id VARCHAR(10),
    @title VARCHAR(35),
    @min_salary INT,
    @max_salary INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi min_salary dan max_salary menggunakan func_salary
    IF dbo.func_salary(@min_salary) = 1 AND dbo.func_salary(@max_salary) = 1
    BEGIN
        -- Tambahkan data baru ke tabel job
        INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
        VALUES (@id, @title, @min_salary, @max_salary);
    END
    ELSE
    BEGIN
        -- Jika validasi gagal, berikan pesan kesalahan
        RAISERROR('Salary cannot higger then (Max Salary) and Lower than (Min Salary)!', 16, 1);
    END
END;
GO

-- Menggunakan SP AddJob
EXEC AddJob'DEV', 'Software Enggineering', 5000000, 50000000;  -->selanjutnya tambahkan inputannya!!!

-- Membuat SP EditJob
CREATE PROCEDURE EditJob
    @id VARCHAR(10),
    @title VARCHAR(35),
    @min_salary INT,
    @max_salary INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi min_salary dan max_salary menggunakan func_salary
    IF dbo.func_salary(@min_salary) = 1 AND dbo.func_salary(@max_salary) = 1
    BEGIN
		 -- Memeriksa apakah job_id yang diberikan ada di dalam tabel job
        IF EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @id)
		BEGIN
        -- update data ke tabel job
        UPDATE tbl_jobs
		SET
			title = @title,
            min_salary = @min_salary,
            max_salary = @max_salary
            WHERE id = @id;

   IF @@ROWCOUNT = 0
            BEGIN
                -- Jika data tidak berhasil di update tampilkan pesan kesalahan
                RAISERROR('ID not found or data not changed.', 16, 1);
            END
            ELSE
            BEGIN
                -- jika data berhasil di update
                PRINT 'Job data updated successfully.';
            END
        END
        ELSE
        BEGIN
            -- ID tidak ditemukakn
            RAISERROR('ID not found.', 16, 1);
        END
    END
    ELSE
    BEGIN
        -- Salary validation failed, display error message
        RAISERROR('Salary validation failed. Salary cannot be higher than Max Salary or lower than Min Salary!', 16, 1);
    END
END;
GO

--Menggunakan SP EditJob
EXEC EditJob 'DEV', 'Data Enggineering', 6000000, 50000000;


-- Membuat SP DeleteJob
CREATE PROCEDURE DeleteJob
    @id VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- Hapus data jobs
    DELETE FROM tbl_jobs
    WHERE id = @id;

    -- Memeriksa apakah ada baris yang dihapus
    IF @@ROWCOUNT = 0
    BEGIN
        -- Jika tidak ada baris yang dihapus, tampilkan pesan kesalahan
        RAISERROR('ID not found!.', 16, 1);
    END
    ELSE
    BEGIN
        -- Jika ada baris yang dihapus, tampilkan pesan sukses
        PRINT 'Job entry deleted successfully.';
    END
END;
GO

--Menggunakan SP DeleteJob
EXEC DeleteJob 'DEV'
