<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="beans.Database"%>
<%@page import="myshop.CommonMethods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<script type="text/javascript">
			function validation()
			{
			
				if(document.forms.form1.user.value.trim()=="")
				{
					alert("Type your name");
					return false;
				}
				else if(document.forms.form1.pass.value=="")
				{
					alert("Type your password");
					return false;
				}
				else if(document.forms.form1.repass.value=="")
				{
					alert("ReType your password");
					return false;
				}
				else if(document.forms.form1.pass.value != document.forms.form1.repass.value)
				{
					alert("password & retype password mismatch");
					return false;
				}
				else if(document.forms.form1.email.value=="")
				{
					alert("Enter email ");
					return false;
				}
				if(isNaN(document.forms.form1.contact.value) || document.forms.form1.contact.value.trim()=="")
				{
					alert("Invalid contact");
					return false;
				}
				
				else if(document.forms.form1.address.value=="")
				{
					alert("Type address");
					return false;
				}
			}
		</script>
				

		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
	<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
</div>
	
		<form action="check.jsp" method="post" name="form1">
			<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			<fieldset>
			<tr><legend>Enter Your details</legend></tr>
			<tr><td><Label for="name">Name</Label></td>
			<td><Input type="text" name="user" placeholder="Enter Username" /><br></td></tr>
			
			<tr><td><Label for="password">Password</Label></td>
			<td><Input type="password" name="pass" placeholder="Enter Password" /><br></td></tr>

			<tr><td><Label for="Re password">Re Type Password</Label></td>
			<td><Input type="password" name="repass" placeholder="Re-enter Password" /><br></td></tr>
			
			<tr><td><Label for="email">Email</Label></td>
			<td><input type="email" name="email" placeholder="Enter Email-Id" /><br></td></tr>
			
			<tr><td><Label for="contact">Contact_no.</Label></td>
			<td><input type="text" name="contact" placeholder="Enter Contact Number" /><br></td></tr>
			
			<tr><td><Label for="address">Address</Label></td>
			<td><textarea rows="2" cols="20" name="address" placeholder="Enter Address" ></textarea><br></td></tr>
			
			<tr><td><Label for="pincode">pincode.</Label></td>
			<td><input type="text" name="pincode" placeholder="Enter pincode" /><br></td></tr>
			<tr><td><input type="submit" value="Submit" onclick="return validation()" /></td>
			<td><input type="reset" value="Reset" /></td></tr>
			</fieldset>
		</form>
	</body>
</html>