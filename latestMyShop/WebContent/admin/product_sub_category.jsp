<%@page import="beans.Database,beans.*"%>
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
<jsp:useBean id="c1" class="beans.SubCategory"></jsp:useBean>
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
				<th>Sub-Category Id</th>
				<th>Sub-Category Name</th>
				<th>Category</th>
				<th colspan=2>Actions</th>
			</tr>
<% 			
			if(msg!=null){
				out.print("<tr><td colspan=4>"+msg+"<td></tr>");
			}
			else{
				for(int i=0;i<data.length;i++){
					out.print("<tr>");
					for(int j=0;j<data[0].length;j++){
						out.print("<td>"+data[i][j]+"</td>");
					}
						out.print("<td><a href='product_sub_category.jsp?mode=edit&scid="+data[i][0]+"' >Edit</a> || <a href='product_sub_category.jsp?mode=delete&scid="+data[i][0]+"' onclick='return delconfirm()'>Delete</a></td>");
					out.print("</tr>");
				}
			}
%>
		</table><br />
		<form action="product_sub_category.jsp?mode=add" method="post"><input type="submit" value="Add Product" name="addproduct"/></form>
<%
		return;
		}
		else if(mode.equals("add")){
			out.print("<a href='dashboard.jsp'>DashBoard</a>");
			String data[][] = new Category().getAllRecords();
%>
			<form action="product_sub_category.jsp?mode=insert" method="post">
				<input type="text" name="subcatname" placeholder="Enter Sub Category Name" autofocus/><br />
				<select name="catid">
				<% 
					for(int i=0;i<data.length;i++){
							out.print("<option value="+data[i][0]+">"+data[i][1]+"</opiton>");	
					}
				%>
				</select>
				<input type="submit" name="save" value="Save"/>
			</form>
<%
			return;
		}
		else if(mode.equals("edit")){ 
			out.print("<a href='dashboard.jsp'>DashBoard</a>");
			Category c = new Category();
			String data[] = c1.getSingleRecord(Integer.parseInt(request.getParameter("scid")));
			String catdata[][] = new Category().getAllRecords();
%>
			<form action='product_sub_category.jsp?mode=update&scid=<%=request.getParameter("scid") %>' method="post">
				<input type="text" name="subcatname" value="<%=data[1]%>" /><br />
				<select name="catid" id="">			
<% 				for(int i=0;i<catdata.length;i++){
					if(Integer.parseInt(catdata[i][0]) ==new Category().getCategoryId(data[2]))
						out.print("<option value='"+catdata[i][0]+"' selected>"+catdata[i][1]+"</option>");
					else
						out.print("<option value='"+catdata[i][0]+"'>"+catdata[i][1]+"</option>");
				}
%>
				</select>
				<input type="submit" name="save" value="Save"/>
			</form>
<%				
			return;
		}
		else if(mode.equals("delete")){
%>
 			<jsp:setProperty property="subCatId" name="c1" param="scid"/>
<%
			c1.delete();
		}
		else if(mode.equals("insert")){
%>
			<jsp:setProperty property="subCatId" name="c1" param="scid"/>
 			<jsp:setProperty property="subCatName" name="c1" param="subcatname"/>
 			<jsp:setProperty property="catId" name="c1" param="catid"/>
 			
<%
			c1.save();
		}
		else if(mode.equals("update")){
%>
 			<jsp:setProperty property="catId" name="c1" param="catid"/>
 			<jsp:setProperty property="subCatId" name="c1" param="scid"/>
 			<jsp:setProperty property="subCatName" name="c1" param="subcatname"/>
<%
			c1.update();
		}
		response.sendRedirect("product_sub_category.jsp?mode=show");
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