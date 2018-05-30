<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome to SignUp Page</h1>
	<form name="signup" action="valid_SignUp.jsp" method="post">
		USERNAME:<input type="text" name="username" placeholder="UserName">
		<br>
		<br>
		MAILID:<input type="email" name="email" placeholder="default@example.com">
		<br>
		<br>
		Password:<input type="password" name="Password">
		<br>
		<br>
		MOBILE NUMBER:<input type="text" name="mobile" placeholder="+91">
		<br>
		<br>
		<input type="submit"	name="Sign Up">
	</form>
</body>
</html>