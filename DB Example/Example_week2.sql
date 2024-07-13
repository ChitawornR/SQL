SELECT *
FROM employees
WHERE department_id = 90;

SELECT employee_id, last_name, job_id, department_id depid
FROM employees
WHERE department_id = 90;

SELECT job_id, job_title, 12*max_salary max_salary
FROM jobs
WHERE 12*max_salary = 240960; --or use [job_title = 'Sale Manager']

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

SELECT last_name
FROM employees
WHERE hire_date = '17-feb-04';

SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

SELECT first_name, hire_date
FROM employees
WHERE hire_date < '1-jun-03';

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

SELECT last_name
FROM employees
WHERE last_name BETWEEN 'King' AND 'Smith';

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100,101,201);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE last_name IN ('Hartstein','Vargas');

SELECT 'Dep:'||department_id||' emp''s id:'||employee_id||' is '||
        first_name||' '||last_name||' Salary ='|| salary "Employee Detail"
FROM employees
WHERE department_id IN (10,20);

SELECT first_name
FROM employees
WHERE first_name LIKE '%r';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%03';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE 'SA\_%' ESCAPE '\';

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS null;

SElECT last_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM departments
WHERE ROWNUM <=3;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > 10000
AND job_id LIKE '%MAN%';

SELECT last_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NULL
AND job_id LIKE '%AD\_%' ESCAPE '\'
ORDER bY 2;

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'
OR job_id = 'AD_PRES')
AND salary > 15000;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date desc;

SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal desc;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

SELECT *
FROM employees
ORDER BY 8 desc;

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

SELECT last_name, department_id
FROM employees
WHERE department_id in (20,50)
ORDER BY 1;
