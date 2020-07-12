<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="beans.Database"%>
<%@page import="myshop.CommonMethods"%>
<html>
	<head>
	  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>My Shop</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
	<body>
<%
String user=request.getParameter("user");
%>
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
<%
	 out.print("<br><br><center><h1>Hello "+user+"</h1></center>");
%>
<form action="payment.jsp?user=<%=user%>" method="post">
	<center>
	
	<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
	<tr><td><Label for="shippingaddress">Address</Label></td>
		<td><textarea rows="2" cols="20" name="shippingaddress" placeholder="Enter your Shipping Address" ></textarea><br></td></tr>
		</table>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

<tr><td>Select Payment Mode<br/></td></tr>
<tr><td><input type="radio" name="payment" value="cash">Cash On Delivery<br></td></tr>
<tr><td><input type="radio" name="payment" value="credit">Debit/Credit Card<br></td></tr>
<tr><td><input type="radio" name="payment" value="netbanking">Net Banking<br></td></tr>
	<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</center>
	</form>
	</body>
</html>