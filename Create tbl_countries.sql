CREATE TABLE tbl_countries(
id CHAR (3) PRIMARY KEY NOT NULL,
name VARCHAR (40) NOT NULL,
region INT FOREIGN KEY REFERENCES tbl_regions(id)
);