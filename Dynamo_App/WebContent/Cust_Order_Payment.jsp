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
		Connection conn_o4=null;
	try{
		
		String order_name=(String)session.getAttribute("or_name");
		out.println("payment:"+order_name);
		
		String or_id=(String)session.getAttribute("or_orid");
		out.println(or_id);
		
		String prd_id=(String)session.getAttribute("or_pdid");
		out.println(prd_id);
		
		Integer or_cost=(Integer)session.getAttribute("or_amt");
		out.println(or_cost);
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_o4= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_o4 = conn_o4.prepareStatement("insert into Customer_Order_TotalCost values(?,?,?,?)");
		pst_o4.setString(1,order_name);
		pst_o4.setString(2,or_id);
		pst_o4.setString(3,prd_id);
		pst_o4.setInt(4,or_cost);
		
		ResultSet rs_o4=pst_o4.executeQuery();
		session.setAttribute("owner",order_name);
		session.setAttribute("owner_order",or_id);
		session.setAttribute("oprd_id", prd_id);
		session.setAttribute("amt_order", or_cost);
		
		%>  <% if( rs_o4.next()) {  %>
	    <%@ include file="Cust_Order_table.jsp"%>
	     <% } else { %>
	   <%@  include file="CRegister_Fail.jsp"%>
	    <% }
		
		
	}
	catch(Exception e){
		out.println(e);
		conn_o4.close();
	}
	conn_o4.close();
	%>
	
</body>
</html>