--2213110436 chitaworn
--1
create table cashier
(
e_id number(5) primary key,
e_name varchar(25),
e_tel varchar(10)
);

create table product
(
p_id number(4) primary key,
p_name varchar(25),
p_price number(5)
);

create table customer
(
c_id number(6) primary key,
name varchar(25),
tel varchar(10),
email varchar(30)
);

create table ordered
(
ord_id number(10),
c_id number(6),
e_id number(5),
p_id number(4),
day_ordered date default sysdate,

PRIMARY key(ord_id,e_id,p_id),
foreign key(c_id) REFERENCES customer(c_id),
foreign key(p_id) REFERENCES product(p_id),
foreign key(e_id) REFERENCES cashier(e_id)
);

--2
create SEQUENCE cashier_eid_sequence
    INCREMENT by 10
    start with 10000
    maxvalue 99999
    NOCACHE
    NOCYCLE;

create SEQUENCE product_pid_sequence
    INCREMENT by 1
    start with 1000
    maxvalue 9999
    NOCACHE
    NOCYCLE;

create SEQUENCE customer_cid_sequence
    INCREMENT by 10
    start with 100000
    maxvalue 999999
    NOCACHE
    NOCYCLE;

create SEQUENCE ordered_ord_id_sequence
    INCREMENT by 10
    start with 1000000000
    maxvalue 9999999999
    NOCACHE
    NOCYCLE;

--3
create or replace procedure insert_cashier(e_name varchar,e_tel varchar)
as
    ename cashier.e_name%type := e_name;
    etel cashier.e_tel%type := e_tel;
begin
    insert into cashier
    values (cashier_eid_sequence.nextval,ename,etel);
end;
/
exec insert_cashier('Riew Eiei','0236547895');
exec insert_cashier('Phat Eiei','0236547894');
exec insert_cashier('Phoo Eiei','0236547893');


create or replace procedure insert_product(p_name varchar,p_price number)
as
    pname product.p_name%type := p_name;
    pprice product.p_price%type := p_price;
begin
    insert into product
    values (product_pid_sequence.nextval,pname,pprice);
end;
/
exec insert_product('pencil',2000);
exec insert_product('pen',1000);
exec insert_product('apple',3000);

create or replace procedure insert_customer(c_name varchar,tel varchar, email varchar)
as
    Cemail customer.email%type := email;
    Cname customer.name%type := c_name;
    Ctel customer.tel%type := tel;
begin
    insert into customer
    values (CUSTOMER_CID_SEQUENCE.nextval,Cname,Ctel,Cemail);
end;
/
exec insert_customer('Chitaworn','0944364365','chitaworn@gmail.com');
exec insert_customer('Niraphat','0945465455','Niraphat@gmail.com');
exec insert_customer('Boss','0895665689','boss@gmail.com');


create or replace procedure insert_ordered(cidr number,eidr number,pidr number, date_order date)
as
    c_idr ordered.c_id%type := cidr;
    e_idr ordered.e_id%type := eidr;
    p_idr ordered.p_id%type := pidr;
    ord_date ordered.day_ordered%type := date_order;
begin
    insert into ordered
    values (ORDERED_ORD_ID_SEQUENCE.nextval,c_idr,e_idr,p_idr,ord_date);
end;
/
exec insert_ordered(100000,10000,1000,'17-Dec-2023');
exec insert_ordered(100010,10010,1001,'22-May-2003');
exec insert_ordered(100020,10020,1002,'15-Feb-2022');

--4
create or replace procedure update_product(pro_id number,p_price number)
as
    pid product.p_id%type := pro_id;
    pprice product.p_price%type := p_price;
begin
    update product
    set p_price = pprice
    where p_id = pid;
    
end;
/
exec update_product(1000,2500);


create or replace procedure update_cashier(ch_id number,e_tel varchar)
as
    eid cashier.e_id%type := ch_id;
    etel cashier.e_tel%type := e_tel;
begin
    update cashier
    set e_tel = etel
    where e_id = eid;
end;
/
exec update_cashier(10000,'0999999999');


--5
create or replace procedure update_customer(c_name varchar,c_tel varchar)
as
    cname customer.name%type := upper(c_name);
    ctel customer.tel%type := c_tel;
begin
    update customer
    set tel = ctel
    where upper(name) = cname;
end;
/
exec update_customer('&customer_name','&new_phone_number');