/*
====================================================
Project : Oracle HR SQL Portfolio
Phase   : 2
File    : 02_salary_analysis.sql

Description:
Salary Analysis

Database:
Oracle HR Sample Schema

Tables:
- Employees
- Departments
====================================================
*/

-- Task 1
-- Show the employees whose salary is higher than the company's average salary.

select * from employees
where salary > (
select 
avg(salary) as "Orta maaş"
from employees)
order by salary;


-- Task 2
-- Find the employee with the highest salary in each department.

select * from (
select
first_name,
last_name,
salary,
department_id,
rank() over(partition by department_id order by salary desc) as "Sıra"
from employees)
where "Sıra" = 1;


-- Task 3
-- Show the minimum, maximum, and average salary in each department.

select
department_id,
round(avg(salary),2) as orta_maas,
min(salary) as min_maas,
max(salary) as max_maas
from employees
group by department_id
order by department_id;


-- Task 4
-- Show each employee along with the average salary of their department.

select
first_name,
department_id,
round(avg(salary) over(partition by department_id),2) as orta_maas
from employees;


-- Task 5
-- Calculate the percentage of the total salary that each department's total salary represents.

select
department_id,
sum(salary) as cem_maas,
round(sum(salary) / (select sum(salary) from employees)*100,2) as faiz
from employees
group by department_id
order by faiz;
