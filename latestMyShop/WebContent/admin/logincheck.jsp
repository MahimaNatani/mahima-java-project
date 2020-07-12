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
<jsp:useBean id="db" class="beans.Database"></jsp:useBean>
<%
String btn = request.getParameter("login");
if(btn!=null){
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	ResultSet rst = db.runSelectQuery("select * from users where user='"+user+"' and pass='"+pass+"'");
	if(rst.next()){
		db.close();
		HttpSession session =  request.getSession(true);
		session.setAttribute("adminid", user);
		response.sendRedirect("dashboard.jsp");
		return;
	}
	db.close();
}
%>
</body>
</html>