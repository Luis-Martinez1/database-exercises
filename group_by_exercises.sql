
-- 1) Create a new file named group_by_exercises.sql


use employees;
show tables;



-- 2) In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
select DISTINCT(title) 
from titles;
-- Answer: There are 7 unique titles.

SELECT *
FROM employees;


-- 3) Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


-- 4) Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;
 
 
-- 5) Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Answer:'Chleq', 'Lindqvist', 'Qiwen'.


-- 6) Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT last_name, count(*) as same_last_name
FROM employees
WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name;


-- 7) Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
SELECT first_name, gender, count(*)
FROM employees
WHERE first_name in ('Irena','Vidya','Maya')
GROUP BY gender, first_name;


-- 8) Using your query that generates a username for all employees, generate a count of employees with each unique username.
SELECT lower(concat(
					SUBSTR(first_name, 1, 1), 
					SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2), 
					SUBSTR(birth_date, 3, 2))) as username, count(*)
				
FROM employees
GROUP BY username;


-- 9) From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?
SELECT lower(concat(
					SUBSTR(first_name, 1, 1), 
					SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2), 
					SUBSTR(birth_date, 3, 2))) as username, count(*) as cnt
				
FROM employees
GROUP BY username
HAVING cnt > 1
order by cnt desc;



-- BONUS
select count(cnt)
from(
SELECT lower(concat(
					SUBSTR(first_name, 1, 1), 
					SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2), 
					SUBSTR(birth_date, 3, 2))) as username, count(*) as cnt
				
FROM employees
GROUP BY username
HAVING cnt > 1
order by cnt desc) as cnt;
-- Asnwer: There are 13,251 duplicates. 








-- Bonus: More practice with aggregate functions:
SELECT *
FROM salaries;
DESCRIBE salaries;

-- Determine the historic average salary for each employee. 
-- When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.
SELECT *
FROM dept_emp;


SELECT dept_no, count(*) AS current_employees
FROM dept_emp
Where to_date = '9999-01-01'
GROUP BY dept_no;
-- current employee is why we use where clause and the 9999-01-01 date.


-- Determine how many different salaries each employee has had. This includes both historic and current.

SELECT emp_no, COUNT(DISTINCT salary)
FROM salaries
GROUP BY emp_no;



-- Find the maximum salary for each employee.

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;


-- Find the standard deviation of salaries for each employee.

SELECT *
FROM salaries;

SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;


-- Find the max salary for each employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(salary) as max_sal
FROM salaries
GROUP BY emp_no
HAVING max_sal > 150000;


-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary) as avg_sal
FROM salaries
GROUP BY emp_no
HAVING avg_sal > 80000 and avg_sal < 90000;






