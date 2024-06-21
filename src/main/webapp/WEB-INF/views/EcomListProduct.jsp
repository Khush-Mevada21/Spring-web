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
	
	<%
		List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
	%>
	
	<table border="1">
	
		<tr>
			<th>ProductId</th>
			<th>ProductName</th>
			<th>Category</th>
			<th>Price</th>
			<th>Qty</th>
			<th>Action</th>
		</tr>
		
		<%
			for (EProductBean p : products){
				out.print("<tr>");
				out.print("<td>" + p.getProductId() + "</td><td>" + p.getProductName() + "</td><td>" + 
								p.getCategory() + "</td><td>" + p.getPrice() + "</td><td>" + p.getQty() + "</td><td> <a href='deleteproduct?productId="+p.getProductId()+"'>DELETE</a> ");
				out.print("</tr>");
				
			}
		%>
		
	</table>
	
</body>
</html>