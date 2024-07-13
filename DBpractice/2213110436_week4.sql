--2213110436 Chittaworn
--1
SELECT employee_id,start_date,end_date,add_months(end_date,3) "3 Month after end date",
        next_day(start_date,'monday') "Next monday",last_day(end_date) "Last day",
        months_between(end_date,start_date) "Month work"
FROM job_history
WHERE months_between(end_date,start_date) > 40;

--2
SELECT department_name,LENGTH(department_name) length
FROM departments
WHERE (department_name LIKE 'A%' OR
        department_name LIKE 'I%') AND
        department_name NOT LIKE '%c%';

--3
SELECT employee_id,last_name,salary,salary*1.155 "Salary with bonus"
FROM employees;

--4
SELECT SUBSTR(job_id,1,4) ||'. '|| job_title info
FROM jobs;

--5
SELECT job_id,employee_id,TRUNC((end_date-start_date)/7) weeks
FROM job_history
WHERE job_id LIKE 'A%'
ORDER BY 3 desc;
        