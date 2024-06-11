CREATE TABLE tbl_job_histories(
employee INT NOT NULL,
start_date DATE,
end_date DATE,
status VARCHAR (10),
job VARCHAR (10),
department INT,
PRIMARY KEY (employee, start_date)
);