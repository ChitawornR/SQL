--2213110436 chittaworn
--1
DECLARE
    dep_id departments.department_id%type;
    dep_name departments.department_name%type;
    v_avg employees.salary%type;
BEGIN
    select d.department_id,department_name,avg(salary) 
    into dep_id,dep_name,v_avg
    FROM employees e,departments d
    WHERE e.department_id = d.department_id
    AND d.department_id = 50
    group by d.department_id,department_name;
    dbms_output.put_line('Department ID : '|| dep_id);
    dbms_output.put_line('Department Name : '|| dep_name);
    dbms_output.put_line('Average salary in this department is  '|| v_avg);
END;
/

create or replace procedure practice1
as
    dep_id departments.department_id%type;
    dep_name departments.department_name%type;
    v_avg employees.salary%type;
BEGIN
    select d.department_id,department_name,avg(salary) 
    into dep_id,dep_name,v_avg
    FROM employees e,departments d
    WHERE e.department_id = d.department_id
    AND d.department_id = 50
    group by d.department_id,department_name;
    dbms_output.put_line('Department ID : '|| dep_id);
    dbms_output.put_line('Department Name : '|| dep_name);
    dbms_output.put_line('Average salary in this department is  '|| v_avg);
END;
/
exec practice1;

--2
DECLARE 
    emp_id employees.employee_id%type := &employee_id;
    emp_name varchar2(30);
    emp_salary employees.salary%type;
    emp_com employees.commission_pct%type;
BEGIN
    select employee_id,first_name||' '||last_name,salary,NVL(commission_pct,0)
    into emp_id,emp_name,emp_salary,emp_com
    from employees
    where employee_id = emp_id;
    emp_salary := (emp_salary + (emp_salary*emp_com)) *1.20;
    dbms_output.put_line('Emplyee ID : '|| emp_id);
    dbms_output.put_line('Name : '||emp_name);
    dbms_output.put_line('New salary : '||to_char(emp_salary,'999,999.99'));
END;
/

create or replace procedure practice2 (e number)
as
    emp_id employees.employee_id%type := e;
    emp_name varchar2(30);
    emp_salary employees.salary%type;
    emp_com employees.commission_pct%type;
BEGIN
    select employee_id,first_name||' '||last_name,salary,NVL(commission_pct,0)
    into emp_id,emp_name,emp_salary,emp_com
    from employees
    where employee_id = emp_id;
    emp_salary := (emp_salary + (emp_salary*emp_com)) *1.20;
    dbms_output.put_line('Emplyee ID : '|| emp_id);
    dbms_output.put_line('Name : '||emp_name);
    dbms_output.put_line('New salary : '||to_char(emp_salary,'999,999.99'));
END;
/
exec practice2(&employee_id)

--3
DECLARE
    pro_name varchar(20) := 'Supra Toyota';
    qty number(1) := 9;
    price_number constant number(4) := 3900;
    total number;
begin
    total := qty*price_number*1.07;
    dbms_output.put_line('Total : '||to_char(total,'999,999.99'));
END;
/

create or replace procedure practice3(n varchar,q number)
as
    pro_name varchar(20) := n;
    qty number(1) := q;
    price_number constant number(4) := 3900;
    total number;
begin
    total := qty*price_number*1.07;
    dbms_output.put_line('Total : '||to_char(total,'999,999.99'));
END;
/
exec practice3('asasd',9);