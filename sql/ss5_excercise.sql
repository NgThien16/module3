create database ss5_excercise;
use ss5_excercise;
#tạo bảng 
create table Product(
id int primary key auto_increment,
productCode varchar(20),
productName varchar(50),
productPrice double,
productAmount int, 
productDescription varchar(50),
productStatus varchar(20)
);
#insert data
INSERT INTO Product (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001', 'Laptop ASUS Vivobook 15', 15990000, 10, 'Laptop học tập và làm việc, màn hình 15.6 inch', 'Available'),
('P002', 'iPhone 15 Pro Max', 28990000, 5, 'Điện thoại cao cấp Apple, chip A17 Pro', 'Available'),
('P003', 'Tai nghe Sony WH-1000XM5', 8990000, 15, 'Tai nghe chống ồn cao cấp, pin 30 giờ', 'Available'),
('P004', 'Chuột Logitech MX Master 3S', 2290000, 20, 'Chuột không dây chuyên dụng cho dân văn phòng', 'Available'),
('P005', 'Màn hình Samsung 27 inch 2K', 7490000, 8, 'Màn hình IPS, tần số quét 75Hz, độ phân giải 2K', 'Out of Stock');

#tạo index
create unique index idx_productCode on Product(productCode);

#tạo composite
create index idx_name_price on  Product(productName, productPrice);

#so sanh truy van
explain select* from Product where productCode ='P003';

#View
# create
create view view_product as 
select productCode, productName, productPrice, productStatus
from Product;
#check
select*from view_product;
#edit
create or replace view view_product as 
select productCode, productName, productPrice, productStatus, productAmount
from Product;
#delete
drop view view_product;

#Store Procedures
#get all product
