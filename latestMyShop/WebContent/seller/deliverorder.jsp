<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script src="js/custom_script.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seller</title>
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
	<% int menu=6;
	%>
	<div id="wrapper">
		<%@ include file="header.jsp" %>
		<%@ include file="left.jsp" %>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>SELLER DASHBOARD</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Welcome Seller ! </strong> You Have No Pending Task For Today.
                        </div>
<jsp:useBean class="beans.Deliverorder" id="c1"></jsp:useBean>
<%


		try
		{
			ResultSet rst=c1.display();
%>
				
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
					<td>Order Id</td>
					<td>Customer Name</td>
					<td> Amount</td>	
					<td></td>
			</tr>
<%
				while(rst.next())
				{
%>
					<tr>
						<td><%=rst.getInt(1) %></td>
						<td><%=rst.getString(2) %></td>
						<td><%=rst.getInt(3) %></td>
						<td><form action="deliverdetail.jsp?id=<%=rst.getInt(1) %> " method="post"><input type="submit" value="Show Details" /></form></td> 
							
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

	
<br>
<center><h1>
<a href="dashboard.jsp">Dashboard</a></h1></center>
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