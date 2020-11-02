CREATE DATABASE IF NOT EXISTS employee_db;
GRANT ALL ON *.* to db_user@localhost IDENTIFIED BY 'Passw0rd';
USE employee_db;
CREATE TABLE IF NOT EXISTS employees (name VARCHAR(20));
INSERT INTO employees VALUES ('JOHN');
