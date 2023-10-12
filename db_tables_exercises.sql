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






