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
where last_name like '%e'
and last_name not like 'e%'; 
-- i forgot to put the not like clause 


-- Find all unique last names that start and end with 'E'.
select distinct last_name 
from employees
where last_name like 'e%' and last_name like '%e'; -- you can also use Like 'e%e'



-- Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
select *
from employees
where hire_date between '1990-01-01' and '1999-12-31';
-- Answer: Top three employee numbers are "10008", "10011", and "10012". 
-- or you can use LIKE '199%'


-- Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
select *
from employees
where birth_date like '%12-25';
-- Answer: Top three employee numbers are "10078", "10115", and "10261".



-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
select *
from employees
where hire_date between '1990-01-01' and '1999-12-31' -- you can also use like '199%'
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



