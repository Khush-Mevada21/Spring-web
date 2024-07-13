<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EcomHome</title>
</head>
<body>

	<h2>EcomHome</h2>
	
	<h3>
	Welcome, ${user.firstName}
	</h3>
	
	<img alt="" src="${user.profileImagePath}" height="300px" width="300px">
	<br>
	<br>

	<a href="userproducts">Products</a>
</body>
</html>