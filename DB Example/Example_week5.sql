SELECT last_name,salary,
    CASE WHEN salary < 6000 THEN 0.36
        WHEN salary < 8000 THEN 0.38
        WHEN salary < 10000 THEN 0.4
        WHEN salary < 12000 THEN 0.42
        WHEN salary < 14000 THEN 0.44
        WHEN salary < 16000 THEN 0.45
    END tax_rate
FROM employees
WHERE department_id = 80;

SELECT job_id,job_title,min_salary,
   TO_CHAR( CASE WHEN job_title LIKE 'A%' THEN min_salary * 1.1
                WHEN job_title LIKE 'P%' THEN min_salary * 1.2
                ELSE min_salary
            END,'99,999.99') new_min
FROM jobs;

SELECT job_id,job_title,min_salary,
    TO_CHAR(DECODE(SUBSTR(job_title,1,1),'A%',min_salary * 1.1
                                ,'P%',min_salary * 1.2
            ,min_salary),'99,999.99') new_min
FROM jobs;

--------------------------------------------------------------------

--Chapter 5 Group Function

SELECT max(salary), MIN(salary), ROUND(AVG(salary),2)
FROM employees;

SELECT ROUND(AVG(salary)), MAX(salary),
    MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(last_name) first_lastname ,MAX(last_name) last_lastname
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

--????????? NULL
SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT AVG(commission_pct)
FROM employees;

SELECT AVG(NVL(commission_pct,0))
FROM employees;

SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY 1;

SELECT TO_CHAR(AVG(salary),'99,999.99') "Average Salary"
FROM employees
GROUP BY department_id
ORDER BY 1;

SELECT department_id DEPT_ID, job_id,
SUM(salary) 
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, COUNT(last_name)
FROM employees
GROUP BY department_id
ORDER BY 2;

SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id,job_id
ORDER BY 3;

SELECT department_id, AVG(salary)
FROM employees
HAVING AVG(salary) > 8000
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT department_id, ROUND(AVG(salary),2) "Average Salary"
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 12000;

SELECT job_id, TO_CHAR(SUM(salary),'999,999') payroll
FROM employees
WHERE job_id LIKE 'S%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY 1;

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

