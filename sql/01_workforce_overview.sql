/*
====================================================
Project : Oracle HR SQL Portfolio
Phase   : 1
File    : 01_workforce_overview.sql

Description:
Workforce Overview Analysis

Database:
Oracle HR Sample Schema

Tables:
- Employees
- Departments
====================================================
*/

-- Task 1
-- What is the total number of employees in the company?

select count(*) as "İşçi sayı" from employees;


-- Task 2
-- What is the number of employees in each department?

select
department_name, count(*) as "İşci sayı"
from departments d inner join employees e
on d.department_id = e.department_id
group by department_name
order by "İşci sayı";


-- Task 3
-- What is the average salary by department?

select
department_id,
round(avg(salary),2) as "Orta maaş"
from employees
group by department_id
order by department_id;


-- Task 4
-- Show the number of employees with and without commission.

select
nvl2(commission_pct, 'Komissiya var', 'Komissiya yoxdur') as "Komissiya",
count(*) as say
from employees
group by nvl2(commission_pct, 'Komissiya var', 'Komissiya yoxdur')


-- Task 5
-- Show each employee’s name, salary, and the number of employees in their department.

select 
first_name, 
last_name, 
salary, 
count(*) over(partition by department_id) as "İşçi sayı"
from employees
order by "İşçi sayı";


