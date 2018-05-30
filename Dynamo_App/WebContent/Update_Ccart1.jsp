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
<title>Update Cart</title>
</head>
<body>
	<%
	Connection conn_a=null;
	try{
	String u1=(String)session.getAttribute("name");
	out.println("update:"+u1);
	
	String pid=request.getParameter("Pr_id");
	out.println(pid);
	
	String quantity=request.getParameter("cartq");
	int q=Integer.parseInt(quantity);
	out.println(q);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_a= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_a = conn_a.prepareStatement("Update Customer_Cart set Cart_Quantity=? where P_ID=? and Username=?");
	pst_a.setInt(1, q);
	pst_a.setString(2, pid);
	pst_a.setString(3, u1);
	session.setAttribute("user",u1);
	session.setAttribute("product",pid);
	session.setAttribute("quan",q);
	
	 ResultSet rs_a = pst_a.executeQuery();
	 out.println("Update is done successfully");

	 %>  <% if( rs_a.next()) {  %>
	    <%@ include file="UpdateCost.jsp"%>
	     <% } else { %>
	   <%@  include file="PidError.jsp"%>
	    <% }
  
}
catch(Exception e){  
	out.println(e);
   conn_a.close();
}      

conn_a.close();

%>

</body>
</html>