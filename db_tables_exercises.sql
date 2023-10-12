SHOW databases;
USE albums_db;
SELECT database();
SHOW tables;
USE employees;
SELECT database();
SHOW tables;
DESCRIBE employees;
-- Which table(s) do you think contain a numeric type column? Employees and salaries table likely contains a Numberic type column (employee number).
-- Which table(s) do you think contain a string type column? Titles and departments table likely contains a string type column. 
-- Which table(s) do you think contain a date type column? Employees table likely contains a date type column (employee hire date).
-- What is the relationship between the employees and the departments tables? Employees are likely assigned to a department in the Employee table such as a column with a department number. 
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE salaries;
DESCRIBE titles;
SHOW tables;
SHOW CREATE TABLE dept_manager; -- This is the SQL code it takes to show information about the source data.

-- CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1-- 




