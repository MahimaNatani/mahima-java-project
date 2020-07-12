<%@page import="beans.Database,beans.Category"%>
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
<jsp:useBean id="c1" class="beans.Category"></jsp:useBean>
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
			out.println(data.length);
			if(data.length == 0){
				msg="No record to display";
			}
%>
		<table>
			<tr>
				<th>Category Id</th>
				<th>Category Name</th>
				<th colspan=2>Actions</th>
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
						out.print("<td><a href='product_category.jsp?mode=edit&pid="+data[i][0]+"' >Edit</a> || <a href='product_category.jsp?mode=delete&pid="+data[i][0]+"' onclick='return delconfirm()'>Delete</a></td>");
					out.print("</tr>");
				}
			}
%>
		</table><br />
		<form action="product_category.jsp?mode=add" method="post"><input type="submit" value="Add Product" name="addproduct"/></form>
<%
		return;
		}
		else if(mode.equals("add")){
			out.print("<a href='dashboard.jsp'>DashBoard</a>");
			int maxid = c1.getMaxCategoryId();
%>
			<form action="product_category.jsp?mode=insert" method="post">
				<input type="text" name="catid" value="<%=maxid%>" readonly /><br />
				<input type="text" name="catname" placeholder="Enter Category Name" autofocus/><br />
				<input type="submit" name="save" value="Save"/>
			</form>
<%
			return;
		}
		else if(mode.equals("edit")){ 
			out.print("<a href='dashboard.jsp'>DashBoard</a>");
			String data[] = c1.getSingleRecord(Integer.parseInt(request.getParameter("pid")));
%>
			<form action="product_category.jsp?mode=update" method="post">
				<input type="text" name="catid" value="<%=data[0]%>" readonly /><br />
				<input type="text" name="catname" value="<%=data[1]%>" /><br />
				<input type="submit" name="save" value="Save"/>
			</form>
<%		
			return;
		}
		else if(mode.equals("delete")){
%>
 			<jsp:setProperty property="catId" name="c1" param="pid"/>
<%
			c1.delete();
		}
		else if(mode.equals("insert")){
%>
 			<jsp:setProperty property="catId" name="c1" param="catid"/>
 			<jsp:setProperty property="catName" name="c1" param="catname"/>
<%
			c1.save();
		
		}
		else if(mode.equals("update")){
%>
 			<jsp:setProperty property="catId" name="c1" param="catid"/>
 			<jsp:setProperty property="catName" name="c1" param="catname"/>
<%
			c1.update();
			
		}
%>
		<jsp:forward page="product_category.jsp">
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



