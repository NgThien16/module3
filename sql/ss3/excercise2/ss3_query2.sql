use ss3_shop_management;

#1. Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select oID,oDate,oToTalPrice from `order`;

#2. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cName AS CustomerName, p.pName AS ProductName
FROM customer c
JOIN `order` o ON c.cID = o.cID
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
ORDER BY c.cName;


#3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cName
FROM customer c
LEFT JOIN `order` o ON c.cID = o.cID
WHERE o.oID IS NULL;

#4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM `order` o
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;
