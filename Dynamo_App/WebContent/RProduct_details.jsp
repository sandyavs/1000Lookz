<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form name="Product_list" action="VerifyRProduct.jsp" method="post">
			
			Product_type: <input type="text" name="Ptype" Placeholder="Product type">
			<br>
			<br>
			Product_name: <input type="text" name="Pname" Placeholder="Product name">
			<br>
			<br>
			Product_ID:  <input type="text" name="Pid" Placeholder="Product_Id">
			<br>
			<br>
			Product_Details:  <input type="text" name="P_details" Placeholder="Product_details">
			<br>
			<br>
			Product_Cost:  <input type="numeric" name="P_cost" Placeholder="Product_cost">
			<br>
			<br>
			Quantity_Supplied: <input type="text" name="quantity" Placeholder="say 100">
			<br>
			<br>
			<input type="submit" name="submit">
				
		</form>
		<br>
	
	</center>

</body>
</html>