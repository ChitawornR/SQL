----------------- CREATE TABLES ------------------
CREATE TABLE department
(
dep_id number(2) PRIMARY KEY,
dep_name varchar(30)not null
);

CREATE TABLE employee
(
emp_id number(3),
dep_id number(2),
emp_fname VARCHAR(30) not null,
emp_lname VARCHAR(30) not null,
salary number(8,2) not null,
hire_date date default sysdate not null,
PRIMARY KEY(emp_id,dep_id),
FOREIGN KEY(dep_id) REFERENCES department(dep_id)
);

CREATE TABLE project
(
proj_id VARCHAR(5) PRIMARY KEY CHECK(proj_id like 'PO-__'),
proj_name VARCHAR(30) not null,
start_date date not null,
end_date date not null
);

CREATE TABLE assignment
(
assign_num VARCHAR(7),
assign_name VARCHAR(30) not null,
proj_id VARCHAR(5) not null,
emp_id number(3) not null,
dep_id number(2) not null,
assign_hour number(4) not null,
PRIMARY KEY(assign_num),
FOREIGN key(emp_id,dep_id) REFERENCES employee(emp_id,dep_id),
FOREIGN key(proj_id) REFERENCES project(proj_id)
);

CREATE TABLE address
(
add_id VARCHAR(4) PRIMARY KEY,
add_country VARCHAR(30) not null,
add_city VARCHAR(30) not null
);

CREATE TABLE customer
(
cus_id number(13),
cus_title VARCHAR(3) not null,
cus_fname VARCHAR(50) not null,
cus_lname VARCHAR(50) not null,
gender varchar(6) not null,
email VARCHAR(50),
add_id VARCHAR(4),
PRIMARY key(cus_id),
FOREIGN key(add_id) REFERENCES address(add_id)
);

CREATE TABLE location
(
latitude DECIMAL,
longitude DECIMAL,
stress VARCHAR(50),
country VARCHAR(30) not null,
postalcode number(5) not null,
PRIMARY key(latitude,longitude)
);

CREATE TABLE factory
(
fac_id VARCHAR(7) CHECK(fac_id like '___-___'),
fac_name VARCHAR(50) not null,
latitude DECIMAL,
longitude DECIMAL,
PRIMARY KEY(fac_id,latitude,longitude),
FOREIGN key(latitude,longitude) REFERENCES location(latitude,longitude)
);

CREATE TABLE maintenance
(
m_id number(3) PRIMARY key,
m_type VARCHAR(30) not null,
description VARCHAR(200),
cost decimal not null
);

CREATE TABLE MAINTENANCE_SCHEDULE
(
fac_id VARCHAR(7),
latitude DECIMAL,
longitude DECIMAL,
m_id number(3),
status VARCHAR(20),
scheduled_date date not null,
PRIMARY key(fac_id,m_id,latitude,longitude),
FOREIGN key(fac_id,latitude,longitude) REFERENCES factory(fac_id,latitude,longitude),
FOREIGN key(m_id) REFERENCES maintenance(m_id)
);

CREATE TABLE product
(
p_id VARCHAR(5) PRIMARY key check(p_id like 'P-___'),
p_name VARCHAR(50) not null,
p_type VARCHAR(30) not null,
unit_price decimal not null
);

CREATE TABLE receipt
(
rec_id VARCHAR(8) check(rec_id like 'REC-____'),
p_id VARCHAR(5),
fac_id VARCHAR(7),
latitude DECIMAL,
longitude DECIMAL,
quantity number not null,
FOREIGN key(p_id) REFERENCES product(p_id),
FOREIGN key(fac_id,latitude,longitude) REFERENCES factory(fac_id,latitude,longitude)
);

CREATE TABLE orders
(
order_id VARCHAR(10),
p_id VARCHAR(5),
emp_id number(3),
dep_id number(2),
cus_id number(13),
quantity number not null,
order_date date not null,
PRIMARY KEY(order_id,p_id,emp_id,dep_id,cus_id),
FOREIGN key(p_id) REFERENCES product(p_id),
FOREIGN key(emp_id,dep_id) REFERENCES employee(emp_id,dep_id),
FOREIGN key(cus_id) REFERENCES customer(cus_id)
);

CREATE TABLE invoice
(
invoice_id VARCHAR(10),
order_id VARCHAR(10),
P_id VARCHAR(5),
emp_id number(3),
dep_id number(2),
cus_id number(13),
invoice_date date default sysdate not null,
total DECIMAL not null,
PRIMARY key(invoice_id,order_id,P_id,emp_id,dep_id,cus_id),
FOREIGN key(order_id,P_id,emp_id,dep_id,cus_id) REFERENCES orders(order_id,P_id,emp_id,dep_id,cus_id)
);

----------------- INSERT VALUES ------------------


