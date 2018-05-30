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
		Connection conn_o5=null;
	try{
		
		
		String pay_pd=(String)session.getAttribute("oprd_id");
		out.println(pay_pd);
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_o5= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_o5 = conn_o5.prepareStatement("Select P_Name from Retailer_Product_Details where P_ID=?");
		pst_o5.setString(1,pay_pd);
		ResultSet rs_o5=pst_o5.executeQuery();
		 
		while(rs_o5.next()){
			String Pr=rs_o5.getString("P_Name");
			System.out.println("Product name:"+Pr);
			
			session.setAttribute("Order_Product",Pr);
		}
		
		
		
		%>  <% if( rs_o5.next()) {  %>
	    <%@ include file="CRegister_Fail.jsp"%>
	     <% } else { %>
	   <%@  include file="Cust_Order_table.jsp"%>
	    <% }
		
		
	}
	catch(Exception e){
		out.println(e);
		conn_o5.close();
	}
	conn_o5.close();
	%>
	
</body>
</html>