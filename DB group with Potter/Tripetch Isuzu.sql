--2213110436 Chittaworn Khirieksathit
--2213110451 Natrin Tongvishit

CREATE TABLE project
(
proj_num char(7) PRIMARY KEY check(proj_num like '___-___'),
proj_name varchar(50) not null
);

CREATE TABLE department
(
dept_id varchar(5) PRIMARY KEY,
dept_name varchar(30)not null
);

create table employee
(
emp_id number(10),
dept_id varchar(5),
empFirstName varchar(20) not null,
empLastName varchar(20) not null,
salary number(8,2) not null,
hireDate date default sysdate not null,
gender char(1),
commission_pct number(3,2) default 0 not null,
email varchar(30) not null,
job_id varchar(10),
chg_hour number(4) check(chg_hour between 0 and 1000) not null,
job_name varchar(40) not null,
primary key(emp_id,dept_id),
FOREIGN key(dept_id) REFERENCES department(dept_id)
);

create table assignment
(
assign_num Char(5) primary key,
assign_name varchar(25) not null,
assign_date date default sysdate not null,
assign_hours number(3) not null,
submit_date date not null,
proj_num char(7),
emp_id number(10),
dept_id varchar(5),
foreign key(proj_num) REFERENCES project(proj_num),
foreign key(emp_id,dept_id) REFERENCES employee(emp_id,dept_id)
);

CREATE TABLE service_center
(
service_code char(7) primary key check(service_code like '___-___'),
service_center_name varchar(40) not null,
service_phone char(10) not null,
service_email varchar(30) not null,
country varchar(15) not null,
region varchar(5) not null
);

create table operational_unit
(
service_code char(7) ,
dept_id varchar(5),
oper_phone char(10) check(oper_phone between '0' and '9'),
oper_email varchar(30) not null,
postal_code char(5) check(postal_code between '0' and '9') not null,
district varchar(20) not null,
primary key(service_code,dept_id),
foreign key(service_code) references service_center(service_code),
foreign key(dept_id) references department(dept_id)
);

create table customer
(
id_card char(13) primary key check(id_card between '0' and '9'),
firstName varchar(20) not null,
lastName varchar(20) not null,
dob date
);

create table car
(
car_id VARCHAR(5) primary key,
model varchar(10) not null,
year number(4),
color varchar(15) default 'White',
price number(9,2) not null,
engine_type varchar(25) not null,
fuel_type varchar(10) not null
);

create table contract
(
contractID char(12),
service_code char(7),
id_card char(13),
car_id varchar(5),
netPrice number(9,2) not null,
pickUpDate date not null,
payMonthly number(8,2) not null,
primary key(contractID,service_code,id_card,car_id),
foreign key(service_code) references service_center(service_code),
foreign key(id_card) references customer(id_card),
foreign key(car_id) references car(car_id)
);

create table supplier
(
sub_id char(4) primary key,
address varchar(70) not null,
email varchar(30) not null,
sub_name varchar(30) not null
);

create table reciept
(
rec_id varchar(10),
car_id varchar(5),
sub_id char(4),
rec_date date default sysdate not null,
quantity number(3) not null,
primary key(rec_id,car_id,sub_id),
foreign key(car_id) references car(car_id),
foreign key(sub_id) references supplier(sub_id)
);

-----------------------------Insert-----------------------------
--insert data into project table 10 row
insert into project
values ('PBS-201','Apex Legends');
insert into project
values ('LOL-102','League Of Legends');
insert into project
values ('HON-103','Heroes of Newerth');
insert into project
values ('VAL-201','Valorant');
insert into project
values ('CRS-101','Crystalborne New Hero Introduction');
insert into project
values ('TUR-808','Turbocharging Efficiency');
insert into project
values ('ROV-101','Transmission System Upgrade');
insert into project
values ('AVA-505','AutoMatrix Vehicle Automation and Control');
insert into project
values ('MOT-303','Motorcycle Engine Innovation');
insert into project
values ('FUE-101','Eco-friendly Fuel Solutions');


--insert data into department table 10 row
insert into department
values ('IT','Information Technology');
insert into department
values ('MKT','Marketing');
insert into department
values ('HR','Human Resources');
insert into department
values ('R'||'&'||'D','Research and Development');
insert into department
values ('EN','Engineer');
insert into department
values ('RM','Risk Management');
insert into department
values ('FD','Finance');
insert into department
values ('PD','Product Development');
insert into department
values ('EC','Environmental Compliance');
insert into department
values ('CR','Customer Relations');


--insert data into employee table 10 row
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,email,job_id,chg_hour,job_name)
values (2213110436,'IT','Tomas','Koko',25000,'12-Dec-1999','M','ko.Tomas@gmail.com','IT_SUP',80,'IT Support');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,email,job_id,chg_hour,job_name)
values (2213110987,'IT','Harry','Potter',28000,'13-Dec-2000','M','po.Harry@gmail.com','IT_PROG',100,'IT Programmer');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,email,job_id,chg_hour,job_name)
values (2213110456,'MKT','Phat','Nirapai',25400,'12-May-1999','M','ni.phat@gmail.com','MKT_SA',80,'Marketing Sale');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,commission_pct,email,job_id,chg_hour,job_name)
values (2213110667,'MKT','Totti','Thanakit',33200,'25-Sep-1999','F',0.05,'th.thanakit@gmail.com','MKT_AD',90,'Marketing Advt');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,commission_pct,email,job_id,chg_hour,job_name)
values (2213110451,'IT','Boss','Rakchart',18000,'15-Dec-1999','M',0.50,'ra.boss@gmail.com','IT_PROG',100,'IT Programmer');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,gender,email,job_id,chg_hour,job_name)
values (2213119807,'IT','Malee','Suaimak',20000,'M','su.malee@gmail.com','IT_PROG',100,'IT Programmer');
insert into employee(emp_id,dept_id,empFirstName,empLastName,salary,hireDate,gender,commission_pct,email,job_id,chg_hour,job_name)
values (2213110871,'MKT','Linda','Susanto',27500,'18-Jan-1999','F',0.15,'su.linda@gmail.com','MKT_AD',90,'Marketing Advt');
insert into employee
values (2213119081,'MKT','Jing','Ackerman',19780,'28-Jun-2000','M',0.12,'ac.jing@gmail.com','MKT_SA',80,'Marketing Sale');
insert into employee
values (2213114321,'IT','Lisa','Panompen',23500,'01-Feb-2011','F',0.2,'pa.Lisa@gmail.com','IT_PROG',100,'IT Programmer');
insert into employee
values (2213114999,'R'||'&'||'D','Riew','Chittuy',17000,'22-Jan-2005','M',0.3,'ch.Riew@gmail.com','R'||'&'||'D_SCIENT',120,'Research And Development Scientist');


--insert data into assignment table 10 row
insert into assignment(assign_num,assign_name,assign_hours,submit_date,proj_num,emp_id,dept_id)
values ('99999','Web Deverlop',84,'12-Jun-2024','PBS-201',2213110436,'IT');
insert into assignment
values ('35462','Web Deverlop','10-Sep-2023',60,'12-Jun-2024','PBS-201',2213110987,'IT');
insert into assignment
values ('35468','Marketing planning','15-Dec-2023',23,'12-Jun-2024','PBS-201',2213110456,'MKT');
insert into assignment
values ('22134','Promoting environmental','15-Dec-2023',76,'12-Jun-2024','PBS-201',2213110667,'MKT');
insert into assignment
values ('44532','Customer service develop','29-Nov-2023',60,'15-Mar-2024','LOL-102',2213110451,'IT');
insert into assignment
values ('44535','Front end website','29-Nov-2023',60,'15-Mar-2024','LOL-102',2213110436,'IT');
insert into assignment
values ('23423','Program car navigation','18-May-2023',36,'30-Oct-2023','AVA-505',2213119807,'IT');
insert into assignment
values ('63463','Car commercial','02-Oct-2023',50,'23-Feb-2024','HON-103',2213110871,'MKT');
insert into assignment
values ('38845','Car commercial','02-Oct-2023',40,'23-Feb-2024','HON-103',2213119081,'MKT');
insert into assignment
values ('63453','Website security','08-Jul-2023',50,'30-Jul-2023','VAL-201',2213114321,'IT');


--insert data into service_center table 10 row
insert into service_center
values('BKK-001','Tripetch Isuzu Bangkok1','0982747383','bkk001@isuzu.ac.th','Thailand','SEA');
insert into service_center
values('BKK-002','Tripetch Isuzu Bangkok2','0283746526','bkk002@isuzu.ac.th','Thailand','SEA');
insert into service_center
values('BKK-003','Tripetch Isuzu Bangkok3','0123746359','bkk003@isuzu.ac.th','Thailand','SEA');
insert into service_center
values('NKP-001','Tripetch Isuzu Nakhon Phanom','0897653748','npk001@isuzu.ac.th','Thailand','SEA');
insert into service_center
values('TOK-001','Tripetch Isuzu Tokyo1','0382746726','tok001@isuzu.ac.th','Japan','EA');
insert into service_center
values('TOK-002','Tripetch Isuzu Tokyo2','0887646376','tok002@isuzu.ac.th','Japan','EA');
insert into service_center
values('MEL-001','Tripetch Isuzu Melbourne1','0998754678','mel001@isuzu.ac.th','Australia','AUS');
insert into service_center
values('PEK-002','Tripetch Isuzu Beijing2','0738647652','pek002@isuzu.ac.th','China','EA');
insert into service_center
values('PAR-001','Tripetch Isuzu Paris1','0988987651','par001@isuzu.ac.th','France','EU');
insert into service_center
values('NDL-004','Tripetch Isuzu Newdeli4','0998877665','ndl004@isuzu.ac.th','India','ASIA');


--insert data into operational_unit table 10 row
insert into operational_unit
values ('BKK-001','IT','0234534567','bkk001.it@gmail.com','10510','Minburi');
insert into operational_unit
values ('BKK-001','MKT','0255345677','bkk001.mar@gmail.com','10510','Minburi');
insert into operational_unit
values ('BKK-002','HR','0231452456','bkk002.hr@gmail.com','10530','Lard Gra Bang');
insert into operational_unit
values ('BKK-002','R'||'&'||'D','0211234564','bkk002.rd@gmail.com','10530','Lard Gra Bang');
insert into operational_unit
values ('TOK-001','IT','0231233224','tok001.it@gmail.com','10000','Tokyo');
insert into operational_unit
values ('TOK-001','MKT','0256754322','tok001.mar@gmail.com','10000','Tokyo');
insert into operational_unit
values ('TOK-001','HR','0233441234','tok001.hr@gmail.com','10000','Tokyo');
insert into operational_unit
values ('TOK-001','R'||'&'||'D','0213441513','tok001.rd@gmail.com','10000','Tokyo');
insert into operational_unit
values ('PEK-002','IT','0211233412','pek002.it@gmail.com','30000','Tianjin');
insert into operational_unit
values ('PEK-002','HR','0298798633','pek001.hr@gmail.com','30000','Tianjin');


--insert data into customer table 10 row
insert into customer
values ('1123456789012','Alexander','Jupiter','26-May-2003');
insert into customer
values ('1112345678903','Ben','Benjamin','14-Dec-2000');
insert into customer
values ('1129012345678','David','Erdon','25-May-2000');
insert into customer
values ('1289012345678','Ethan','Lele','14-Sep-1999');
insert into customer
values ('1145235256247','Gabriel','Prialmai','12-Mar-2000');
insert into customer
values ('1344412453456','Henry','Haward','18-Aug-1998');
insert into customer
values ('1192538461254','Riew','Olaf','24-Jun-2003');
insert into customer
values ('1142343525667','Boss','Rakchart','4-Aug-1997');
insert into customer
values ('1231231231233','Muhammud','Moodee','15-Aug-1998');
insert into customer
values ('1232221231323','Hanuel','lee','31-May-2000');


--insert data into car table 10 row
insert into car
values ('BM001','BMW-I',2001,'Crimson',900000,'V6','gasoline');
insert into car
values ('BM002','BMW-M',2004,'Black',980000,'Inline-4','gasoline');
insert into car
values ('BM003','BMW-M',2004,'Midnight Purple',980000,'Turbo-Diesel Inline-4','diesel');
insert into car
values ('BM004','BMW-Z4',2010,'Bronze',1300000,'Turbo-Diesel Inline-4','diesel');
insert into car
values ('T001','YARIS',2016,'Ruby Red',700000,'V12','diesel');
insert into car
values ('T002','FORTUNER',2020,'Silver',1000000,'V4','gasoline');
insert into car
values ('H001','CIVIC',2023,'Black',900000,'V-SPEC','diesel');
insert into car
values ('H002','CITY',2020,'Teal',770000,'Inline-4','gasoline');
insert into car
values ('H003','HRV',2018,'Navy Blue',900000,'V-SPEC','diesel');
insert into car
values ('H004','WR-V',2019,'Silver',900000,'V4','gasoline');


--insert data into contract table 10 row
insert into contract
values ('ABC223456982','BKK-001','1192538461254','BM001',1000000,'24-Jun-2023',27000);
insert into contract
values ('CCA876578234','BKK-001','1192538461254','H001',800000,'23-Jun-2023',22000);
insert into contract
values ('FRC651123908','TOK-001','1123456789012','BM001',1001000,'26-Jun-2023',27800);
insert into contract
values ('ERC387748598','TOK-001','1112345678903','H003',950000,'25-May-2023',26000);
insert into contract
values ('GTS266376485','TOK-001','1129012345678','T002',900000,'12-July-2023',25000);
insert into contract
values ('TTY277384950','TOK-001','1289012345678','T002',990000,'17-Jan-2024',20000);
insert into contract
values ('IOP222998764','PEK-002','1145235256247','H003',920000,'18-Dec-2023',15000);
insert into contract
values ('HGY288374602','PEK-002','1344412453456','H001',800000,'22-Sep-2023',22000);
insert into contract
values ('ACN098772845','PEK-002','1192538461254','BM001',1100000,'24July-2023',22000);
insert into contract
values ('QRY244251243','PEK-002','1142343525667','BM002', 1200000,'29-May-2023',20000);


--insert data into supplier table 10 row
insert into supplier
values ('JP01','Sato Hiroshi,3-7-2 Shibuya,Shibuya-ku,Tokyo','jam_jp01@gmail.com','Japan auto move');
insert into supplier
values ('JP02','Tanaka Yuki,2-14-6 Namba,Chuo-ku,Osaka','apc_jp02@gmail.com','AutoPartConnect Co Ltd.');
insert into supplier
values ('JP03','Yamamoto Aiko,1-25-9 Gion,Higashiyama-ku,Kyoto','pac_jp03@gmail.com','PrecisionAuto Components');
insert into supplier
values ('VN01','Nguyen Minh Tuan,25 Tran Hung Dao Street,Hoan Kiem,Hanoi','vt_vn01@gmail.com','Vietnam transport');
insert into supplier
values ('VN02','Le Thi Lan Anh,72 Nguyen Hue Boulevard,District 1,Ho Chi Minh City','csg_vn02@gmail.com','CarPart Solutions Group');
insert into supplier
values ('VN03','Pham Quang Huy,15 Vo Nguyen Giap Street,Ngu Hanh Son,Da Nang','vtc_vn03@gmail.com','VehicleTech Components');
insert into supplier
values ('CN01','Li Wei,123 Wangfujing Street,Dongcheng,Beijing','cat_cn01@gmail.com','China automotive TS');
insert into supplier
values ('CN02','Zhang Xin,456 Nanjing Road,Huangpu,Shanghai','dsl_cn02@gmail.com','DriveLine Systems Ltd.');
insert into supplier
values ('CN03','Chen Mei,789 Beijing Road,Yuexiu,Guangzhou','aec_cn03@gmail.com','AutoPart Excellence Corp');
insert into supplier
values ('CN04','Wang Peng,321 Tianfu Avenue,Wuhou,Chengdu','gvc_cn04@gmail.com','Global Vehicle Components');


--insert data into reciept table 10 row
insert into reciept(rec_id,car_id,sub_id,quantity)
values ('Q123439RR5','BM001','JP01',10);
insert into reciept
values ('GT324U849L','BM002','JP01','12-Jan-2023',20);
insert into reciept
values ('JU784E0RE9','BM003','JP01','21-Dec-2022',30);
insert into reciept
values ('FSD58WE9FS','BM004','JP01','02-May-2023',40);
insert into reciept
values ('345EH9549G','T001','VN01','14-Mar-2023',10);
insert into reciept
values ('4KG849WHK4','T002','VN01','18-Oct-2022',20);
insert into reciept
values ('9845UJGORL','H001','CN01','27-Nov-2022',30);
insert into reciept
values ('3457HH5345','H002','CN01','05-Sep-2021',40);
insert into reciept
values ('RE46L4654H','H003','CN01','13-Jun-2020',10);
insert into reciept
values ('96IKH94034','H004','CN01','28-Feb-2020',20);









