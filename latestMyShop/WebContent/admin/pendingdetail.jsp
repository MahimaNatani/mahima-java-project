<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/custom_script.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	<!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
   	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<% int menu=5;
	%>
 <div id="wrapper">
		<%@ include file="header.jsp" %>
		<%@ include file="left.jsp" %>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>ADMIN DASHBOARD</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Welcome Admin ! </strong> You Have No pending Task For Today.
                        </div>
<jsp:useBean class="beans.PendingDetail" id="c1"></jsp:useBean>
<%
	
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ResultSet rst=c1.display(id);
%>
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

				<tr>
					<td>Order ID</td>
					<td>Product ID</td>
					<td>Quantity</td>
					<td>Price</td>
					<td>Amount</td>
					
				</tr>
<%
				while(rst.next())
				{
%>
					<tr>
						<td><%=rst.getInt(1) %></td>
						<td><%=rst.getInt(2) %></td>
						<td><%=rst.getInt(3) %></td>
						<td><%=rst.getInt(4) %></td>
						<td><%=rst.getInt(3)*rst.getInt(4) %></td>
					
						</tr>
<%					
				}
%>			
			</table>
			</center>
			</form>
<%
		}
		catch(SQLException e)
		{
			
		}

	%>
<center>
<h1>	
<a href="pendingorders.jsp?mode=show">Go TO Back</a> 
<br>
<br>
<a href="dashboard.jsp">Dashboard</a>
</h1>
</center>
</div>
                    </div>
                  </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
       <%@include file="footer.jsp" %>
</body>
</html>