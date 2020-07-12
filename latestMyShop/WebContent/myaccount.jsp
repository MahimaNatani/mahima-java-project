<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
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

<title>My Shop</title>
</head>
<body>
	<%
		int menu=3;
	%>
	<%@ include file="header.jsp" %>
<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

	<form action="openaccount.jsp?mode=check" method="post" name="form1">

	   <tr>
	    <td>User name</td>
	    <td><input type="text" name="user" /></td>
	   </tr>
	   <tr>
	    <td>Password</td>
	    <td><input type="password" name="pass" /></td>
	   </tr>
	   <tr>
	    <td><input type="submit" value="login" onclick="return validation()"  /></td>
		<td><input type="Reset" value="Reset" onclick="return validation()"  /></td>
	</form>
</table>
</center>
<center>
	<form action="openaccount.jsp?mode=signup" method="post">
	    <td><input type="submit" value="register" rows=30 /></td>
	   </tr>
	</form>
	 </br>
	<form action="forgotpass.jsp" method="post">
	   <input type="submit" value="Forgot Password" rows=30 />
	</form>
</body>
</html>
