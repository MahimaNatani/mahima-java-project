<h1>Products</h1>
<table border="1">	
	<tr>
	
<%
		int i=0;
		int max=0,min=0;
		
		
		try
		{
			
			
			
			if(price!=null && !"".equals(price) && !price.equalsIgnoreCase("All") )
			{
				String s[]=price.split(" ");
				min=Integer.parseInt(s[1]);
				max=0;
				if(s[3].equals("above"))
					max=Integer.MAX_VALUE;
				else
					max=Integer.parseInt(s[3]);
			}
	String qq="";
			if((cat==null || cat.length==0) && (subcat==null || subcat.length==0))
	{
	 rst=db.runSelectQuery("select * from products where ('"+item+"'='null' or '"+item+"'='' or productname='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");

	}
				
			else if(subcat==null || subcat.length==0)
				rst=db.runSelectQuery("select * from products where cat_id in"+catstr + " and ('"+item+"'='null' or '"+item+"'='' or productname='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
			else if(cat==null || cat.length==0)
				rst=db.runSelectQuery("select * from products where subcatid in"+subcatstr + " and ('"+item+"'='null' or '"+item+"'='' or productname='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
			else
				rst=db.runSelectQuery("select * from products where cat_id in"+catstr + "and subcatid in"+subcatstr + " and ('"+item+"'='null' or '"+item+"'='' or productname='"+item+"') and ('"+price+"'='null' or '"+price+"'='All' or (price>="+min+" and price<="+max +"))");
			

		while(rst.next())
		{
			if(rst.getInt(6)!= 0)
			{
			out.print("<td><form action='addcart.jsp?id="+rst.getInt(1)+"' method='post'>"+rst.getString(2)+"<br /><a href='details.jsp?id="+rst.getInt(1)+"'><img src='itemimages/"+rst.getString(7)+"' width='176' height='170' /></a><br />Rs."+rst.getInt(4)+"/-<br /><input type='submit' value='Add To Cart' /></form></td>");
			}
			else
			{
				out.print("<td>"+rst.getString(2)+"<br /><a href='details.jsp?id="+rst.getInt(1)+"'><img src='itemimages/"+rst.getString(7)+"' width='100' height='100' /></a><br />Rs."+rst.getInt(4)+"/-<br /> out of stock  </td>");		
			}
			i++;
			if(i%4==0)
			{
				out.print("</tr><tr>");
			}
		}
		out.print("</tr>");
		
	}
	catch(SQLException e)
	{
		out.print(e);
	}

%>		
</table>
____________________-header.jsp----------------------
<%@ page import="java.util.*"%>
<%
	int cnt=0,totalbill=0;
	Vector v1=(Vector)session.getAttribute("cart");
	if(v1==null)
		cnt=0;
	else
	{
		cnt=v1.size();
		for(int i=0;i<v1.size();i++)
		{
			String t[]=(String [])v1.get(i);
			totalbill+=Integer.parseInt(t[2])*Integer.parseInt(t[5]);
		}
	}
%>
    <h1 id="logo"><a href="#">My Shop</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="viewcart.jsp?mode=display" class="cart-link">My Cart</a>
      <div class="cl">&nbsp;</div>
      <span>Articles: <strong><%=cnt %></strong></span> &nbsp;&nbsp; <span>Cost: <strong>RS.<%=totalbill %></strong></span> </div>
		<div id="navigation">
      <ul>
<%
	if(menu==1)
	{
%>
        <li><a href="index.jsp" class="active">My Shop Zone</a></li>
<%
	}
	else
	{
%>
        <li><a href="index.jsp">My Shop Zone</a></li>
<%
	}
%>
<%
	if(menu==2)
	{
%>
	<li><a href="customerservice.jsp" class="active">Customer Service</a></li>
<%
	}
	else
	{
%>
	<li><a href="customerservice.jsp">Customer Service</a></li>
<%
	}
%>

<%
	if(menu==3)
	{
%>
        <li><a href="myaccount.jsp" class="active">My Account</a></li>
<%
	}
	else
	{
%>
        <li><a href="myaccount.jsp">My Account</a></li>
<%
	}
%>

<%
	if(menu==4)
	{
%>
        <li><a href="contact.jsp" class="active">Contact</a></li>
<%
	}
	else
	{
%>
        <li><a href="contact.jsp">Contact</a></li>
<%
	}
%>
       </ul>
    </div>
    <!-- End Navigation -->

