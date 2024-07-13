--2213110436 chittaworn
--1
CREATE TABLE vendor
(
v_id number(5) primary KEY,
first_name varchar(30) not null,
last_name VARCHAR(30) not null,
update_date date default sysdate,
email varchar(50)
);

CREATE TABLE Item
(
ite_id number(4) primary key,
ite_name varchar(30) not null,
price number(7,2) not null,
price_vat number(7,2)
);

CREATE TABLE log_history
(
ite_id number(4) REFERENCES item(ite_id),
v_id number(5) REFERENCES vendor(v_id),
transac varchar(3) check(transac IN ('IN','OUT')),
price_vat number(7,2),
update_date date default sysdate,

primary key(ite_id,v_id)
);

--2
INSERT INTO vendor(V_ID,first_name,last_name)
values (&V_ID,'&first_name','&last_name');
SELECT * FROM vendor;
/*
10001	Boy	Prajan	23-AUG-23	
10002	Yaku	Nomprial	23-AUG-23	
10003	Riew	Eiei	23-AUG-23
10004	Potter	KUKU	23-AUG-23
10005	Niraphat	Lala	23-AUG-23	
*/
INSERT INTO item
values (&ITE_ID,'&ITE_name',&price,null);
SELECT * FROM item;
/*
2001	Banana	2000	
2002	Apple	1000	
2003	Melon	5500	
2004	orange	6000	
2005	mango	3000	
*/
INSERT INTO log_history(ITE_ID,V_ID,transac)
values (&ITE_ID,&V_ID,'&transac');
SELECT * FROM log_history;
/*
2001	10001	IN	23-AUG-23	
2002	10002	IN	23-AUG-23
2003	10003	OUT	23-AUG-23
2004	10004	IN	23-AUG-23
2005	10005	OUT	23-AUG-23
*/

--3
UPDATE item
set price_vat = price*1.07;

--4
UPDATE vendor
set email = substr(last_name,1,2)||'.'||first_name||'@vend.ac.th';

--5
CREATE TABLE contact_vendor
as SELECT ite_name,email,transac,l.update_date,
    CASE WHEN transac = 'IN' THEN sysdate-100
    ELSE sysdate END "Date_transac"
    FROM vendor v JOIN log_history l
    ON v.v_id = l.v_id
    JOIN item i
    ON l.ite_id = i.ite_id;
select * from contact_vendor;
