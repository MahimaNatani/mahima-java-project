<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="beans.Database"%>
<%@page import="myshop.CommonMethods"%>
<html>
	<head>
	  <meta charset="utf-8">
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
	ResultSet rst=null;
	Database db=new Database();
	int order_id;
	String user=request.getParameter("user");
	    out.print("<br><br><center><h1>Hello "+user+"</h1></center>");
        String value=request.getParameter("payment");
        if(value==null || "".equals(value))
        {
                out.print("Select any Option");
                return;
        }
        else if("credit".equals(value))
        {
            response.sendRedirect("credit.jsp?mode=details&user="+user);   
            return;       
        }
        else if("netbanking".equals(value))
        {
%>

             <form action="netbanking.jsp" method="post">
             <center>
		<table border="1" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">

			 <tr><td>Select bank</td></tr>
             <tr><td><select name="bank">
                 <option value="icici">ICICI Bank</option>
                 <option value="sbi">State Bank Of India</option>
                 <option value="pnb">Punjab National Bank</option>
                 <option value="hdfc">HDFC Bank</option>
             </select><br></td></tr>
             <tr><td><input type="submit" value="Submit"></td></tr>
			 </table>
			 </center>
             </form>
<%
             return;
        }
	rst=db.runSelectQuery("select max(order_id) from pendingorders");
	rst.next();
	order_id=rst.getInt(1)+1;
	db.close();

	Vector<String []> v2=(Vector<String []>)session.getAttribute("cart");
	int sum=0;
	for(int i=0;i<v2.size();i++)
	{
		String t[]=v2.get(i);
		db.runOtherQuery("insert into porders_det(order_id,productid,qty,price,amount) values("+order_id+","+t[0]+","+t[5]+","+t[2]+","+t[6]+")");
                rst=db.runSelectQuery("select qty from products where productid="+t[0]);
                rst.next();
                int qty=rst.getInt(1);
                qty=qty-Integer.parseInt(t[5]);
                db.runOtherQuery("update products set qty="+qty+" where productid="+t[0]);
                db.close();
		sum+=Integer.parseInt(t[6]);
	}
	String s1=request.getParameter("shippingaddress");
	db.runOtherQuery("insert into pendingorders(order_id,user,amount,delivered,shippingaddress) values("+order_id+",'"+user+"',"+sum+",0,'"+s1+"')");
	rst=db.runSelectQuery("select email from buyers where user='"+user+"'");
	rst.next();
	String email=rst.getString(1);	
	db.close();
	session.invalidate();
	
%>
<%--<jsp:forward page="mail.jsp?mode=bill&email=<%=email%>&amt=<%=sum%>"></jsp:forward>--%>
<jsp:forward page="confirmbooking.jsp"></jsp:forward>
</body>
</html>