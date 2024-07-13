select employee_id, first_name , last_name
from employees;

select * 
from jobs;

select department_id, location_id
from departments;

select first_name, salary, 12*(salary+100)
from employees;

select job_id, job_title, min_salary, min_salary * 1.05 as "Min Salary"
from jobs;

SELECT last_name, job_id, salary, commission_pct
FROM employees;

select employee_id code, first_name "Emp Name", 12*salary "Annual Salary"
from employees;

SELECT first_name, last_name,
first_name||' '||last_name
FROM employees;

SELECT location_id, street_address, postal_code,
city||' '||state_province city
FROM locations;

SELECT last_name||' is a '||job_id "Employee Details"
FROM employees;

SELECT last_name||': 1 Month salary = '||salary monthly
FROM employees;

SELECT department_name||' Deartment''s Manager Id: '||manager_id "Department and Manager"
from departments;

SELECT distinct department_id, job_id
FROM employees
order by 1;

describe departments;
desc jobs;