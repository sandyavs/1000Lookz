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
	Connection co=null;
	PreparedStatement stmt=null;
	//ResultSet rs3=null;

	try{
	String name=(String)session.getAttribute("cart_name");
	out.println("cart:"+name);
	
	String cart_pro=(String)session.getAttribute("c_pid");
	out.println(cart_pro);

	Integer q1=(Integer)session.getAttribute("c_quan");
	out.println(q1);
	
	Integer tot=(Integer)session.getAttribute("amount");
	out.println(tot);
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	co= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	stmt=co.prepareStatement("Update CUSTOMER_CART_DETAILS set CART_QUANTITY=?,Amount=? where USERNAME=? and P_ID=?");
	stmt.setInt(1,q1);
	stmt.setInt(2,tot);
	stmt.setString(3,name);
	stmt.setString(4,cart_pro);
	
	session.setAttribute("uc_name",name);
	session.setAttribute("uc_pro",cart_pro);
	session.setAttribute("uc_q",q1);
	session.setAttribute("uc_cost",tot);
	
	ResultSet rs_1=stmt.executeQuery(); 
	System.out.println("updates");
	
	%>  <% if( rs_1.next()) {  %>
    <%@ include file="UpdateCart4.jsp"%>
     <% } else { %>
   <%@  include file="PidError.jsp"%>
    <% }

	}
	catch(Exception e){
		out.println(e);
		co.close();
	}
	co.close();
	%>

</body>
</html>