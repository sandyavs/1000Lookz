<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Successfully,logged in:)</h1>
	<form name="customer order" action="COrder1.jsp" method="post">
		<input type="submit" value="Place Order" >
	</form>
	<br>
	<br>
	<form name="view order" action="Table_COrder.jsp" method="post">
		<input type="submit" value="View Order" >
	</form>
	<br>
	<br>
	<form name="customer cart" action="Table_Ccart.jsp" method="post">
		<input type="submit" value="Go to Cart" >
	</form>
	
</body>
</html>