<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>My Shop</title>
	</head>
	<body>
		<jsp:useBean class="beans.Check" id="c1"></jsp:useBean>
<%
		String s1= request.getParameter("user");
		String s2= request.getParameter("pass");
		String s3= request.getParameter("repass");
		String s4= request.getParameter("email");
		String s5= request.getParameter("contact");
		String s6= request.getParameter("address");
		String s7= request.getParameter("pincode");
		if(s2.equals(s3))
		{
			c1.add(s1,s2,s4,s5,s6,s7);
		}
		else
		{
			out.print("password not match ");
		}
		response.sendRedirect("login.jsp");
		//<jsp:include page="mail.jsp?mode=newaccount&email="+s4+"&pass="+s2></jsp:include>
%>
	</body>
</html>