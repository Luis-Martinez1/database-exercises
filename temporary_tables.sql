use ursula_2335;
show tables;

-- 1) Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, 
-- last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. 
-- If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
Where to_date > now();   				-- don't forget about current employees

-- a) Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- b) Update the table so that the full_name column contains the correct data.
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

-- c ) Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

select * from employees_with_departments;

-- d) What is another way you could have ended up with this same table?
drop table employees_with_departments;

CREATE TEMPORARY TABLE employees_with_departments AS 
SELECT CONCAT(first_name, ' ', last_name) AS full_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
Where to_date > now();

select * from employees_with_departments;

-- 2) Create a temporary table based on the payment table from the sakila database.
USE ursula_2335;

CREATE TEMPORARY TABLE payment_too AS
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment; 

select *
from payment_too;

drop table payment_too;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. 
-- For example, 1.99 should become 199.
CREATE TEMPORARY TABLE payment_too AS
SELECT amount * 100 as new_amount, amount, payment_id, customer_id, staff_id, rental_id, payment_date, last_update
FROM sakila.payment;

select *
from payment_too;
describe payment_too;

ALTER TABLE payment_too MODIFY column new_amount int not null;

select *
from payment_too;
describe payment_too;


-- 3) Go back to the employees database. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. 
-- For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?
use ursula_2335;

select avg(salary) as overall_avg_salary from employees.salaries Where to_date > now(); -- overall current avg pay for everyone at the company

select std(salary) as overall_std_salary from employees.salaries Where to_date > now(); -- overall current stddev for everyone at the company

create temporary table current_department_salary as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > now()
    and employees.salaries.to_date > now()
    group by dept_name
);

select * from current_department_salary;

-- Create columns to hold the average salary, std, and the zscore
alter table current_department_salary add overall_average float(10,2);
alter table current_department_salary add overall_standard_deviation float(10,2);
alter table current_department_salary add z_score float(10,2);

update current_department_salary set overall_average = (select avg(salary) as overall_avg_salary from employees.salaries Where to_date > now());
update current_department_salary set overall_standard_deviation = (select std(salary) as overall_std_salary from employees.salaries Where to_date > now());

-- z_score  = (avg(x) - x) / std(x) */
update current_department_salary set z_score = (department_current_average - overall_average) / overall_standard_deviation;

select * from current_department_salary
order by z_score desc;

