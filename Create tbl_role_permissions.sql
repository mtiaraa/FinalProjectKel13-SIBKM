CREATE TABLE tbl_role_permissions (
    id INT PRIMARY KEY NOT NULL,
    role INT NOT NULL,
    permission INT FOREIGN KEY REFERENCES tbl_permissions(id)
);
