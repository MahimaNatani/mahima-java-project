<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<%
	HttpSession session=request.getSession(false);
	if(session == null || session.getAttribute("adminid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	session.removeAttribute("adminid");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
</body>
</html>