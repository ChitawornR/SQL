--2213110436 chittaworn
--1
SELECT last_name,j.job_id,job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
AND manager_id = 120 AND e.job_id NOT LIKE '%T%';

--2
SELECT location_id,street_address,c.country_id
FROM locations l JOIN countries c
ON l.country_id = c.country_id
AND c.country_id IN ('UK','CA') 
AND l.street_address  NOT BETWEEN 'A' and 'Z';

--3
SELECT first_name,salary,department_name,city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
AND first_name LIKE 'A%' AND department_name IN ('Sales','IT');

--4
SELECT first_name||' from '||d.department_name "Emp_Dept",ADD_MONTHS(hire_date,3) "3 Month after Hired"
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND e.department_id IN (60,70);

--5
SELECt last_name,to_char(hire_date,'fmDay ddth "of" Month yyyy') hire_date,department_name,job_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND job_id = UPPER('&job_id');

--6
SELECT employee_id,to_char(start_date,'Dy ddth Mon yy') start_date,end_date,job_title,TRUNC(MONTHS_BETWEEN(end_date,start_date))
        "number of mounth worked"
FROM job_history jh JOIN jobs j
ON jh.job_id = j.job_id
AND MONTHS_BETWEEN(end_date,start_date) >=40;

--7
SELECT last_name,job_id,e.department_id,department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
AND city = 'Toronto';
