<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Product</title>
</head>
<body>

	<h3>Delete Product By Name</h3>

	<%
		List<EProductBean> productname = (List<EProductBean>) request.getAttribute("productname");	
	%>
	<form action='deleteproductbyname?productName="+p.getProductName()+"' method="get">
		Enter Product Name : <input type="text" name="productName"/><br><br>
	
		<input type="submit" value="Delete Product">
	</form>	

</body>
</html>