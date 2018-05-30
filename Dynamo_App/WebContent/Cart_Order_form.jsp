<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		Connection conn_c3=null;
	String co2_user=(String)session.getAttribute("co1_user");
	String co2_id=(String)session.getAttribute("co1_id");
	int q2_ord=(Integer)session.getAttribute("q1_ord");
	int co1_cost=(Integer)session.getAttribute("cost_ord");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_c3= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_c3=conn_c3.prepareStatement("Select Delivery_Address from CUSTOMER_ORDER_DETAILS where Username=? ");
	pst_c3.setString(1,co2_user);
	ResultSet rs_c3=pst_c3.executeQuery();
	
	while(rs_c3.next()){
		String daddr=rs_c3.getString("Delivery_Address");
		System.out.println(daddr);
	}
	
	%>
	
	<form name=del_addr action="Del_addr.jsp" method="post">
		<input type="submit" value="EDIT"/>
	</form>
	
</body>
</html>