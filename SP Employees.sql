--QUERY BY RIFKI FAUZIFAZR

--SP untuk Menambahkan data pada tbl_employees

CREATE PROCEDURE AddEmployee
    @id INT,
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_jobs WHERE id = @job)
    BEGIN
        RAISERROR('Invalid job', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM tbl_departments WHERE id = @department)
    BEGIN
        RAISERROR('Invalid department', 16, 1)
        RETURN
    END

    INSERT INTO tbl_employees (id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
    VALUES (@id, @first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager, @job, @department)
END

EXEC AddEmployee @id = 16, @first_name = 'Rifki', @last_name = 'Fauzifazr', @gender = 'Male',@email = 'rfauzi@email',@phone = 0812121212,@hire_date = '2024-06-15', @salary = 10000000, @manager = 3, @job = J001 , @department = 4;

SELECT * FROM tbl_employees;
--SP Untuk mengupdate data pada tbl_employees

CREATE PROCEDURE UpdateEmployee
    @id INT,
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM tbl_employees WHERE id = @id)
    BEGIN
        RAISERROR('Employee not found', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM tbl_jobs WHERE id = @job)
    BEGIN
        RAISERROR('Invalid job', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM tbl_departments WHERE id = @department)
    BEGIN
        RAISERROR('Invalid department', 16, 1)
        RETURN
    END

    UPDATE tbl_employees
    SET first_name = @first_name,
        last_name = @last_name,
        gender = @gender,
        email = @email,
        phone = @phone,
        hire_date = @hire_date,
        salary = @salary,
        manager = @manager,
        job = @job,
        department = @department
    WHERE id = @id
END

EXEC UpdateEmployee @id = 16, @first_name = 'hihi', @last_name = 'Fauzifazr', @gender = 'Male',@email = 'rfauzi@email',@phone = 0812121212,@hire_date = '2024-06-15', @salary = 10000000, @manager = 3, @job = J002 , @department = 4;


--SP Untuk Menghapus data pada tbl_employees
CREATE PROCEDURE DeleteEmployee
    @id INT
AS
BEGIN
    DELETE FROM tbl_employees
    WHERE id = @id;
END

EXEC DeleteEmployee @id = 16;


