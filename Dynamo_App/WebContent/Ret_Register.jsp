<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retailer Registration</title>
</head>
<body>
	<form name="signup" action="Ret_signup.jsp" method="post">
		COMPANYNAME:<input type="text" name="Cname" placeholder="CompanyName">
		<br>
		<br>
		RETAILER_NAME:<input type="text" name="Rname" placeholder="RetailerName">
		<br>
		<br>
		COMPANYID:<input type="text" name="cid" placeholder="companyId">
		<br>
		<br>
		Password:<input type="password" name="Password">
		<br>
		<br>
		MOBILE NUMBER:<input type="text" name="mobile" placeholder="+91">
		<br>
		<br>
		
		COMPANY ADDRESS:<textarea rows="4" cols="50" name="addr" placeholder="Enter company Address here..."></textarea>
		<br>
		<br>
		<input type="submit"	name="Sign Up">
	</form>
</body>
</html>