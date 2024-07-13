SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

SELECT employee_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

SELECT job_id,  min_salary "Min Salary"
FROM jobs
WHERE &condition_user
ORDER BY &column_to_order;

SELECT employee_id, last_name, job_id,
        &&column_name
FROM employees
ORDER BY &column_name;
undefine column_name;

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
WHERE &column_name IS NOT NULL
ORDER BY &column_name desc;
undefine column_name;

DEFINE employee_num = 200;
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;
UNDEFINE employee_num;


--------------------------------------------------------------


SELECT 'The job id for ' || UPPER(last_name) || 
' is ' || LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE INITCAP(last_name) = 'Higgins';

SELECT CONCAT('Hello','World')
FROM dual;

SELECT SUBSTR('HelloWorld', 6, 3)
FROM dual;

SELECT INSTR('HelloWorld','W')
FROM dual;

SELECT employee_id,CONCAT(first_name||' ',last_name) name, job_id, 
        LENGTH(last_name), INSTR(last_name,'a') "Contains'a'?"
FROM employees
WHERE SUBSTR(job_id,4) = 'REP';

SELECT employee_id,CONCAT(first_name||' ',last_name) name, job_id, 
        LENGTH(last_name), INSTR(last_name,'a') "Contains'a'?"
FROM employees
WHERE last_name LIKE '%n';

SELECT LPAD('5000', 10, '*')
FROM dual;

SELECT RPAD('5000', 10, '*')
FROM dual;

SELECT first_name, RPAD(first_name,20,' ') first_name1 ,LPAD(first_name,20,'*') first_name2
FROM employees;

SELECT last_name, salary, mod(salary,5000) "Mod Salary"
FROM employees;

SELECT SYSDATE
FROM dual;

SELECT SYSDATE+2
FROM dual;

SELECT last_name, TRUNC((SYSDATE-hire_date)/7) AS WEEKS
FROM employees
WHERE department_id = 90;