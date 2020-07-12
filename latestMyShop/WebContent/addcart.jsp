<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="beans.Database"%>
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
<%
	Database db=new Database();
	ResultSet rst=null;
	int id=Integer.parseInt(request.getParameter("id"));
	rst=db.runSelectQuery("select * from products where productid="+id);
	rst.next();
	String record[]=new String[7];
	record[0]=rst.getString(1);
	record[1]=rst.getString(2);
	record[2]=rst.getString(4);
	record[3]=rst.getString(7);
	record[4]=rst.getString(6);
	record[5]="1";
	record[6]=rst.getString(4);
	Vector<String[]> v1=(Vector)session.getAttribute("cart");
	if(v1==null)
		v1=new Vector<String[]>();
	boolean flag=false;
	for(int i=0;i<v1.size();i++)
	{
		String t[]=(String [])v1.get(i);
		if(t[0].equals(record[0]))
		{
			t[5]=Integer.parseInt(t[5])+1+"";
			t[6]=Integer.parseInt(t[5])*Integer.parseInt(t[2])+"";
			v1.set(i,t);
			flag=true;
			break;
		}
	}
	if(flag==false)
		v1.addElement(record);
	session.setAttribute("cart",v1);
%>
<jsp:include page="index.jsp"></jsp:include>

</body>
</html>