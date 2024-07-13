SELECT to_char(hire_date,'yyyy'),count(*)
FROM employees
GROUP BY to_char(hire_date,'yyyy')
HAVING MAX(to_char(hire_date,'yyyy'))>2004
order by 1;

--select count(case to_char(hire_date,'YYYY') when '2005' then 1 end) "2005",
--        count(case to_char(hire_date,'YYYY') when '2006' then 1 end)"2006",
--        count(case to_char(hire_date,'YYYY') when '2007' then 1 end)"2007",
--        count(case to_char(hire_date,'YYYY') when '2008' then 1 end) "2008"
--from employees;

SELECT department_id, department_name,location_id, city
FROM departments
NATURAL JOIN locations;

SELECT location_id,street_address,city,state_province,country_name
FROM locations
NATURAL JOIN countries;

SELECT employee_id, last_name, location_id,
department_id
FROM employees JOIN departments
USING (department_id);

SELECT last_name,department_id,department_name
FROM employees JOIN departments
USING (department_id);

--?????????????????????
SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE d.location_id = 1400;

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name,job_title, d.location_id,department_name,city,
        region_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
on d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
JOIN regions r
ON c.region_id = r.region_id
JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND e.manager_id = 149;

SELECT department_id,department_name,l.location_id,city
FROM departments d JOIN locations l
ON d.location_id = l.location_id 
AND (department_id IN (20,50));