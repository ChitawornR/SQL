--2213110436 chittaworn
--1
SELECT last_name,salary,e.department_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700
ORDER BY 3 desc;

--2
SELECT d.department_id,d.department_name
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'Seattle';

--3
SELECT salary,last_name
FROM employees
WHERE salary > ALL (SELECT e.salary
                    FROM employees e JOIN employees m
                    ON e.manager_id = m.employee_id
                    WHERE m.last_name = 'Mourgos');

--4
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < (SELECT avg(salary)
                FROM employees)
AND job_id IN (SELECT job_id
                FROM employees
                WHERE last_name LIKE '%y%');
                
--5
SELECT last_name,salary
FROM employees
WHERE salary = (SELECT salary
                FROM employees
                WHERE last_name = '&&Enter_name')
AND last_name <> '&Enter_name';

undefine Enter_name;