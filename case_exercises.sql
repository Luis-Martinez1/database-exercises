show databases;
use employees;

-- 1) Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
SELECT emp_no, concat(first_name, ' ', last_name) as full_name, dept_no, from_date, to_date,
		IF (to_date > now(), true, false) as 'is_current_employee'
from dept_emp
join employees
using (emp_no);




-- 2) Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
-- that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
select first_name, last_name, 
case
when left(last_name, 1) <= 'h' then 'a-h'
when left(last_name, 1) <= 'q' then 'i-q'
else 'r-z'
end as alpha_group
from employees;



-- 3) How many employees (current or previous) were born in each decade?
select 
	count(case when birth_date like '195%' then birth_date end) as '50s baby',
	count(case when birth_date like '196%' then birth_date end) as '60s baby'
from employees 
where birth_date like '19%';



-- 4) What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select   CASE
					WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
					WHEN dept_name IN ('Sales', 'Marketing') THEN 'sales_marketing'
					WHEN dept_name IN ('Production', 'Quality Management') THEN 'prod_QM'
					WHEN dept_name IN ('Finance', 'Human Resources') THEN 'finance_HR'
					ELSE 'customer_service'
                    END as dept_group,
                    ROUND(AVG(salary),2) as avg_salary
from departments
join dept_emp
using (dept_no)
join salaries
using (emp_no)
where salaries.to_date > now()
and dept_emp.to_date > now()
group by dept_group
;




