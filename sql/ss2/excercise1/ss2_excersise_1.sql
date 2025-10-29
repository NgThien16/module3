create database ss2_excersice1;
use ss2_excersice1;

create table supplier(
id int primary key auto_increment,
name varchar(50),
address varchar(50)
);
create table phone(
phone_number varchar(20),
supplier_id int,
foreign key(supplier_id) references supplier(id)
);
create table orders(
order_number int primary key,
order_date date,
supplier_id int,
foreign key(supplier_id) references supplier(id)
);
create table imports(
import_number int primary key,
import_date date
);
create table supplies(
supplie_code varchar(20) primary key,
supplie_name varchar(50)
);
create table import_info(
import_number int,
supplie_code varchar(20),
quantity int,
cost int,
primary key(import_number,supplie_code),
foreign key(import_number) references imports(import_number),
foreign key(supplie_code) references supplies(supplie_code)
);
create table exports(
export_number varchar(20) primary key,
export_date date
);
create table export_info(
export_number varchar(20),
supplie_code varchar(20),
quantity int,
cost int,
primary key(export_number,supplie_code),
foreign key(export_number) references exports(export_number),
foreign key(supplie_code) references supplies(supplie_code)
);
CREATE TABLE order_info (
    order_number INT,
    supplie_code VARCHAR(20),
    quantity INT,
    cost INT,
    PRIMARY KEY(order_number, supplie_code),
    FOREIGN KEY(order_number) REFERENCES orders(order_number),
    FOREIGN KEY(supplie_code) REFERENCES supplies(supplie_code)
);
