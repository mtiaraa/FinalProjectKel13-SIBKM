--Membuat view untuk melihat detail employee secara keseluruhan
CREATE VIEW vw_employee_details
AS
SELECT 
    e.id AS Employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.gender AS Gender,
    e.email AS Email,
    e.hire_date AS Hire_date,
    e.salary AS Salary,
    e.manager,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    j.title AS Job,
    d.name AS Department,
    r.name AS Roles,
    l.city AS Locations,
    (	
		SELECT TOP 1 status
        FROM tbl_job_histories 
        ORDER BY start_date DESC
    ) AS Status_Saat_Ini
FROM 
    tbl_employees e
 LEFT JOIN 
    tbl_jobs j ON e.job = j.id
LEFT JOIN 
    tbl_departments d ON e.id = d.id
LEFT JOIN 
    tbl_roles r ON e.id = r.id
LEFT JOIN 
    tbl_locations l ON e.id = l.id
LEFT JOIN 
    tbl_employees m ON e.id = m.id;

-- Menjalankan view
SELECT * FROM vw_employee_details;


--Membuat view untuk menampilkan list absensi secara detail
CREATE VIEW vw_absensi_details
AS
SELECT 
    a.id AS Id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    j.title AS Job,
    d.name AS DepartmentName,
    a.time AS Time,
	a.status AS Status
FROM 
    [dbo].tbl_absensi a
JOIN 
    [dbo].tbl_employees e ON a.id = e.id
JOIN 
    [dbo].tbl_jobs j ON e.job = j.id
JOIN 
    [dbo].tbl_departments d ON e.department = d.id;

--Menjalankan view absensi
SELECT * FROM vw_absensi_details;