<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecom SignUp</title>
</head>
<body>

<form action="esignup" method="post" enctype="multipart/form-data">

	FirstName : <input type="text" name="firstName"/><br><br>
	Email : <input type="text" name="email"/><br><br>
	Password : <input type="password" name="password"/><br><br>
	Profile : <input type="file" name="profileImage"/><br><br>
	
	<input type="Submit" value="Submit">

</form>

</body>
</html>