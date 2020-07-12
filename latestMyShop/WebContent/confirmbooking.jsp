<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="beans.Database,beans.Pendingorders"%>
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
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>

<br>
<br>
		<h1><center>Your order is Confirmed</center></h1><br />
		<h2><center>Order will be delivered within 5 days.</center></h2><br />
		<h1><center>Thank You for shopping with us.</center></h1>
		<br>
		<br>
		<center><h1><a href="index.jsp">Home Page</a></h1></center>
	</body>
</html>