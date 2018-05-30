<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
	String name=(String)session.getAttribute("User");
	out.println(name);
	
	session.setAttribute("name", name);
	%>
	<form name="customer_cart" action="Update_Ccart1.jsp" method="post">
		
		P_ID: 	<input type="text" name="Pr_id">
		<br>
		<br>
		Cart_quantity: <input type="text" name="cartq">
		<br>
		<br>
	   <input type="submit" value="Add_Cart">
		
		</form>
	<form name="back" action="Cust_Cart_form.jsp" method="post">
		<input type="submit" value="Go Back" >
	</form>
</body>
</html>