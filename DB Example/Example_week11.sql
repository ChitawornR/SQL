CREATE VIEW emp80
AS SELECT employee_id, last_name,salary
    FROM employees
    WHERE department_id = 80;
desc emp80;
select * from emp80;

CREATE VIEW empit
as SELECT employee_id, last_name, job_title
    FROM employees e JOIN JOBS j
    ON e.job_id = j.job_id
    AND j.job_id = 'IT_PROG';
desc empit;

CREATE VIEW sal50
AS SELECT employee_id ID_NUMBER,
        last_name ,
        salary*12 ANN_SALARY
    FROM employees
    WHERE department_id = 50;
select * from sal50;

--????????????????? column ??? () ???
CREATE VIEW dept_view ("Dep No","Dep Name","Emp Name")
as select d.department_id, department_name, first_name
    FROM employees e JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.department_id = 100;
select * from DEPT_view;

--??????????????????
CREATE OR REPLACE VIEW emp80
(id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' 
            || last_name, salary, department_id
    FROM employees
    WHERE department_id = 80;
desc emp80;

CREATE OR REPLACE VIEW empit
(code,"Name",social,"Job Name")
as SELECT employee_id,first_name||last_name, salary*0.03||' BAHT',job_title
    FROM employees e JOIN JOBS j
    ON e.job_id = j.job_id
    WHERE j.job_id IN ('PU_CLERK','ST_CLERK');
SELECT * FROM empit;

CREATE OR REPLACE VIEW dept_sum_vu
(name, minsal, maxsal, avgsal)
AS SELECT department_name, MIN(salary), 
            MAX(salary),round(AVG(salary),2)
    FROM employees e,departments d
    WHERE e.department_id = d.department_id
    GROUP BY department_name;
select * from dept_sum_vu;

CREATE OR REPLACE VIEW job_view
("JOB NAME",avgsal,"TOTAL SAL")
as SELECT job_title, to_char(avg(salary),'999,999.99'), to_char(sum(salary),'999,999.99')
    FROM employees e JOIN jobs j
    ON e.job_id = j.job_id
    AND substr(job_title,1,1) IN ('P','S')
    GROUP BY job_title
    HAVING sum(salary) > 10000;
    
drop view dept_sum_vu;
drop view dept_view;
drop view emp80;
drop view empit;
drop view job_view;
drop view sal50;

CREATE SEQUENCE dept_deptid_seq
        INCREMENT BY 10
        START WITH 400
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

INSERT INTO departments(department_id, 
department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL, 
'Support', 2500);

INSERT INTO departments(department_id, 
department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL, 
'HR', 1400);
SELECT dept_deptid_seq.CURRVAL FROM dual;

ALTER SEQUENCE dept_deptid_seq
        INCREMENT BY 20
        MAXVALUE 999999
        NOCACHE
        NOCYCLE;
        
INSERT INTO departments(department_id, 
department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL, 
'Engineer', 1800);
DROP SEQUENCE dept_deptid_seq;

delete departments
where department_id IN (400,410,430);