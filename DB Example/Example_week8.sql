--****************SELF JOIN***********************--
SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id;
--AND worker.last_name = 'Lorentz';
--************************************************--

select manager_id,last_name
from employees;
--where _id = employee_id;

SELECT e.last_name, d.department_id, 
d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT department_name,state_province
FROM departments d LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE department_id IN (10,20,30,40);

SELECT employee_id, first_name||' '||last_name fullname,j.job_id,min_salary
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
AND SUBSTR(job_title,1,1) NOT IN ('A','P')
AND min_salary = 4000;
--AND job_title not like 'A%' 
--AND job_title not like 'P%' 
--AND min_salary = 4000;
----------------------------------------------------------------------------------


SELECT last_name,salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');

SELECT last_name
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 149);
                
SELECT last_name,job_id,salary
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
                
SELECT last_name,job_id,salary
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 141)
AND salary > (SELECT salary
                FROM employees
                WHERE employee_id = 141);
                
SELECT last_name,job_id,salary
FROM employees
WHERE (job_id,salary) = (SELECT job_id,salary
                        FROM employees
                        WHERE employee_id = 141);

SELECT last_name,job_id,salary
FROM employees
WHERE salary = (SELECT min(salary)
                FROM employees);

SELECT department_id, min(salary)
FROM employees 
GROUP BY department_id
HAVING min(salary) > (SELECT min(salary)
                    FROM employees
                    WHERE department_id = 50);

SELECT job_id,avg(salary)
FROM employees
group by job_id
HAVING avg(salary) = (SELECT min(avg(salary))
                        FROM employees
                        GROUP BY job_id);