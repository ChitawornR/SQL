DECLARE
    v_fname varchar2(20);
BEGIN
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' 
                        || v_fname);
END;
/
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER;
    f NUMBER(5,2);
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Value of c: ' || c);
    f := 70.0/3.0;
    DBMS_OUTPUT.PUT_LINE('Value of f: ' || f);
END;
/
--Procedure
CREATE OR REPLACE procedure abc1
is
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER;
    f NUMBER(5,2);
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Value of c: ' || c);
    f := 70.0/3.0;
    DBMS_OUTPUT.PUT_LINE('Value of f: ' || f);
END;
/
exec abc1;

--******************************************--
create or replace procedure abc2 (r number)
as
-- constant declaration
    pi CONSTANT NUMBER := 3.141592654;
-- other declarations
    radius NUMBER(5,2) := r; 
    dia NUMBER(5,2); 
    circumference NUMBER(7, 2); 
    area NUMBER(10, 2);
BEGIN 
-- processing
    --radius := 9.5; 
    dia := radius * 2; 
    circumference := 2.0 * pi * radius;
    area := pi * radius * radius; 
-- output
    dbms_output.put_line('Radius: ' || radius);
    dbms_output.put_line('Diameter: ' || dia);
    dbms_output.put_line('Circumference: ' || circumference);
    dbms_output.put_line('Area: ' || area);
END;
/
exec abc2(10);
--******************************************--

create or replace procedure abc3 (pro VARCHAR,qty number,pr number)
as
    product varchar(15) := pro ;
    quantity number(3) := qty;
    price number(8,2) := pr;
    total number := quantity * price;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Product : '|| product);
    DBMS_OUTPUT.PUT_LINE('Quatity : '|| quantity);
    DBMS_OUTPUT.PUT_LINE('Price : '|| price);
    DBMS_OUTPUT.PUT_LINE('Total : '|| total);
END; 
/
exec abc3('&product',&quantity,&price);

DECLARE 
    v_hire_date employees.hire_date%type;
    v_salary  employees.salary%type;
BEGIN 
    SELECT hire_date,salary into v_hire_date,v_salary
    FROM employees
    WHERE employee_id = 100;
    dbms_output.put_line('Hire Date= '||v_hire_date);
    dbms_output.put_line('Salary= '||to_char(v_salary,'99,999.99'));
END;
/

DECLARE
    v_sum employees.salary%type;
BEGIN
    select sum(salary) into v_sum
    FROM employees
    WHERE department_id = 60
    group by department_id;
    dbms_output.put_line('The sum of salary is '||to_char(v_sum,'999,999.99'));
END;
/

DECLARE
    M_FIRST_NAME employees.first_name%type;
    M_LAST_NAME employees.last_name%type;
    M_SALARY employees.salary%type;
BEGIN
    SELECT FIRST_NAME,LAST_NAME,SALARY INTO M_FIRST_NAME,
            M_LAST_NAME,M_SALARY
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID=999;
    DBMS_OUTPUT.PUT_LINE('NAME IS '||M_FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('LAST NAME IS ' ||M_LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY IS ' ||M_SALARY);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('INVALID EMPLOYEE ID');
END;
/

--DECLARE
--  c_id customers.id%type := 8;
--  c_name customers.name%type;
--  c_addr customers.address%type;
--BEGIN
--  SELECT name, address INTO c_name, c_addr
--  FROM customers WHERE id = c_id;
--  DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
--  DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
--EXCEPTION
--  when no_data_found then
--  dbms_output.put_line('NO such customer');
--END;
--/

DECLARE
    v_lname employees.last_name%TYPE;
BEGIN
    SELECT last_name INTO v_lname
    FROM employees
    WHERE first_name='John'; 
    DBMS_OUTPUT.PUT_LINE ('John''s last name is :'
                        ||v_lname);
EXCEPTION
    when too_many_rows then
    dbms_output.put_line('retrieve multiple rows');
END;
/

DECLARE
    v_num1 number := &sv_num1;
    v_num2 number := &sv_num2;
    v_result number;
BEGIN
    v_result := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE ('v_result: '|| v_result);
EXCEPTION
    when zero_divide then
    dbms_output.put_line('A number cannot be divide by zero.');
END;
/