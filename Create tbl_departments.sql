CREATE TABLE tbl_departments(
id INT PRIMARY KEY NOT NULL,
name VARCHAR (30) NOT NULL,
location INT NOT NULL,
CONSTRAINT FK_Locationid FOREIGN KEY (location) REFERENCES tbl_locations(id)
);