SELECT employee_id, last_name
FROM employees
WHERE salary IN (SELECT min(salary)
                FROM employees
                GROUP BY department_id);
                
SELECT last_name,salary,department_id
FROM employees
WHERE salary IN (SELECT min(salary)
                FROM employees
                GROUP BY department_id);
                
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE last_name LIKE '%u%');

SELECT employee_id, last_name, job_id,salary
FROM employees
WHERE salary < any (SELECT salary
                    FROM employees
                    WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT first_name||' '||last_name fullname, to_char(salary,'99,999') salary,j.job_id,job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE salary > (SELECT avg(salary)
                    FROM employees)
AND job_title NOT LIKE '%t%';
--------------------------------------------------------------------------------------------------------
--DDL
CREATE TABLE customer
(
cust_no number(5) PRIMARY KEY,
name char(20) not null,
address varchar2(40) not null,
dob date,
id_card_no number(13) unique,
cust_type char(1) check (cust_type IN ('A','B','C'))
);

CREATE TABLE order1
(
ord_no number(5) primary key,
ord_date date default sysdate not null,
amount number(9,2) not null,
cust_no number(5) REFERENCES customer(cust_no) 
);

CREATE TABLE suppliers
(
supplier_id number(4) primary key,
supp_name varchar2(20) not null,
address varchar2(40) not null
);

--cerate with subquery
CREATE TABLE dept80
AS SELECT employee_id, last_name, 
    salary,hire_date
    FROM employees
    WHERE department_id = 80;
desc dept80;

SELECT *
FROM dept80;

CREATE TABLE sales_reps
AS SELECT employee_id id, first_name name, salary, commission_pct commission
    FROM employees
    WHERE job_id = 'SA_REP';
    
SELECT * 
FROM sales_reps;

ALTER TABLE dept80
add(fname char(30));

ALTER TABLE dept80
MODIFY last_name varchar(30);

ALTER TABLE dept80
drop column fname;

desc sales_reps;
ALTER TABLE sales_reps
add constraint sale_id_pk primary key(id);