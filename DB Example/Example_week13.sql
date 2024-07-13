DECLARE
 e_hiredate DATE := '&Start_Date';
 e_firstname employees.first_name%TYPE;
 BEGIN
 DBMS_OUTPUT.PUT_LINE('Check the employee is start date');
 SELECT first_name INTO e_firstname
 FROM employees
 WHERE hire_date = e_hiredate;
 DBMS_OUTPUT.PUT_LINE('The employee is '||e_firstname);
 DBMS_OUTPUT.PUT_LINE('Employ on:'||e_hiredate);
 EXCEPTION
    when too_many_rows then
    DBMS_output.put_line('many person');
    when no_data_found then
    DBMS_output.put_line('employee is not employ');
END;
/

create or replace PROCEDURE sample1(j_id varchar)
as
    jid varchar(10) := j_id;
    jtitle varchar(20);
    min_salary number;
    max_salary number;
begin
    select job_title,min_salary,max_salary
    into jtitle,min_salary,max_salary
    from jobs
    where job_id = jid;
    DBMS_output.put_line('JOB_ID = '||jid);
    DBMS_output.put_line('JOB TITLE = '||jtitle);
    DBMS_output.put_line('MIN SALARY = '||to_char(min_salary,'99,999'));
    DBMS_output.put_line('MAX SALARY = '||to_char(max_salary,'999,999.99'));
end;
/
exec sample1('&job_id');

create table kob_bk
(
job_id varchar(6) primary key,
job_title varchar(20),
min_salary number(6),
max_salary number(6)
);

begin
insert into kob_bk
values ('EN_MGR','Engineer Manager',20000,60000);
insert into kob_bk
values ('COM_EN','Computesr Engineer',10000,25000);
insert into kob_bk
values ('INST','Instructor',5000,10000);
end;
/

declare 
    jid kob_bk.job_id%type;
    jtitle kob_bk.job_title%type;
begin
    update kob_bk
    set job_title = 'IT Instructor'
    where job_id = 'INST';
    
    select job_id, job_title
    into jid,jtitle
    from kob_bk
    where job_id = 'INST';
    DBMS_output.put_line('Job_id : '||jid);
    DBMS_output.put_line('New job Title is '||jtitle);
end;
/

create or replace procedure sample2(j varchar)
as
    jid kob_bk.job_id%type := j;
    jtitle kob_bk.job_title%type;
begin
    update kob_bk
    set job_title = 'IT Instructor'
    where job_id = jid;
    
    select job_title
    into jtitle
    from kob_bk
    where job_id = jid;
    DBMS_output.put_line('Job_id : '||jid);
    DBMS_output.put_line('New job Title is '||jtitle);
end;
/
exec sample2('&job_id');

begin
delete kob_bk
where job_id = 'INST';
DBMS_output.put_line('Record Delete...');
end;
/


--select first_name,salary
--from employees
--where department_id = 50
--and salary < 2500;

declare
    fname employees.first_name%type;
begin
    select first_name
    into fname
    from employees
    where employee_id = 206;
    DBMS_output.put_line(SQL%ROWCOUNT||' Record Retrived');
    
    update employees
    set salary = 3000
    where department_id = 50
    and salary < 2500;
    DBMS_output.put_line(SQL%ROWCOUNT||' Record Updated');
end;
/
--rollback;


declare 
    fname employees.first_name%type;
    sal employees.salary%type;
    rate number;
begin
    select first_name,salary
    into fname,sal
    from employees
    where employee_id = 190;
    
    
    if sal < 3000 then
        sal := sal*1.3;
        rate := 30;
    ELSE
        sal := sal*1.2;
        rate := 20;
    end if;
    DBMS_output.put_line('Employee name : '||fname);
    DBMS_output.put_line('New Salary is :'||sal);
    DBMS_output.put_line(rate||'% increasing');
end;
/

create or replace procedure sample3(g char)
as
    grade char := upper(g);
    str varchar(15);
begin
    case grade
    when 'A' then str:='Excellent';
    when 'B' then str:='Very Good';
    when 'C' then str:='Good';
    else str:= 'Nosuch grade';
    end case;
    DBMS_output.put_line('Grade: '||grade||' Appraisal '|| str);
end;
/
exec sample3('&C');


--LOOOOOPPPPPPP
DECLARE
    x number := 10;
BEGIN
    LOOP
    dbms_output.put_line(x);
    x := x + 10;
    exit WHEN x > 50;
    END LOOP;
 -- after exit, control resumes here
    dbms_output.put_line('After Exit x is: ' || x);
END;
/

declare 
    total number(4) := &n;
begin
    total := (total*(total+1))/2;
    dbms_output.put_line('=' || total);
end;
/

declare 
    totals number(4) := 0;
begin
    for x in 1..50 loop
    totals := totals+x;
    exit when x = 50;
    end loop;
    dbms_output.put_line('=' || totals);
end;
/


declare 
    num number := &enter_number;
    i number := 1;
begin
    loop
    dbms_output.put_line(num||' x ' ||i||' = '||num*i);
    i:=i+1;
    exit when i > 12;
    end loop;
end;
/


declare 
    num number := &enter_number;
    i number := 1;
begin
    while(i<13)loop
    dbms_output.put_line(num||' x ' ||i||' = '||num*i);
    i:=i+1;
    end loop;
end;
/

declare 
    num number := &enter_number;
--    i number := 1;
begin
    for i in 1..12 loop
    dbms_output.put_line(num||' x ' ||i||' = '||num*i);
--    i:=i+1;
--    exit when i = 12;
    end loop;
end;
/