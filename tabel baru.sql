-- Membuat tabel tbl_employees
CREATE TABLE tbl_employees (
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25),
    gender VARCHAR(10),
    email VARCHAR(25) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    salary INT,
    manager INT,
    job VARCHAR(10) NOT NULL,
    department INT NOT NULL,
    CONSTRAINT FK_Manager FOREIGN KEY (manager) REFERENCES tbl_employees(id),
    CONSTRAINT FK_Job FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    CONSTRAINT FK_Department FOREIGN KEY (department) REFERENCES tbl_departments(id)
);


-- Membuat tabel acocount
CREATE TABLE tbl_accounts (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(25),
    password VARCHAR(255) NOT NULL,
    otp INT NOT NULL,
    is_expired BIT NOT NULL,
    is_used DATETIME NOT NULL,
    CONSTRAINT FK_EmployeeAccount FOREIGN KEY (id) REFERENCES tbl_employees(id)
);


-- Membuat tabel tbl_account_roles
CREATE TABLE tbl_account_roles (
    id INT NOT NULL PRIMARY KEY,
    account INT NOT NULL,
    role INT NOT NULL,
    CONSTRAINT FK_Account FOREIGN KEY (account) REFERENCES tbl_accounts(id),
    CONSTRAINT FK_Role FOREIGN KEY (role) REFERENCES tbl_roles(id)
);


-- Membuat tabel tbl_absensi
CREATE TABLE tbl_absensi(
id INT PRIMARY KEY NOT NULL,
employee INT NOT NULL,
time DATE NOT NULL
CONSTRAINT FK_Absensi FOREIGN KEY (employee) REFERENCES tbl_employees(id)
);

ALTER TABLE tbl_absensi
ADD status VARCHAR (20);