<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="discount" method="post">
  <p>Product Description</p>
  <input type="text" placeholder="description" name="description">
  <p>List Price</p><input type="text" name="listPrice">
  <p>Discount Percent</p><input type="text" name="discountPercent">
  <button>Calculate Discount</button>
  <h2>Discount Amount: ${discountAmount}</h2>
</form>
</body>
</html>