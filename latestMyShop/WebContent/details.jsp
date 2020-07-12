<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="beans.Database"%>
<%@ page import="myshop.CommonMethods"%>
<!DOCTYPE html>
<html>
<head>
<title>My Shop</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
	<%
		int menu=1;
	%>
	<%@ include file="header.jsp" %>
<h1>Product Details</h1>


<%
	int id=Integer.parseInt(request.getParameter("id"));
	Database db=new Database();
	ResultSet rst=null;
	
	rst=db.runSelectQuery("select * from products where productid="+id);
	rst.next();
%>
	<table border="1">
		<tr>
			<td>Product Name</td>
			<td><%=rst.getString(2)%></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><%=rst.getInt(4)%></td>
		</tr>
		<tr>
			<td>Details</td>
			<td><%=rst.getString(5)%></td>
		</tr>
		<tr>
			<td>Stock Available</td>
			<td><%=rst.getInt(6)%></td>
		</tr>
		<tr>
			<td>Image</td>
			<td><img src="<%="/myshop/itemimages/"+rst.getString(7)%>" /></td>
		</tr>
	</table>
	<a href="index.jsp">Go Back</a>
</body>
</html>