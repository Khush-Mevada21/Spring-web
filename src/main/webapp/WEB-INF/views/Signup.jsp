<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>signup Page</title>
</head>
<body>

	<h2>Signup Jsp</h2>

	<form action="saveUser" method="post">
	
		FirstName :<input type="text" name="firstName"><br><br>
		Email :<input type="text" name="email"/><br><br>
		Password :<input type="password" name="password"/><br><br>
		
		<input type="Submit" value="Signup"/>
	</form>	
</body>
</html>