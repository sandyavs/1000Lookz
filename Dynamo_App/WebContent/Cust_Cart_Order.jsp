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
		Connection conn_c2=null;
	try{
		String co1=(String)session.getAttribute("co_user");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_c2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_c2=conn_c2.prepareStatement("Select * from CUSTOMER_CART_DETAILS where Username=? ");
		pst_c2.setString(1,co1);
		ResultSet rs_c2=pst_c2.executeQuery();
		session.setAttribute("co1_user",co1);
		while(rs_c2.next()){
			String co_pid=rs_c2.getString(2);
			int co_q1=rs_c2.getInt(3);
			int co_cost=rs_c2.getInt(4);
			session.setAttribute("co1_id", co_pid);
			session.setAttribute("q1_ord", co_q1);
			session.setAttribute("cost_ord", co_cost);
		}
		%>  <% if( rs_c2.next()) {  %>
	    <%@ include file="PidError.jsp"%>
	     <% } else { %>
	   <%@  include file="Cart_Order_form.jsp"%>
	    <% }
	}
	
catch(Exception e){
	out.println(e);
	conn_c2.close();
}
conn_c2.close();
		
		
	%>
</body>
</html>