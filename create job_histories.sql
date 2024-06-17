CREATE TABLE tbl_job_histories(
employee INT PRIMARY KEY NOT NULL,
start_date DATE PRIMARY KEY NOT NULL,
end_date DATE,
status VARCHAR (10) NOT NULL,
job VARCHAR (10) NOT NULL,
department INT NOT NULL,
PRIMARY KEY (employee, start_date)
);

-- Menambahkan FK pada employee pada  tbl_job_histories
ALTER TABLE tbl_job_histories
ADD CONSTRAINT FK_Employee FOREIGN KEY (employee) REFERENCES tbl_employees(id);

-- Menambahkan FK pada role di tbl_role_permissions
ALTER TABLE tbl_role_permissions
ADD CONSTRAINT FK_RolesPermissions FOREIGN KEY (role) REFERENCES tbl_roles(id)