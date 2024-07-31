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
    .cart-table {
        width: 100%;
        margin-top: 20px;
    }
    .cart-table th, .cart-table td {
        text-align: center;
        vertical-align: middle;
    }
    .cart-table img {
        max-width: 100px;
        max-height: 100px;
    }
    .cart-total {
        font-size: 1.5em;
        font-weight: bold;
    }
    .cart-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }
    .cart-actions a {
        margin-right: 10px;
    }
    .cart-actions_2 {
        align-items: right;
        align: right;
        margin-top: 20px;
    }
    
</style>
</head>
<body class="container">

    <div class="cart-actions">
        <a href="userproducts" class="btn btn-primary">Continue Shopping</a>
        <h1>My Cart</h1>
    </div>

    <%
        List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
        Float price = 0.0f;
    %>

    <table class="table table-bordered cart-table">
        <thead class="thead-dark">
            <tr>
                <th>Cart ID</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>Item Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (EProductBean p : products) {
                    out.print("<tr>");
                    out.print("<td>" + p.getCartId() + "</td>");
                    out.print("<td>" + p.getProductId() + "</td>");
                    out.print("<td>" + p.getProductName() + "</td>");
                    out.print("<td><img src='" + p.getProductImagePath() + "' /></td>");
                    out.print("<td>Rs." + p.getPrice() + "</td>");
                    out.print("<td>");
                    out.print("<a href='decreaseQty?productId=" + p.getProductId() + "' class='btn btn-danger btn-sm'>-</a>");
                    out.print(" " + p.getQty() + " ");
                    out.print("<a href='increaseQty?productId=" + p.getProductId() + "' class='btn btn-success btn-sm'>+</a>");
                    out.print("</td>");
                    out.print("<td>Rs." + (p.getQty() * p.getPrice()) + "</td>");
                    out.print("<td><a href='removecartitem?productId=" + p.getProductId() + "' class='btn btn-danger'>Remove</a></td>");
                    out.print("</tr>");
                    price += p.getQty() * p.getPrice();
                }
                session.setAttribute("totalPrice", price);
            %>
        </tbody>
    </table>

    <div class="cart-total text-right">
        Total Price: Rs.<%=price%>
    </div>
	
	<div class="cart-actions_2" align="right">
        <a href="checkout" class="btn btn-success">Checkout</a>
    </div>
	
</body>

</html>