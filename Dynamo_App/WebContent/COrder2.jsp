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
<h3>Inserting order details</h3>
<%
	
	Connection conn_o2=null;
	try{
	String v1=(String)session.getAttribute("name");
	System.out.println("corder2:"+v1);
	
	String v2=(String)session.getAttribute("order");
	System.out.println(v2);

	String v3=(String)session.getAttribute("pid");
	System.out.println(v3);
	
	String v4=(String)session.getAttribute("quantity");
	System.out.println(v4);
	
	String v5=(String)session.getAttribute("odates");
	System.out.println(v5);
	//int dorder=Integer.parseInt(d);
	
	String v6=(String)session.getAttribute("billing");
	System.out.println(v6);
	
	String v7=(String)session.getAttribute("del");
	System.out.println(v7);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_o2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_o2 = conn_o2.prepareStatement("insert into Customer_Order_Details values(?,?,?,?,?,?,?)");
	pst_o2.setString(1,v1);
	pst_o2.setString(2,v2);
	pst_o2.setString(3, v3);
	pst_o2.setString(4, v4);
	pst_o2.setString(5,v5);
	pst_o2.setString(6,v6);
	pst_o2.setString(7,v7);
	
	 ResultSet rs_o2 = pst_o2.executeQuery();  
	 
	 PreparedStatement upt=conn_o2.prepareStatement("Update RETAILER_PRODUCT_DETAILS set QUANTITY_SUPPLIED=QUANTITY_SUPPLIED-( Select Quantity_Ordered from CUSTOMER_ORDER_DETAILS where ORDER_ID=? ) where P_ID=?");
		upt.setString(1,v2);
		upt.setString(2,v3);
		ResultSet rs_upt=upt.executeQuery();



	 session.setAttribute("ouser",v1);
	 session.setAttribute("oid", v2);
	 session.setAttribute("opid",v3);
	 session.setAttribute("or_quan", v4);
	 session.setAttribute("or_date",v5);
	 session.setAttribute("or_bill",v6);
	 session.setAttribute("del_addr",v7);
	 
	
	 %>  <% if( rs_upt.next()) {  %>
	    <%@ include file="OrderCost.jsp"%>
	     <% } else { %>
	   <%@  include file="CRegister_Fail.jsp"%>
	    <% }

	  
	}
	catch(Exception e){  
		out.println(e);
	   conn_o2.close();
	}      

	conn_o2.close();

	%>

</body>
</html>