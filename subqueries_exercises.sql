USE employees;
SHOW tables;

-- 1) Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT first_name, last_name, hire_date, to_date
FROM employees
JOIN dept_emp
USING (emp_no) 
WHERE hire_date = (
					select hire_date
					from employees
					where emp_no = 101010)
and to_date = '9999-01-01';
-- ANSWER: 55.
 
 
 
                    
-- 2) Find all the titles ever held by all current employees with the first name Aamod.
SELECT t.title, t.to_date, e.first_name
FROM employees as e
JOIN titles as t
USING (emp_no) 
WHERE e.first_name IN (
					SELECT first_name
					FROM employees
					WHERE first_name = 'Aamod')
and t.to_date = '9999-01-01';
-- ANSWER: 168 titles. 




-- 3) How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (SELECT emp_no
					FROM salaries
					WHERE to_date = '9999-01-01');
-- Answer: '59,900'

                    
				

-- 4) Find all the current department managers that are female. List their names in a comment in your code.
SELECT dm.emp_no, e.first_name, e.last_name
From employees as e
JOIN dept_manager as dm
USING (emp_no)
Where gender IN (		
				SELECT gender
				FROM employees 
				WHERE gender = 'F')
and dm.to_date = '9999-01-01';
-- ANSWER: 'Isamu Legleitner','Karsten Sigstam','Leon DasSarma','Hilary Kambil'





-- 5) Find all the employees who currently have a higher salary than the companie's overall, historical average salary.
SELECT e.first_name, e.last_name, s.salary
FROM employees as e
JOIN salaries as s
USING (emp_no)
WHERE salary >(          
				SELECT ROUND(AVG(salary))
				FROM salaries) and s.to_date > NOW();
                
                
                
	
-- 6) How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built-in function to calculate the standard deviation.) What percentage of all salaries is this?
-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. 
-- You will use this number (or the query that produced it) in other, larger queries.
                
SELECT COUNT(*)
FROM salaries
WHERE salary > (
				SELECT MAX(salary) - STDDEV(salary)
				FROM salaries)
and to_date > NOW();

-- Percentage of all salaries
SELECT COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW()) *100
FROM salaries
WHERE salary >= (
				SELECT MAX(salary) - STDDEV(salary)
				FROM salaries)
AND to_date > NOW();

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    