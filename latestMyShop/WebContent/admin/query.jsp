<%@ page import="java.sql.*" %>
<%@page import="beans.Database"%>
<%@page import="myshop.CommonMethods"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
	<% int menu=8;
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
<jsp:useBean class="beans.Query" id="c1"></jsp:useBean>
<%
	Database db=new Database();
	String mode=request.getParameter("mode");
	if("show".equals(mode))
      {
	try{
		ResultSet rst=db.runSelectQuery("select * from inbox where response is null") ;
%>
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;text-align:center;margin:50px;">
		<tr><th>ID</th><th>Mail-ID</th><th>Query</th><th>Response</th><th></th></tr>
<%
		while(rst.next())
		{
%>
			<tr>
			<form action="query.jsp?mode=update" method="post" name="form1">
			<td><input type="text" value="<%=rst.getInt(3)%>" name="id" /></td>
			<td><input type="text" value="<%=rst.getString(1)%>" name="mail_id" /></td>
			<td><input type="text" value="<%=rst.getString(2)%>" name="query" /></td>
			<td><textarea rows="5" cols="20" name="resp" ></textarea></td>
			<td><input type="submit" name="b1" value="SEND" onclick="return validation()" /></td>
			</form>
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
		e.printStackTrace();
	}
      }
	else if("update".equals(mode))
	{
		int id=Integer.parseInt(request.getParameter("id")) ;
		String resp=request.getParameter("resp");
		String eid=request.getParameter("mail_id");
		String query=request.getParameter("query");
		db.runOtherQuery("update inbox set response='"+resp+"' where id="+id) ;
		//response.sendRedirect("mail.jsp?resp="+resp+"&query="+query+"&mode=queryresp");

%>

<%
	}
%>

	<center><h1><a href="dashboard.jsp">Dashboard</a></h1></center>
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