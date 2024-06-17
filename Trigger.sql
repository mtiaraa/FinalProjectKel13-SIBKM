-- Membuat trigger setelah insert pada tabel tbl_employees
CREATE TRIGGER tr_insert_employee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    -- Menambahkan data baru ke tabel tbl_job_histories dengan status "Active"
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT 
        id, 
        GETDATE(), 
        'Active', 
        job,
        department 
    FROM inserted;
END;


-- CODE BY : CAHYANI PUTRI RIYANTO--

-- Membuat trigger tr_delete_employee
CREATE TRIGGER tr_delete_employee
ON tbl_employees
AFTER DELETE
AS
BEGIN
    -- Memasukkan data ke tabel job_histories dengan status "Resign"
    INSERT INTO job_histories (employee, start_date, end_date, status, job, department)
    SELECT employee.id, GETDATE(), NULL, 'Resign', employee.job, employee.department
    FROM deleted employee;
END;


-- Membuat trigger tr_update_employee_job
CREATE TRIGGER tr_update_employee_job
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    -- Memasukkan data ke tabel job_histories dengan status "Hand Over"
    INSERT INTO job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        d.id, GETDATE(), NULL, 'Hand Over', d.job, d.department
    FROM 
        deleted d
    JOIN 
        inserted i ON d.id = i.id
    WHERE 
        d.job <> i.job; -- Hanya jika terjadi perubahan pada kolom job
END;



