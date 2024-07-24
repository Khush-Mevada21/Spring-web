<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart</title>
</head>
<body>

	<%
		List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
		Float price = 0.0f;
	%>
	
	<a href="userproducts">Products</a>
	<br><br>
	<table border="1">
	
		<tr>
			<th>ProductId</th>
			<th>ProductName</th>
			<th>Image</th>
			<th>price</th>
			<th>Qty</th>
			<th>Action</th>
		</tr>
		
		<%
			for (EProductBean p : products){
				out.print("<tr>");
				out.print("<td>" + p.getProductId() + "</td><td>" + p.getProductName() + "</td>");
				out.print("<td><img src='"+p.getProductImagePath()+"' height='100px' width='100px'/></td>");
				out.print("<td>"+p.getPrice()+"</td>");
				out.print("<td>"+p.getQty()+"</td>");
				out.print("<td> <a href='removecartitem?productId="+p.getProductId()+"'> REMOVE </a></td>");
				out.print("</tr>");
				
				price = price + p.getPrice();
				
			}
		%>
		
	</table>
	<br>
	Total Price : <%=price%>
	
	<br><br>
	<a href="checkout">checkout</a>
	

</body>
</html>