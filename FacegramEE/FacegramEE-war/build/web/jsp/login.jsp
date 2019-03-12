<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Banco</title>
</head>
<body>

	<h1>Introduzca datos de acceso</h1>
	<form action="login" method="post">
		<input type="text" name="dni" maxlength="9" placeholder="DNI: 11222333L"><br>
		<input type="password" name="pin" maxlength="4" placeholder="PIN: 1234"><br>
		<input type="submit" value="Login">
	</form>
	<p style="color:red;">${error}</p>
</body>
</html>