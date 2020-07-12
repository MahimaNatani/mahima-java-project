<%@page import="myshop.CommonMethods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body> 
<form action="logincheck.jsp" method="post">
	<input type="text" name="user" placeholder="Enter userid"/><br />
	<input type="password" name="pass" placeholder="Enter Password"/><br />
	<input type="submit" name="login" value="Login" /><br />
	<a href="forgotpass.jsp">Forgot Password</a>
</form>
</body>
</html>