create database ss2_exercise2;
USE ss2_exercise2;
create table customer(
cID int primary key auto_increment,
cName varchar(50),
cAge int
);
create table product(
pID int primary key auto_increment,
pName varchar(50),
pPrice int
);
create table order_detail(
oID int,
pID int,
odQTY varchar(50),
primary key(oID,pID),
foreign key(oID) references orders(oID),
foreign key(pID) references product(pID)
);
create table orders(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice double,
foreign key(cID) references customer(cID)
);
