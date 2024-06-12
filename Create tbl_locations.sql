CREATE TABLE tbl_locations(
id INT PRIMARY KEY NOT NULL,
street_address VARCHAR (40),
postal_code VARCHAR (12),
city VARCHAR (30) NOT NULL,
state_province VARCHAR (25),
country CHAR (3) FOREIGN KEY REFERENCES tbl_countries(id)
);
