<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>You have been Successfully logged in!!!</h3>
	<h1>Successfully,logged in:)</h1>
	<form name="Retailer order" action="" method="post">
		<input type="submit" value="Place Order" >
	</form>
	<br>
	<br>
	<form name="view order" action="" method="post">
		<input type="submit" value="View Order" >
	</form>
	<br>
	<br>
	<form name="Retailer cart" action="" method="post">
		<input type="submit" value="Go to Cart" >
	</form>
	<br>
	<br>
	<form name="Sell" action="RProduct_details.jsp" method="post">
		<input type="submit" value="Sell Products" >
	</form>
	<br>
	<br>
	<form name="View Products" action="" method="post">
		<input type="submit" value="View Products" >
	</form>
	
	<form name="update" action="NewRProduct.jsp" method="post">
		UPDATE: <input type="submit" name="update">
	</form>
	<%
	String ind_id=(String)session.getAttribute("com_id");
	session.setAttribute("ind1",ind_id);
	%>
	
</body>
</html>