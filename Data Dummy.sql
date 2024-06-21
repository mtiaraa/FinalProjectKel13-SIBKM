--dummy regions
INSERT INTO tbl_regions (id, name)
VALUES
(1, 'Asia'),
(2, 'Europe'),
(3, 'North America'),
(4, 'South America'),
(5, 'Africa'),
(6, 'Oceania');
SELECT * FROM tbl_regions;


--dummy countries
INSERT INTO tbl_countries (id, name, region)
VALUES
    ('IDN', 'Indonesia', 1),
    ('USA', 'United States of America', 3),
    ('CHN', 'China', 1),
    ('JPN', 'Japan', 1),
    ('FRA', 'France', 2),
    ('GER', 'Germany', 2),
    ('ITA', 'Italy', 2),
    ('ESP', 'Spain', 2),
    ('RUS', 'Russia', 1),
    ('CAN', 'Canada', 3);
SELECT * FROM tbl_countries;

--dummy locations
INSERT INTO tbl_locations (id, street_address, postal_code, city, state_province, country)
VALUES
    (1, 'Jl. Raya Jakarta', '12345', 'Jakarta', 'DKI Jakarta', 'IDN'),
    (2, '123 Main St', '12345', 'New York', 'New York', 'USA'),
    (3, 'Tokyo Tower', '12345', 'Tokyo', 'Tokyo', 'JPN'),
    (4, 'Eiffel Tower', '12345', 'Paris', 'Île-de-France', 'FRA'),
    (5, 'Colosseum', '12345', 'Rome', 'Lazio', 'ITA'),
    (6, 'La Sagrada Familia', '12345', 'Barcelona', 'Catalonia', 'ESP'),
    (7, 'Red Square', '12345', 'Moscow', 'Moscow', 'RUS'),
    (8, 'CN Tower', '12345', 'Toronto', 'Ontario', 'CAN'),
    (9, 'Great Wall of China', '12345', 'Beijing', 'Beijing', 'CHN'),
    (10, 'Kurfürstendamm 1', '10719', 'Berlin', 'Berlin', 'GER');
SELECT * FROM tbl_locations;

--dummy departments
INSERT INTO tbl_departments (id, name, location)
VALUES
    (1, 'Sales', 1),
    (2, 'Marketing', 2),
    (3, 'HR', 3),
    (4, 'IT', 4),
    (5, 'Finance', 5),
    (6, 'Operations', 6),
    (7, 'Logistics', 7),
    (8, 'Customer Service', 8),
    (9, 'Research and Development', 9),
    (10, 'Executive', 10);
SELECT * FROM  tbl_departments;

--dummy jobs
INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
VALUES
    ('J001', 'Software Engineer', 5000000, 10000000),
    ('J002', 'Data Scientist', 6000000, 12000000),
    ('J003', 'Marketing Manager', 7000000, 15000000),
    ('J004', 'Sales Representative', 4000000, 8000000),
    ('J005', 'HR Generalist', 3500000, 6500000),
    ('J006', 'IT Support Specialist', 3000000, 5500000),
    ('J007', 'Financial Analyst', 4500000, 9000000),
    ('J008', 'Operations Manager', 5500000, 11000000),
    ('J009', 'Logistics Coordinator', 2500000, 4500000),
    ('J010', 'Customer Service Representative', 2000000, 4000000);
SELECT * FROM  tbl_jobs;

--dummy employees
INSERT INTO tbl_employees (id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
VALUES
    (1, 'John', 'Doe', 'Male', 'john.doe@mail.com', '1234567890', '2020-01-01', 5000000, NULL, 'J001', 1),
    (2, 'Jane', 'Smith', 'Female', 'jane.smith@mail.com', '0987654321', '2020-02-01', 7500000, 1, 'J002', 2),
    (3, 'Bob', 'Johnson', 'Male', 'bob.johnson@mail.com', '1111111111', '2020-03-01', 8000000, 2, 'J003', 3),
    (4, 'Alice', 'Williams', 'Female', 'alice.williams@mail.com', '2222222222', '2020-04-01', 6000000, 3, 'J004', 4),
    (5, 'Mike', 'Davis', 'Male', 'mike.davis@mail.com', '3333333333', '2020-05-01', 6000000, 4, 'J005', 5),
    (6, 'Emily', 'Brown', 'Female', 'emily.brown@mail.com', '4444444444', '2020-06-01', 5000000, 5, 'J006', 6),
    (7, 'David', 'Lee', 'Male', 'david.lee@mail.com', '5555555555', '2020-07-01', 5000000, 6, 'J007', 7),
    (8, 'Sarah', 'Taylor', 'Female', 'sarah.taylor@mail.com', '6666666666', '2020-08-01', 10000000, 7, 'J008', 8),
    (9, 'Tom', 'Harris', 'Male', 'tom.harris@mail.com', '7777777777', '2020-09-01', 3000000, 8, 'J009', 9),
    (10, 'Lily', 'Chen', 'Female', 'lily.chen@mail.com', '8888888888', '2020-10-01', 3500000, 9, 'J010', 10);
SELECT * FROM tbl_employees;

--dummy job histories
INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
VALUES
    (1, '2020-01-01', '2020-12-31', 'Active', 'J001', 1),
    (2, '2020-01-01', '2020-12-31', 'Active', 'J002', 2),
    (3, '2020-02-01', '2020-12-31', 'Active', 'J003', 3),
    (4, '2020-03-01', '2020-12-31', 'Active', 'J004', 4),
    (5, '2020-04-01', '2020-12-31', 'Inactive', 'J005', 5),
    (6, '2020-05-01', '2020-12-31', 'Active', 'J006', 6),
    (7, '2020-06-01', '2020-12-31', 'Active', 'J007', 7),
    (8, '2020-07-01', '2020-12-31', 'Active', 'J008', 8),
    (9, '2020-08-01', '2020-12-31', 'Inactive', 'J009', 9),
    (10, '2020-09-01', '2020-12-31', 'Active', 'J010', 10);
SELECT * FROM tbl_job_histories;

--dummy accounts
INSERT INTO tbl_accounts (username, password, otp, is_expired, is_used)
VALUES
    ('john.doe', 'password123', 123456, 0, '2020-01-01 12:30:000'),
    ('jane.smith', 'password456', 789012, 0, '2020-02-01 08:00:000'),
    ('bob.johnson', 'password789', 345678, 0, '2020-03-01 10:19:000'),
    ('alice.williams', 'password012', 901234, 0, '2020-04-01 11:12:000'),
    ('mike.davis', 'password345', 567890, 0, '2020-05-01 08:00:000'),
    ('emily.brown', 'password678', 234567, 0, '2020-06-01 12:30:000'),
    ('david.lee', 'password901', 890123, 0, '2020-07-01 10:19:000' ),
    ('sarah.taylor', 'password234', 567890, 0, '2020-08-01 08:00:000'),
    ('tom.harris', 'password567', 901234, 0, '2020-09-01 10:19:000'),
    ('lily.chen', 'password890', 123456, 0, '2020-10-01 12:30:000');
SELECT * FROM tbl_accounts;

--dummy roles
INSERT INTO tbl_roles (name)
VALUES 
	('Super Admin'),
	('Admin'),
	('Manager'),
	('Employee');
SELECT * FROM tbl_roles;

--dummy account roles
INSERT INTO tbl_account_roles (id, account, role)
VALUES
    (1, 1, 3),
    (2, 2, 2),
    (3, 3, 2),
    (4, 4, 3),
    (5, 5, 3),
    (6, 6, 4),
    (7, 7, 4),
    (8, 8, 1),
    (9, 9, 4),
    (10, 10, 4);
SELECT * FROM tbl_account_roles;

--dummy permissions
INSERT INTO tbl_permissions (name)
VALUES
    ('Add Employee'),
    ('Update Employee'),
    ('Delete Employee'),
    ('View Employee Detail'),
    ('Add Job'),
    ('Edit Job'),
    ('Delete Job'),
    ('Add Department'),
    ('Edit Department'),
    ('Delete Department'),
    ('Add Location'),
    ('Edit Location'),
    ('Delete Location'),
    ('Add Country'),
    ('Edit Country'),
    ('Delete Country'),
    ('Add Region'),
    ('Edit Region'),
    ('Delete Region'),
    ('Add Role'),
    ('Edit Role'),
    ('Delete Role'),
    ('Add Permission'),
    ('Edit Permission'),
    ('Delete Permission'),
    ('Add Absensi'),
    ('View Absensi Detail');
SELECT * FROM tbl_permissions;

--dummy role permissions
--super admin
INSERT INTO tbl_role_permissions (id, role, permission)
VALUES
    (1, 1, 2),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6),
    (7, 1, 7),
    (8, 1, 8),
    (9, 1, 9),
    (10, 1, 10),
    (11, 1, 11),
    (12, 1, 12),
    (13, 1, 13),
    (14, 1, 14),
    (15, 1, 15),
    (16, 1, 16),
    (17, 1, 17),
    (18, 1, 18),
    (19, 1, 19),
    (20, 1, 20),
    (21, 1, 21),
    (22, 1, 22),
    (23, 1, 23),
    (24, 1, 24),
    (25, 1, 25),
    (26, 1, 26),
    (27, 1, 27);

--admin
INSERT INTO tbl_role_permissions (id, role, permission)
VALUES
    (28, 2, 2),
    (29, 2, 2),
    (30, 2, 3),
    (31, 2, 4),
    (32, 2, 5),
    (33, 2, 6),
    (34, 2, 7),
    (35, 2, 8),
    (36, 2, 9),
    (37, 2, 10),
    (38, 2, 11),
    (39, 2, 12),
    (40, 2, 13),
    (41, 2, 14),
    (42, 2, 15),
    (43, 2, 16),
    (44, 2, 17),
    (45, 2, 18),
    (46, 2, 19),
    (47, 2, 20),
    (48, 2, 21),
    (49, 2, 22),
    (50, 2, 26),
    (51, 2, 27);

--manager
INSERT INTO tbl_role_permissions (id, role, permission)
VALUES
	(52, 3, 2),
	(53, 3, 4),
	(54, 3, 26),
	(55, 3, 27);

--employee
INSERT INTO tbl_role_permissions (id, role, permission)
VALUES
	(56, 4, 26);

SELECT * FROM tbl_role_permissions;

--dummy absensi

SELECT * FROM tbl_absensi;