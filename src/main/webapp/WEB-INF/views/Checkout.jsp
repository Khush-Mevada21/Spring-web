<%@page import="java.util.List"%>
<%@page import="com.bean.EProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" 
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
      crossorigin="anonymous">
<style>
    .checkout-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
    }
    .checkout-title {
        margin-bottom: 30px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .btn-pay {
        width: 100%;
    }
</style>
</head>
<body>
	
	<div class="checkout-container">
    <h2 class="checkout-title text-center">Checkout</h2>
    <form action="processPayment" method="post">
        <div class="form-group">
            <label for="finalAmount">Final Amount:</label>
            <input type="text" class="form-control" id="finalAmount" name="finalAmount" value="${totalPrice}" readonly>
        </div>
        <div class="form-group">
            <label for="creditCardNum">Credit Card:</label>
            <input type="text" class="form-control" id="creditCardNum" name="creditCardNum" placeholder="Enter your credit card number" required>
        </div>
        <div class="form-group">
            <label for="expiryDate">Expiry Date:</label>
            <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
        </div>
        <div class="form-group">
            <label for="cvv">CVV:</label>
            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="Enter CVV" required>
        </div>
        <button type="submit" class="btn btn-primary btn-pay">Pay</button>
    </form>
</div>

</body>
</html>