--2213110436 chittaworn
--1
SELECT DISTINCT location_id
FROM departments;

--2
SELECT country_id||' Stand for '||country_name fact
FROM countries;

--3
SELECT department_id||' '||department_name "ID and Name"
FROM departments
WHERE department_id BETWEEN 50 AND 150
AND manager_id IS NOT NULL;

--4
SELECT last_name, hire_date, job_id
FROM employees
WHERE department_id IN (30,100) 
AND last_name IN ('Sciarra','Raphaely');

--5
SELECT last_name
FROM employees
WHERE department_id IN (60,100)
OR manager_id IS NULL;

--6
SELECT department_name
FROM departments
WHERE department_name LIKE 'A%'
OR department_name LIKE '%ing';