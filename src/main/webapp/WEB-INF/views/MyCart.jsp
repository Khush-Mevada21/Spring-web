<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" 
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
      crossorigin="anonymous">
<style>

</style>
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
			<th>CartId</th>
			<th>ProductId</th>
			<th>ProductName</th>
			<th>Image</th>
			<th>Item Price</th>
			<th>Qty</th>
			<!--  <th>Decrease Qty</th>  -->
			<th>Total Price</th>
			<th>Action</th>
			
		</tr>
		
		<%
			for (EProductBean p : products){
				out.print("<tr>");
				out.print("<td>" + p.getCartId() + "</td>");
				out.print("<td>" + p.getProductId() + "</td><td>" + p.getProductName() + "</td>");
				out.print("<td><img src='"+p.getProductImagePath()+"' height='100px' width='100px'/></td>");
				out.print("<td>"+p.getPrice()+"</td>");
				out.print("<td>"+p.getQty()+"</td>");
			    //out.print("<td> <a href='decreaseqty?productId="+p.getProductId()+"&qty="+p.getQty()+"'> DECREASE </a></td>");
				out.print("<td>"+p.getQty()*p.getPrice()+"</td>");
				out.print("<td> <a href='removecartitem?productId="+p.getProductId()+"'> REMOVE </a></td>");
				out.print("</tr>");
				
				price = price + p.getPrice();
				
			}
		    session.setAttribute("totalPrice", price);
		%>
		
	</table>
	<br>
	Total Price : <%=price%>
	
	<br><br>
	<a href="checkout">checkout</a>
	
	
	

</body>
</html>