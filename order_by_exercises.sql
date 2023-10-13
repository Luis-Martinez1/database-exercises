show databases;
use employees;
select database ();
SHOW tables;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
select *
from employees
where first_name in ('Irena','Vidya','Maya');
-- Answer: The top three results have the employee numbers "10200", "10397", and "10610". 


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
select *
from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name= 'Maya';
-- Answer: The top three results have the employee numbers "10200", "10397", and "10610". This matches the previous question. 


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
select *
from employees
where first_name = 'Irena' and gender = 'M'
or first_name = 'Vidya' and gender = 'M'
or first_name= 'Maya' and gender ='M';
-- Answer: Employee numbers of the top 3 results are "10200", "10397", and "10821".



-- Find all unique last names that start with 'E'.
select distinct last_name 
from employees
where last_name like 'e%';



-- Find all unique last names that start or end with 'E'.
select distinct last_name 
from employees
where last_name like 'e%' or last_name like '%e';  



-- Find all unique last names that end with E, but does not start with E?
select distinct last_name 
from employees
where last_name like '%e'; 



-- Find all unique last names that start and end with 'E'.
select distinct last_name 
from employees
where last_name like 'e%' and last_name like '%e'; 


-- Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
select *
from employees
where hire_date between '1990-01-01' and '1999-12-31';
-- Answer: Top three employee numbers are "10008", "10011", and "10012". 


-- Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
select *
from employees
where birth_date like '%12-25';
-- Answer: Top three employee numbers are "10078", "10115", and "10261".



-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
select *
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%12-25';
-- Answer: Top three employee numbers are "10261", "10438", and "10681".



-- Find all unique last names that have a 'q' in their last name.
select distinct last_name 
from employees
where last_name like '%q%';



-- Find all unique last names that have a 'q' in their last name but not 'qu'.
select distinct last_name 
from employees
where last_name like '%q%'
and last_name not like '%qu%';



-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name;
-- Answer: The first and last name in the first row of the results is Irena Reutenauer.
-- Answer: The first and last name of the last person in the table is Vidya Simmen. 


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name, last_name;
-- Answer: The first and last name in the first row of the results is Irena Acton.
-- Answer: The first and last name of the last person in the table is Vidya Zweizig. 



-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by last_name, first_name;
-- Answer: The first and last name in the first row of the results is Irena Acton.
-- Answer: The first and last name of the last person in the table is Maya Zyda.


-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select * 
from employees
where last_name like 'e%' and last_name like '%e'
ORDER BY emp_no; 
-- Answer: The number of employees returned is 899. The first employee number and their first and last name is 10021 Ramzi Erde. The last employee number with their first and last name is 499648 Tadahiro Erde.


-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
select * 
from employees
where last_name like 'e%' and last_name like '%e'
ORDER BY hire_date desc; 
-- Answer: The number of employees returned is 899. The newest employee is Teji Eldridge, and the name of the oldest employee is Sergi Erde.



-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
select *
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%12-25'
ORDER BY birth_date asc, hire_date desc;
-- The number of employees returned is 362. The name of the oldest employee who was hired last is Khun Bernini. The name of the youngest employee who was hired first is Douadi Pettis.



