create database ss3_shop_management;
USE ss3_shop_management;


CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(25),
    cAge TINYINT
);
CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);
CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(25),
    pPrice INT
);
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
INSERT INTO Customer VALUES 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

-- Order
INSERT INTO `Order` VALUES 
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 3, '2006-03-16', NULL);

-- Product
INSERT INTO Product VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

-- OrderDetail
INSERT INTO OrderDetail VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 4),
(3, 3, 3);

