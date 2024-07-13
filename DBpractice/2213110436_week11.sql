--2213110436 chittaworn
--1
CREATE OR REPLACE VIEW dep_loc
as SELECT d.department_id,department_name,street_address,city,country_name
    FROM departments d,locations l,countries c
    WHERE d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND department_name Like '%e'
    order by 1 desc;
select * from dep_loc;

--2
CREATE OR REPLACE VIEW J2
as SELECT employee_id,last_name,job_title,to_char(max_salary,'$999,999.99') MAX_SAL
    FROM employees e,jobs j
    WHERE e.job_id = j.job_id
    AND max_salary > (SELECT avg(max_salary)
                        FROM jobs)
    AND job_title LIKE '%Manager';

--3
CREATE SEQUENCE j_id_seq
        INCREMENT BY 10
        START WITH 1000
        MAXVALUE 3000
        NOCACHE
        NOCYCLE;

--4
CREATE TABLE job3
(
j_id number(4) primary KEY,
job_name varchar(20) not null
);

INSERT INTO job3
VALUES (j_id_seq.NEXTVAL ,'Technician');

INSERT INTO job3
VALUES (j_id_seq.NEXTVAL ,'Engineer');

INSERT INTO job3
VALUES (j_id_seq.NEXTVAL ,'Statistician');

--5
CREATE OR REPLACE VIEW CCOUNT
as SELECT c.country_id,count(*) "Number of Location" 
    FROM locations l,countries c
    WHERE l.country_id=c.country_id
    AND c.country_name Like '%a'
    GROUP BY c.country_id
    order by 2 desc;
    
--6
CREATE OR REPLACE VIEW hist
(last_name,"Days of work",sd,ed)
as SELECT last_name, to_char(end_date-start_date,'99,999') ||' days',
        to_char(start_date,'fmDay dd Mon YYYY'),to_char(end_date,'fmDay dd Mon YYYY')
    FROM employees e,job_history j
    WHERE e.employee_id = j.employee_id
    AND to_char(end_date,'Mon') IN ('Jun','Dec')
    order by to_char(end_date-start_date,'99,999') desc;
select * from hist;