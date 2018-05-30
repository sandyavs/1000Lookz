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
		Connection conn2=null;
		PreparedStatement pst2=null;
		ResultSet rs2=null;

	try{
		String c1=(String)session.getAttribute("user");
		out.println("cost:"+c1);
		
		String c2=(String)session.getAttribute("product");
		out.println(c2);
		
		Integer c3=(Integer)session.getAttribute("quan");
		out.println(c3);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		
		pst2 = conn2.prepareStatement("Select Cart_Quantity*(Select P_cost from RETAILER_PRODUCT_DETAILS where P_ID=?) as total_amt from CUSTOMER_CART where P_ID=? and USERNAME=?");
		pst2.setString(1,c2);
		pst2.setString(2,c2);
		pst2.setString(3,c1);
		rs2=pst2.executeQuery();
		
		session.setAttribute("cart_name",c1);
		session.setAttribute("c_pid",c2);
		session.setAttribute("c_quan",c3);
		
		
		
		while(rs2.next()){
			Integer total_amount=rs2.getInt("total_amt");
			 System.out.println("final_amt:"+total_amount);
			 
			 session.setAttribute("amount", total_amount);
		}
		 
		%>  <% if( rs2.next()) {  %>
	    <%@ include file="PidError.jsp"%>
	     <% } else { %>
	   <%@  include file="Updatecart3.jsp"%>
	    <% }
		
		
		
	}
	catch(Exception e){
		out.println(e);
		conn2.close();
	}
	conn2.close();
	%>

</body>
</html>