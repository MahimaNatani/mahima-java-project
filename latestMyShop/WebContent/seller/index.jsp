<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
		<form action="logincheck.jsp?mode=login" method="post">
			<input type="text" name="user" placeholder="Enter Email"/><br />
			<input type="password" name="pass" placeholder="Enter Password"/><br />
			<input type="submit" name="login" value="Login" />
			<a href="forgotpass.jsp">Forgot Password</a><br />
			<a href="signup.jsp">New User Sign In</a>
			

		</form>

</body>
</html>