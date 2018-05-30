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
		Connection conn_o3=null;
	try{
		
		String c2=(String)session.getAttribute("opid");
		out.println("order_cost:"+c2);
		
		String c3=(String)session.getAttribute("oid");
		out.println(c3);
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_o3= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_o3 = conn_o3.prepareStatement("Select Username,Order_ID,P_ID, Quantity_Ordered, Quantity_Ordered*(Select P_cost from RETAILER_PRODUCT_DETAILS where P_ID=?) as total_amt from CUSTOMER_ORDER_DETAILS  where P_ID=? and Order_ID=?");
		pst_o3.setString(1,c2);
		pst_o3.setString(2,c2);
		pst_o3.setString(3,c3);
		ResultSet rs_o3=pst_o3.executeQuery();
		
		

		while(rs_o3.next()){
			String o1_name=rs_o3.getString("Username");
			System.out.println("nameOrdered:"+o1_name);
			
			String oc_id=rs_o3.getString("Order_ID");
			System.out.println("orderid:"+oc_id);
			
			String pro=rs_o3.getString("P_ID");
			System.out.println("pid:"+pro);
			
			Integer or_quan=rs_o3.getInt("Quantity_Ordered");
			System.out.println("quantity:"+or_quan);
			
			Integer total_amount=rs_o3.getInt("total_amt");
			System.out.println("Ofinal_amt:"+total_amount);
			
			session.setAttribute("or_name",o1_name);
			session.setAttribute("or_orid",oc_id);
			session.setAttribute("or_pdid",pro);
			session.setAttribute("quan_order",or_quan);
			session.setAttribute("or_amt",total_amount);


		 }
		 %>  <% if( rs_o3.next()) {  %>
		    <%@ include file="CRegister_Fail.jsp"%>
		     <% } else { %>
		   <%@  include file="Cust_Order_Payment.jsp"%>
		    <% }
		
	}
	catch(Exception e){
		out.println(e);
		conn_o3.close();
	}
	conn_o3.close();
	%>
	
</body>
</html>