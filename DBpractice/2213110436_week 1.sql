--lab week 1 2213110436 chittaworn
--1
select *
from employees;

--2
select *
from countries;

--3
select employee_id, first_name||' '||last_name employee_name, salary
from employees;

--4
select 'Emp Id: '|| employee_id || ' get salary '||salary||
' per month x 12 = '||salary*12 employee_salary
from employees;

--5
select job_id||' job''s title is '||job_title
from jobs;

--6
select distinct department_id
from employees
order by 1;