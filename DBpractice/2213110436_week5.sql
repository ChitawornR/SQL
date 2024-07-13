--2213110436 Chittaworn
--1
SELECT last_name,
        'Earn '||TO_CHAR(salary,'999,999.99')||' Baht.' salary,
        'Dream salary: '||TO_CHAR(salary*1.5,'999,999.99') "Dream salary"
FROM employees;

--2
SELECT job_id,employee_id,TO_CHAR(start_date,'fmDay ddth Month yyyy') "Start date"
                ,TO_CHAR(LAST_DAY(ADD_MONTHS(start_date,10)),'fmDay ddth Month yyyy') "Expected deadline"
FROM job_history;

--3
SELECT employee_id,first_name||' '||last_name name,
    CASE job_id WHEN 'AD_PRES' THEN 'President'
        WHEN 'AD_VP' THEN 'Vice President'
        WHEN 'AD_ASST' THEN 'Assistant'
        WHEN 'IT_PROG' THEN 'Important empolyee'
        ELSE 'Normal employee'
    END status
FROM employees;

SELECT employee_id,first_name||' '||last_name name,
    DECODE(job_id , 'AD_PRES' , 'President'
        , 'AD_VP' , 'Vice President'
        , 'AD_ASST' , 'Assistant'
        , 'IT_PROG' , 'Important empolyee'
        , 'Normal employee'
    ) status
FROM employees;

--4
SELECT commission_pct, COUNT(commission_pct) "Commission statistic"
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY commission_pct;

