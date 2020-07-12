<%@page import="beans.Database"%>
<%@page import="myshop.CommonMethods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form action="forgotpasscheck1.jsp" method="post" name="form1">
<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			<fieldset>
			<tr><td><Label for="name">Name</Label></td>
			<td><Input type="text" name="user" placeholder="Enter Username" /><br></td></tr>
			
			<tr><td><Label for="password">Password</Label></td>
			<td><Input type="password" name="pass" placeholder="Enter your new Password" /><br></td></tr>
			<tr><td><input type="submit" value="Submit" onclick="return validation()" /></td>
			<td><input type="reset" value="Reset" /></td></tr>
			</fieldset>
			</table>
</body>
</html>