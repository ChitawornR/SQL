SELECT SYSDATE 
FROM dual;

SELECT first_name,trunc((sysdate-hire_date)/30),
        TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date))
FROM employees;

SELECT last_name,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date))AS MONTHS_WORKED,
ADD_MONTHS(SYSDATE,2),
hire_date,
next_day(hire_date,'Monday'),
last_day(hire_date)
FROM employees;

SELECT employee_id, hire_date,
ROUND(hire_date, 'MONTH') AS ROUNDMONTH,
TRUNC(hire_date, 'MONTH') AS TRUNCMONTH
FROM employees
WHERE hire_date LIKE '%07';

SELECT employee_id,hire_date,add_months(hire_date,6),
        next_day(hire_date,'friday'),last_day(hire_date),
        months_between(sysdate,hire_date)
FROM employees
WHERE months_between(sysdate,hire_date) > 250;
--------------------------------------------------------------

SELECT sysdate,to_char(sysdate,'Day Month year')
FROM dual;

SELECT employee_id,
TO_CHAR(hire_date, 'Dy/MM/YY') Month_Hired
FROM employees
WHERE last_name = 'Higgins';

SELECT last_name,
TO_CHAR(hire_date, 'fmDD Month YYYY')
AS HIREDATE,
TO_CHAR(hire_date, 'DD Month YYYY')
FROM employees;

SELECT last_name,
TO_CHAR(hire_date,'fmDdspth "of" Month YYYY fmHH12:MI:SS AM' ) hiredate
FROM employees;

SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

SELECT last_name,
UPPER(CONCAT(SUBSTR(last_name,1,8),'_US'))
AS "Last name"
FROM employees
WHERE department_id = 60;

SELECT TO_CHAR(next_day(add_months(hire_date,6),'friday'),
'fmDay,Month ddth,yyyy') "Next 6 Month Review"
FROM employees;

SELECT last_name, salary, commission_pct,
NVL(commission_pct,0) NVL_COMMISSION_PCT,
(salary*12) + (salary*12*NVL(commission_pct,0)) AN_SAL
FROM employees;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct, 'SAL+COM', 'SAL') AS INCOME
FROM employees
WHERE department_id IN (50, 80);

SELECT last_name, salary, commission_pct,
NVL2(commission_pct, salary*commission_pct , salary) AS INCOME
FROM employees
WHERE department_id IN (50, 80);

SELECT first_name, LENGTH(first_name) "expr1",
last_name, LENGTH(last_name) "expr2",
NULLIF(LENGTH(first_name), LENGTH(last_name)) "result"
FROM employees;

SELECT last_name, manager_id, commission_pct,
COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
'No commission and No manager') AS EXPRESSION
FROM employees;

SELECT last_name,salary,commission_pct,COALESCE(salary*commission_pct+salary,salary+2000) "New Salary"
FROM employees;

SELECT last_name, job_id, salary,
    TO_CHAR(CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
        WHEN 'ST_CLERK' THEN 1.15*salary
        WHEN 'SA_REP' THEN 1.20*salary
        ELSE salary
    END,'$99,999.99') AS "REVISED SALARY"
FROM employees;


SELECT last_name,salary,
    CASE  WHEN salary < 5000 THEN 'LOW'
        WHEN salary < 10000 THEN 'Medium'
        WHEN salary < 20000 THEn 'Good'
    END qualified_salary
FROM employees;

--DECODE ??????????? 1 ???
SELECT last_name, job_id, salary,
    DECODE( job_id, 'IT_PROG' , 1.10*salary
                    , 'ST_CLERK' , 1.15*salary
                    ,'SA_REP' ,1.20*salary
            , salary) AS "REVISED SALARY"
FROM employees;