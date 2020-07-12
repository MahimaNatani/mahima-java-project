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

		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		
		<script type="text/javascript">
		function validation()
		{
			if(document.forms.form1.user.value.trim()=="")
			{
				alert("Type user name");
				return false;
			}
			if(document.forms.form1.pass.value.trim()=="")
			{
				alert("Type pass ");
				return false;
			}
		}
		</script>
		<link rel="stylesheet" href="css/style.css" type="text/css" />
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
<form action="logincheck.jsp" method="post" name="form1">
<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
		<td>Enter User Name</td>
		<td><Input type="text"  name="user"></td>
		</tr>
		<tr>
		<td>Enter User Password</td>
		<td><Input type="password"  name="pass"></td>
		</tr>	
		<tr>
		<td><input type="submit" value="Login" onclick="return validation()"></td>
		<br >
		<td><a href="sign_up.jsp">NewUserSignup</a></td>
		</tr>
		</table>
		</center>
		</form>
		 </br>
		 <center>
	<form action="forgotpass1.jsp" method="post">
	   <input type="submit" value="Forgot Password" rows=30 />
	</form>
	</center>
	</body>
</html>