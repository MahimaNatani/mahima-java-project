<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="logincheck.jsp?mode=signin" method="post">
			<input type="text" name="user" placeholder="Enter User name"/><br />
			<input type="password" name="pass" placeholder="Enter Password"/><br />
			<input type="text" name="email" placeholder="Enter Email-Id"/><br />
			<input type="text" name="contact" placeholder="Enter Contact No."/><br />
			<textarea name="add" id="" cols="30" rows="" placeholder="Enter Address"></textarea><br />
			<input type="text" name="pincode" placeholder="Enter Pincode"/><br />
			<input type="text" name="shop" placeholder="Enter Shop Name"/><br />
			<input type="text" name="gstno" placeholder="Enter GST Number"/><br />
			
			<input type="submit" name="signin" value="Sign-In" /><br />
		</form>
</body>
</html>