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
	
	Connection conn_o1=null;
	try{
	String name=(String)session.getAttribute("co2_user");
	out.println("name:"+name);
	
	String oid=request.getParameter("OID");
	System.out.println(oid);
	
	String pid=request.getParameter("PID");
	System.out.println(pid);
	
	String quantity=request.getParameter("qordered");
	System.out.println(quantity);
	
	String d=(String)session.getAttribute("or_date");
	System.out.println(d);
	//int dorder=Integer.parseInt(d);
	
	String billing=request.getParameter("btype");
	System.out.println(billing);
	
	String delivery=request.getParameter("address");
	System.out.println(delivery);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_o1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_o1 = conn_o1.prepareStatement("Select P_ID from Retailer_Product_details where P_ID=?");
	 pst_o1.setString(1, pid);
	 
	 session.setAttribute("name", name);
	 session.setAttribute("order", oid);
	 session.setAttribute("pid", pid);
	 session.setAttribute("quantity", quantity);
	 session.setAttribute("odates", d);
	 session.setAttribute("billing",billing);
	 session.setAttribute("del", delivery);
	 
	 ResultSet rs_o1 = pst_o1.executeQuery();  
	
	 %>  <% if( rs_o1.next()) {  %>
	    <%@ include file="COrder2.jsp"%>
	     <% } else { %>
	   <%@  include file="PidError.jsp"%>
	    <% }

	  
	}
	catch(Exception e){  
		out.println(e);
	   conn_o1.close();
	}      

	conn_o1.close();

	%>

</body>
</html>