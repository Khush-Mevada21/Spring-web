<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecom Product List</title>
</head>
<body>

	<h2>Product List</h2>
	
	<a href="newproduct">New Product</a><br><br>
	
	<a href="deleteproductname">Delete Product By Name</a> <br><br>
	
	<%
		List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
	%>
	
	
	<table border="1">
	
		<tr>
			<th>ProductId</th>
			<th>ProductName</th>
			<th>Action</th>
		</tr>
		
		<%
			for (EProductBean p : products){
				out.print("<tr>");
				out.print("<td>" + p.getProductId() + "</td><td>" + p.getProductName() + "</td><td> <a href='deleteproduct?productId="+p.getProductId()+"'> DELETE </a> | <a href='viewproduct?productId="+p.getProductId()+"'> VIEW </a></td> ");
				out.print("</tr>");
				
			}
		%>
		
	</table>
	
</body>
</html>