<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>My Shop</title>
	</head>
	<body>
		<jsp:useBean class="beans.Forgotpass" id="c1"></jsp:useBean>
<%
		String s1= request.getParameter("user");
		String s2= request.getParameter("pass");
		c1.update1(s1,s2);
		response.sendRedirect("index.jsp");
		//<jsp:include page="mail.jsp?mode=newaccount&email="+s4+"&pass="+s2></jsp:include>
%>
	</body>
</html>