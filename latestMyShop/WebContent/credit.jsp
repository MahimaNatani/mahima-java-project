<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head></head> <meta charset="utf-8">
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
</head>
<body>
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>

<%
      if("details".equals(request.getParameter("mode")))
      {
%>

          <form action="credit.jsp?mode=pin&user=<%=request.getParameter("user")%>" method="post">
             <br>
			 <br>
			 <center><h1>Submit Your Card Details</h1></center>
            <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

             <tr><td><label for="cardno">Card Number</label></td><td><input type="text" name="cardno" id="cardno" placeholder="Enter Card Number"></td></tr>
             <tr><td><label for="exp">Expiary Date</label></td><td><input type="text" name="exp" id="exp" placeholder="MM/YY"></td></tr>
             <tr><td><label for="cvv">CVV</label></td><td><input type="password" name="cvv" id="cvv" placeholder="Enter 3 digits CVV"></td></tr>
             <tr><td><label for="name">Name</label></td><td><input type="text" name="name" id="name" placeholder="Name On Card"></td></tr>
             <tr><td colspan="2"><input type="submit" value="Pay"></td></tr>
            </table>
		</center>
          </from>
<%
      } 
      else if("pin".equals(request.getParameter("mode")))
      {
%>       
         <form action="payment.jsp?payment=1&user=<%=request.getParameter("user")%>" method="post">
         <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			 <tr><td><label for="atmpin">Enter ATM Pin</label></td><td><input type="password" name="atmpin" id="atmpin" placeholder="Enter Your ATM Pin"></td></tr>
             <tr><td colspan="2"><input type="submit" value="Pay"></td></tr>
          </table>
		  </center>
		  </from>
          </table>
<%
      }          
%>
</body>
</html>