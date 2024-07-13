CREATE TABLE depts
( 
dept_id number(10) not null, 
dept_name varchar2(50) not null,

PRIMARY KEY(dept_id) 
);

ALTER TABLE depts RENAME TO department;

CREATE TABLE emps
( 
employee_number number(10) not null, 
employee_name varchar2(50) not null, 
dept_id number(10), 

PRIMARY KEY(employee_number) 
);
ALTER TABLE emps
add bonus number(8,2) not null;
desc emps;

ALTER TABLE emps
MODIFY employee_name varchar(75);

ALTER TABLE emps
drop column bonus;

desc department;
ALTER TABLE department
RENAME column dept_name TO department_name;

-------------------------(DML[INSERT, UPDATE, DELETE])---------------------------------

DELETE departments
where department_id IN (31,111);

INSERT INTO departments(department_id,department_name)
VALUES (31,'Purshasing');

INSERT INTO departments
VALUES (111,'Finance',NULL,NULL);

DELETE departments
where department_id = 280;

INSERT INTO departments(department_id,department_name,location_id)
VALUES (&department_id,'&department_name',&location_id);

CREATE TABLE CONTACTS
(
ID number(2) primary key,
name varchar(20) not null,
age number(2),
address varchar(30) not null,
salary number(7,2)
);
INSERT INTO contacts
values (1,'Ramesh',35,'Ahmedabad',2000.00);
INSERT INTO contacts
values (2,'Khilan',25,'Delhi',1500.00);
INSERT INTO contacts
values (3,'Kaushik',23,'Kota',2000.00);
INSERT INTO contacts
values (4,'Chaitali',25,'Mumbai',6500.00);
INSERT INTO contacts
values (5,'Hardik',27,'Bhopal',8500.00);
INSERT INTO contacts
values (6,'Komal',22,'MP',4500.00);
INSERT INTO contacts
values (7,'Muffy',24,'Indore',10000.00);
select * from contacts;

INSERT INTO department
    SELECT department_id, department_name
    FROM departments
    WHERE manager_id IS NOT NULL;
    
select * from department;
desc department;

CREATE TABLE contacts_bkp
as  SELECT *
    FROM contacts;
    
SELECT * 
FROM contacts
WHERE id in (select id
            from contacts_bkp
            WHERE salary>4500);
            
UPDATE employees
set phone_number = (select phone_number
                    FROM employees
                    WHERE employee_id = 205),
    salary = (select salary
                FROM employees
                WHERE employee_id = 205)
where employee_id = 113;

select phone_number,salary
FROM employees
WHERE employee_id = 113;

rollback; --#???????????

UPDATE contacts
set salary = salary*1.25
WHERE age in (SELECT age
            FROM contacts_bkp
            WHERE age >=27 );

DELETE contacts
WHERE age in (SELECT age
            FROM contacts_bkp
            WHERE age >=27 );
select * from contacts;

