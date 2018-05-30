<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import=" java.text.SimpleDateFormat"%> 
<%@ page import=" java.util.Date "%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>placing an order</h3>
	<%
	Connection conn=null;
	
	String name=(String)session.getAttribute("User");
	out.println("order:"+name);
	
	session.setAttribute("co2_user", name);
	
	String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
	
	session.setAttribute("or_date",date);


	%>
	<center>
	<form name="order" action="ReceiveCOrder.jsp" method="post">
	
		Order_ID:<input type="text" name="OID" >
		<br>
		<br>
		P_ID:	<input type="text" name="PID">
		<br>
		<br>
		Quantity:	<input type="number" name="qordered">
		<br>
		<br>
		Billing_type:<input type="text" name="btype">
		<br>
		<br>
		Delivery Address:<textarea name="address" placeholder="delivery address"></textarea>
		<br>
		<input type="submit" value="Place order">
	</form>
	</center>
</body>
</html>