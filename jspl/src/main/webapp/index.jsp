<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            font-size: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
        }
        img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
        }
        h1 { text-align: center; }
    </style>
</head>
<body>

<h1>Danh sách khách hàng</h1>

<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="c" items="${customers}">
        <tr>
            <td>${c.getName}</td>
            <td>${c.getBirthday}</td>
            <td>${c.getAddress}</td>
            <td>${c.getImage}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
