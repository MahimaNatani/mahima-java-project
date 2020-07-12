<%@page import="java.util.Date"%>
<%@page import="myshop.CommonMethods"%>
<%@page import="java.io.*,beans.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<a href="dashboard.jsp">Dashboard</a><br />
<%!
	String msg;
%>
<jsp:useBean id="p1" class="beans.Product"></jsp:useBean>
<jsp:useBean id="s1" class="beans.SubCategory"></jsp:useBean>
<%
	CommonMethods.createAllTables();
	if(session.getAttribute("sellerid")==null){
		response.sendRedirect("login.jsp");
	}
	else{
		String mode = request.getParameter("mode");
		if(mode.equals("show")){
%>
		<jsp:setProperty property="sellerId" name="p1" value="<%=(Integer)session.getAttribute(\"sellerid\") %>"/>
<%
			String data[][] = p1.getAllRecords("seller");
			if(data.length == 0){
				msg="No record to display";
			}
%>
		<center>
			<h1>All Products</h1>
		</center>
		<table width="100%" border="1">
			<tr>
				<th>Product Id</th>
				<th>Product Name</th>
				<th>Sub Category</th>
				<th>Price</th>
				<th>Description</th> 
				<th>Quantity</th>
				<th>Image Name</th>
				<th>Seller Name</th>
				<th colspan=2>Actions</th>
			</tr>
<% 			
			if(msg!=null){
				out.print("<tr><td colspan=9>"+msg+"<td></tr>");
			}
			else{
				for(int i=0;i<data.length;i++){
					out.print("<tr>");
					for(int j=0;j<data[0].length;j++){
						if(j==6)
							out.print("<td><img src=\""+application.getContextPath()+"/"+data[i][j]+"\" width=\"100px\"></td>");
						else
							out.print("<td>"+data[i][j]+"</td>");
					}
						out.print("<td><a href='product.jsp?mode=edit&pid="+data[i][0]+"'>Edit</a> || <a href='product.jsp?mode=delete&pid="+data[i][0]+"' onclick='return delconfirm()'>Delete</a></td>");
					out.print("</tr>");
				}
			}
%>
		</table><br />
		<form action="product.jsp?mode=add" method="post"><input type="submit" value="Add Product" name="addproduct"/></form>
<%
		return;
		}
		else if(mode.equals("add")){
%>
			<form action="product.jsp?mode=insert" method="post" enctype="multipart/form-data">
				<input type="text" name="productname" placeholder="Enter Product Name" autofocus/><br />
				<select name="subcatname">
<% 				
					String category[][]=s1.getAllSubCategory();
					for(int i=0;i<category.length;i++){
						out.print("<option value='"+category[i][0]+"'>"+category[i][1]+"</option>");
					}
%>
				</select><br />
				<input type="text" name="price" placeholder="Enter Product Price" /><br />
				<textarea name="description" id="" cols="30" rows="" placeholder="Enter Product Description"></textarea><br />
				<input type="text" name="qty" placeholder="Enter Product Quantity" /><br />
				<input type="file" name="img1" /><br />
				<input type="submit" name="save" value="Save"/>
			</form>
<%
			return;
		}
		else if(mode.equals("edit")){ 
			String data[] = p1.getSingleRecord(Integer.parseInt(request.getParameter("pid")));
			
%>
			<form action="product.jsp?mode=update&pid="<%= request.getParameter("pid") %> method="post" enctype="multipart/form-data">
				<input type="text" name="productname" value="<%= data[1] %>" autofocus/><br />
				<input type="text" name="subcatname" value="<%= data[2] %>"/><br />
				<input type="text" name="price" value="<%= data[3] %>"/><br />
				<textarea name="description" id="" cols="30" rows="" placeholder="Enter Product Description"><%= data[4] %></textarea><br />
				<input type="text" name="qty" value="<%= data[5] %>" /><br />
				<span>Current Image</span><br />
				<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>" />
				<img src="<%= application.getContextPath()+"/"+data[6]%>" alt="" /><br />
				<input type="file" name="img1" /><br />
				<input type="submit" name="save" value="Save"/>
			</form>
<%		
			return;
		}
		else if(mode.equals("delete")){
%>
 			<jsp:setProperty property="productId" name="p1" param="pid"/>
<%
			p1.delete(Integer.parseInt(request.getParameter("pid")));
		}
		else if(mode.equals("insert")){
			p1.imageUpload(application.getRealPath("/productimages"),request,(Integer)session.getAttribute("sellerid"));
			p1.setSellerId((Integer)session.getAttribute("sellerid"));
			p1.save();
		}
		
		else if(mode.equals("update")){
%>
			<jsp:setProperty property="productId" name="p1" param="pid"/>
 			<jsp:setProperty property="productName" name="p1" param="productName"/>
 			<jsp:setProperty property="subcatId" name="p1" param="subcatId"/>
 			<jsp:setProperty property="price" name="p1" param="price"/>
 			<jsp:setProperty property="description" name="p1" param="description"/>
<%
		p1.imageUpload(application.getRealPath("/productimages"),request,(Integer)session.getAttribute("sellerid"));
	//		p1.update(Integer.parseInt(request.getParameter("pid")),request.getParameter("productName"),Integer.parseInt(request.getParameter("subcatId")),Integer.parseInt(request.getParameter("price")),request.getParameter("description"));
		p1.update();
		}
	response.sendRedirect("product.jsp?mode=show");
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