SHOW databases;
USE join_example_db;
SHOW tables;
DESCRIBE roles;
DESCRIBE users;

-- 1) Use the join_example_db. Select all the records from both the users and roles tables.
SELECT *
FROM roles;
SELECT *
FROM users;

-- 2) Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
-- LEFT JOIN (6 rows)

SELECT *
from roles as r
join users as u
on r.id=u.role_id;


select *
from users as u
left join roles as r 
	on u.role_id = r.id;
    
-- RIGHT JOIN (4 rows)
select *
from users as u
right join roles as r 
	on u.role_id = r.id;


-- 3) Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that have the role. 
-- Hint: You will also need to use group by in the query.
select r.id, count(*)
from roles as r
left join users as u 
	on u.role_id = r.id
GROUP BY r.id;


-- 1) Use the employees database.
SHOW databases;
USE employees;
SHOW tables;

describe departments;
describe dept_manager;

SELECT *
FROM departments;

SELECT *
FROM dept_manager;


-- 2) Using the example in the Associative Table Joins section as a guide, 
-- 	write a query that shows each department along with the name of the current manager for that department.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name 
FROM departments AS d
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01'; -- current manager
-- you can also ORDER BY department name at the end. 
-- ORDER BY dept_name;


-- 3) Find the name of all departments currently managed by women.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name 
FROM departments AS d
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01' and e.gender = 'F'
ORDER BY dept_name; 



-- 4) Find the current titles of employees currently working in the Customer Service department.
-- you can start with a list of describe tables and comment to the right what columns will be used to link tables.
SELECT title, count(*)
FROM titles as t
JOIN dept_emp as de
ON t.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service' and de.to_date = '9999-01-01' and t.to_date = '9999-01-01' -- dont forget its current titles and currently in the dept.
GROUP BY title
ORDER BY title;



-- 5) Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_manager as dm
ON s.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' and s.to_date = '9999-01-01' -- current salary and currently assigned as manager to a department.
ORDER BY dept_name;



-- 6) Find the number of current employees in each department.
-- describe dept_emp; -- dept_no
-- describe departments; -- dept_no
SELECT d.dept_name, d.dept_no, count(*) as num_employees
FROM dept_emp as de
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'  
GROUP BY d.dept_name, d.dept_no
ORDER BY d.dept_no;



-- 7) Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, AVG(salary) as avg_sal
FROM employees as e -- you joined this table but it doesn't need to be here
JOIN salaries as s 
ON e.emp_no = s.emp_no
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
GROUP BY d.dept_name 
ORDER BY avg_sal desc
LIMIT 1;



-- 8) Who is the highest paid employee in the Marketing department?
-- have a system of starting these queries. use describe tables and comment on connecting column or a whiteboard.
SELECT e.first_name, e.last_name
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_emp as de
ON s.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name LIKE 'Marketing' and s.to_date = '9999-01-01' and de.to_date = '9999-01-01' 
ORDER BY s.salary desc
LIMIT 1;


-- 9) Which current department manager has the highest salary?
SELECT e.first_name, e.last_name, d.dept_name, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
JOIN dept_manager as dm
ON s.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
ORDER BY s.salary desc
LIMIT 1;


-- 10) Determine the average salary for each department. Use all salary information and round your results.
SELECT d.dept_name, ROUND(AVG(salary)) as avg_sal
FROM employees as e -- again, you did not need to join this table to answer the question. 
JOIN salaries as s 
ON e.emp_no = s.emp_no
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
GROUP BY d.dept_name 
ORDER BY avg_sal DESC;



-- 11) Bonus Find the names of all current employees, their department name, and their current manager's name.
-- self join lets you call on a table more than once. you can call employee table twice with two different aliases
-- 
SELECT a.first_name,a.last_name, d.dept_name, b.first_name,b.last_name
FROM employees a
JOIN dept_emp de
ON a.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees b
ON dm.emp_no = b.emp_no
WHERE  dm.to_date >NOW()
ORDER BY dept_name
LIMIT 10;


-- subqery method 























