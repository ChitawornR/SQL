--2213110436 Chittaworn
--1
SELECT location_id, city||', '||STATE_PROVINCE||', '||
        STREET_ADDRESS||', '||POSTAL_CODE "Address Info"
FROM LOCATIONS
WHERE location_id > &location_id
ORDER BY 1 desc;

--2
SELECT manager_id, employee_id, &column, salary, commission_pct
FROM employees
WHERE manager_id = &manager_id AND commission_pct IS NOT NULL
ORDER BY 2 desc;

--3
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%'
ORDER BY 1 desc;

--4
SELECT last_name,salary,employee_id,job_id
FROM employees
WHERE job_id LIKE 'FI%' AND salary NOT BETWEEN 7000 and 8500
ORDER BY 3;

--5
SELECT CONCAT(first_name||' ',last_name) name,employee_id,
        job_id,email||'@tni.ac.th'
FROM employees
WHERE manager_id IS NULL;