--2213110436 chittaworn

--1
CREATE TABLE emp2
(
e_id number(3),
fname varchar(50),
j_title varchar(30),
m_id number(3)
);

--2
INSERT INTO emp2
SELECT employee_id, first_name, job_title, manager_id
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE e.manager_id IN (SELECT employee_id
                        FROM employees
                        WHERE last_name = 'King');

--3
CREATE TABLE manager
(
m_id number(3),
m_fname varchar(20),
salary number(6)
)

--4
INSERT INTO manager
SELECT employee_id, first_name||' '||last_name m_fname, salary
FROM employees
WHERE employee_id IN (SELECT manager_id
                    FROM employees
                    WHERE manager_id IS NOT NULL)
order by 1;
desc manager;

--5
ALTER TABLE manager
MODIFY m_fname varchar(50);

--6
ALTER TABLE emp2
add constraint my_E_ID_pk primary key(e_id);
desc emp2;

--7
ALTER TABLE manager
add constraint my_M_ID_pk primary key(m_id);
desc manager;

--8
ALTER TABLE emp2
add constraint my_Man_M_ID_fk FOREIGN key(m_id) REFERENCES manager(m_id);

--9
ALTER TABLE emp2
add(dep_id char(2) check(SUBSTR(dep_id,1,1) BETWEEN 'A' AND 'Z') 
                    check(SUBSTR(dep_id,2,1) BETWEEN 'A' AND 'Z'));
