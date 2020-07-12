<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<%@ page import="beans.Database"%>
<%@ page import="myshop.CommonMethods"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		</head>
	<body>
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  	<%
	String s1= request.getParameter("mail");
	String s2= request.getParameter("query");
	Database db=new Database();
	ResultSet rst1;
	rst1=db.runSelectQuery("select max(id) from inbox");
	rst1.next();
	int id=rst1.getInt(1);
	id++;
	db.runOtherQuery("insert into inbox(mail_id,query,id) values('"+s1+"','"+s2+"',"+id+")");
	db.close();
%>
<%--<jsp:include page="mail.jsp?mode=query&email="+s1+"&query="+s2></jsp:include>--%>
	<br>
	<br>
	<center><h1>Your query has been sent to My Shop</h1><br /><br/>
	<h1>Soon you will be going to get a response from our executive.</h1><br /><br/>
	<h4>Your query/complaint number is <%=id%>.</h4>
	</br></br>
	<h1><a href="index.jsp">Home Page</a></h1></center>
	</body>
</html>