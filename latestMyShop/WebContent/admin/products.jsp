<%@page import="beans.Database,beans.Product"%>
<%@page import="myshop.CommonMethods"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
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
<jsp:useBean class="beans.Product" id="c1"></jsp:useBean>
<%
	String mode=request.getParameter("mode");
	if(mode.equals("show"))
	{
		try
		{
			ResultSet rst=c1.show();
%>
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
				<tr>
					<td>Sub category</td>
					<td>Product Name</td>
					<td>Price</td>
					<td>Seller Id</td>
				</tr>
<%
				int cnt=1,subcatId=0;
				while(rst.next())
				{
					if(rst.getInt(3)!=subcatId)
					{
						subcatId=rst.getInt(3);
						cnt=1;
%>
					<tr>
						<%
						String s1=c1.getSubCatName(rst.getInt(3));
						%>
						<td><%=s1 %></td>
						<td><%=rst.getString(2) %></td>
						<td><%=rst.getString(4) %></td>
						<td><%=rst.getString(8) %></td>
						<td><form action="products.jsp?mode=change&id=<%=rst.getInt(1) %>&oldproductName=<%=rst.getString(2) %>&&oldsubcatId=<%=rst.getInt(3) %>&&oldprice=<%=rst.getInt(4) %>&&olddescription=<%=rst.getString(5) %>&&oldquantity=<%=rst.getString(6) %>" method="post"><input type="submit" value="change" /></form></td>
						<td><form action="products.jsp?mode=delete&id=<%=rst.getInt(1) %>" method="post"><input type="submit" value="delete" /></form></td>
						
					</tr>
<%
					}
					cnt++;
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
	}
	else if(mode.equals("delete"))
	{
		c1.delete(Integer.parseInt(request.getParameter("id")));
%>
		<jsp:forward page="products.jsp?mode=show"></jsp:forward>
<%			
	}
	else if(mode.equals("add"))
	{
%>		
		<form action="products.jsp?mode=addsave" method="post" name="addform"
		enctype="multipart/form-data">
		<center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr>
			<td>Enter Item name to add</td>
			<td><input type="text" name="productName"></td>
			</tr>
			<br />
			<tr>
			<td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select></td>
			</tr>
			<br />
			<tr>
			<td>
			Select Sub Category</td><td><select name="subcategory">
				<%
					rst=c1.getAllSubCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(3) %></option>
				<%
					}
				%>
			</select></td></tr>
			
			<tr><td>Enter Price</td><td><input type="text" name="price" /></td></tr><br />
			<tr><td>Enter Details</td><td><input type="text" name="description" /><br /></td></tr>
			<tr><td>Upload Image</td><td><input type="file" name="image" /><br /></td></tr>			
			<tr><td><input type="submit" value="save" onclick="return validation1()"></td>
			<td><input type="reset" value="reset" onclick="return validation1()"></td></tr>
			</table>
			</center>
		</form>
		
<% 		
		return;
	}
	else if(mode.equals("change"))
	{
		String oldproductName=request.getParameter("oldproductName");
		String id=request.getParameter("id");
		int oldsubcatId=Integer.parseInt(request.getParameter("oldsubcatId"));
		int oldprice=Integer.parseInt(request.getParameter("oldprice"));
		String oldsubcatname=c1.getSubCatName(oldsubcatId);
		String olddetails=request.getParameter("olddescription");
		
%>		
		<form action="products.jsp?mode=editsave&productId=<%=id %>" method="post" name="changeform">
		
			<center>
			<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
			<tr><td>Old Product name is</td><td> <%=oldproductName %></td></tr>
			<tr><td>Old Sub Category name is</td><td> <%=oldsubcatname %><br /></td></tr>
			<tr><td>Enter new Product name</td><td><input type="text" name="productName"><br /></td></tr>
			<tr><td>Select Category</td><td><select name="category">
				<%
					ResultSet rst=c1.getAllCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(2) %></option>
				<%
					}
				%>
			</select><br /></td></tr>
			<tr><td>Select Sub Category</td><td><select name="subcategory">
				<%
					rst=c1.getAllSubCatName();
					while(rst.next())
					{
				%>
				<option value="<%=rst.getInt(1) %>"><%=rst.getString(3) %></option>
				<%
					}
				%>
			</select><br /></td></tr>
			<tr><td>Enter new price</td><td><input type="text" name="price"><br /></td></tr>
			<tr><td>Enter new description</td><td><input type="text" name="description"><br /></td></tr>
			<tr><td>Enter new quantity</td><td><input type="text" name="quantity"><br /></td></tr>
			<tr><td><input type="submit" value="save" onclick="return validation()"></td>
			<td><input type="reset" value="reset" onclick="return validation()"></td></tr>
			</table>
			</center>
		</form>
<% 		
		return;
	}
	else if(mode.equals("editsave"))
	{
		int productId=Integer.parseInt(request.getParameter("productId"));
		String newproductName=request.getParameter("productName");
		String newdescription=request.getParameter("description");
		int newsubcatId=Integer.parseInt(request.getParameter("subcategory"));
		int newprice=Integer.parseInt(request.getParameter("price"));
		int newqty=Integer.parseInt(request.getParameter("quantity"));
		c1.update(productId,newproductName,newsubcatId,newprice,newdescription);
%>
		<jsp:forward page="products.jsp?mode=show"></jsp:forward>
<%			
	}
	else if(mode.equals("addsave"))
	{
		int id=0,category=0,subcategory=0,price=0;
		String productName="",image="",description="";
		try
		{
			Database db=new Database();
			ResultSet rst=db.runSelectQuery("select max(productId) from products");
			rst.next();
			id=rst.getInt(1)+1;
		}
		catch(SQLException e){out.print(e);}
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) 
		{		
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try 
			{
				items = upload.parseRequest(request);
			} 
			catch (FileUploadException e) 
			{
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) 
			{
				FileItem item = (FileItem) itr.next();
				if (!item.isFormField())
				{
					try 
					{
						image = item.getName();
						image=id+image.substring(image.indexOf('.'),image.length());

						File savedFile = new File(config.getServletContext().getRealPath("/productimages")+"\\"+image);
						item.write(savedFile);
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				}
				else
				{
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString();
					if(fieldname.equals("category"))
						category=Integer.parseInt(fieldvalue);
					if(fieldname.equals("subcategory"))
						subcategory=Integer.parseInt(fieldvalue);
					if(fieldname.equals("price"))
						price=Integer.parseInt(fieldvalue);
					if(fieldname.equals("productName"))
						productName=fieldvalue;
					if(fieldname.equals("description"))
						description=fieldvalue;

				}
			}
		}
	}
%>
<center>
<h2>
<a href="dashboard.jsp">Admin Home</a>
</h2>
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