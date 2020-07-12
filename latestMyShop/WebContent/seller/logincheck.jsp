<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="s1" class="beans.Seller"></jsp:useBean>
<%
	
	String mode = request.getParameter("mode");
	if(mode.equals("login")){
%>
		<jsp:setProperty property="user" name="s1" param="user"/>
		<jsp:setProperty property="pass" name="s1" param="pass"/>
		
<%
		if(s1.validate()){
			HttpSession session =  request.getSession();
			session.setAttribute("sellerid",s1.getSellerId(request.getParameter("user")));
			response.sendRedirect("dashboard.jsp");
		}
	}
	else if(mode.equals("signin")){
%>
	<jsp:setProperty property="user" name="s1" param="user"/>
	<jsp:setProperty property="pass" name="s1" param="pass"/>
	<jsp:setProperty property="email" name="s1" param="email"/>
	<jsp:setProperty property="contact" name="s1" param="contact"/>
	<jsp:setProperty property="address" name="s1" param="add"/>
	<jsp:setProperty property="pincode" name="s1" param="pincode"/>
	<jsp:setProperty property="shopname" name="s1" param="shop"/>
	<jsp:setProperty property="gstnumber" name="s1" param="gstno"/>
<%
		if(s1.save()==1){
			out.print("<script>alert('Data Submitted Successfully')</script>");
			response.sendRedirect("index.jsp");
		}
	}
%>
</body>
</html>