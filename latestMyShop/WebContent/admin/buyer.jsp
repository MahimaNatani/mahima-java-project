<%@page import="beans.Database,beans.Buyer"%>
<%@page import="myshop.CommonMethods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
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
<%!
	String msg;
%>
<jsp:useBean id="c1" class="beans.Buyer"></jsp:useBean>
<%
	CommonMethods.createAllTables();
	HttpSession session=request.getSession(false);
	if(session == null || session.getAttribute("adminid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	else{
		String mode = request.getParameter("mode");
		if(mode.equals("show")){
			out.print("<a href='dashboard.jsp'>DashBoard</a>");
			String data[][] = c1.getAllRecords();
			if(data.length == 0){
				msg="No record to display";
			}
%>
		<table>
			<tr>
				<th>User</th>
				<th>Password</th>
				<th>Email Id</th>
				<th>Contact</th>
				<th>Address</th>
				<th>Pincode</th>
				<th colspan=1>Actions</th>
			</tr>
<% 			
			if(msg!=null){
				out.print("<tr><td colspan=3>"+msg+"<td></tr>");
			}
			else{
				for(int i=0;i<data.length;i++){
					out.print("<tr>");
					for(int j=0;j<data[0].length;j++){
						System.out.println(i);
						out.print("<td>"+data[i][j]+"</td>");
					}
						out.print("<td><a href='buyer.jsp?mode=delete&user="+data[i][0]+"' onclick='return delconfirm()'>Delete</a></td>");
					out.print("</tr>");
				}
			}
%>
		</table><br />
<%
		}
		else if(mode.equals("delete")){
%>
 			<jsp:setProperty property="user" name="c1" param="user"/>
<%
			c1.delete();
		}
%>
<%
if(true)
	return;
%>
		<jsp:forward page="buyer.jsp">
			<jsp:param value="show" name="mode"/>
		</jsp:forward>

<%
		}
%>
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