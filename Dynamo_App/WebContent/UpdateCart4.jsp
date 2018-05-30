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
		Connection conn_a1=null;
	try{
		String user_up=(String)session.getAttribute("uc_name");
		out.println("cart4:"+user_up);
		
		String user_pid=(String)session.getAttribute("uc_pro");
		out.println(user_pid);
		
		Integer cart1=(Integer)session.getAttribute("cart");
		out.println(cart1);
		
		Integer total=(Integer)session.getAttribute("tot_cost");
		out.println(total);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_a1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_a1=conn_a1.prepareStatement("Select P_Name from Retailer_Product_Details where P_ID=?");
		pst_a1.setString(1,user_pid);
		ResultSet rs_a1=pst_a1.executeQuery();
		
		 
		while(rs_a1.next()){
			String P=rs_a1.getString("P_Name");
			System.out.println("Product name:"+P);
			
			session.setAttribute("Product",P);
		}
		
		
		session.setAttribute("cart_name",user_up);
		//session.setAttribute("c_quan", cart1);
		//session.setAttribute("amount",total);
		
		/*
		PreparedStatement pst_a2=conn_a1.prepareStatement("Select distinct sum(Amount) as Total from Customer_Cart_Details where Username=? group by Username");
	   	pst_a2.setString(1,user_up);
	   	ResultSet rs_a2=pst_a2.executeQuery();
	   	
	   	while(rs_a2.next()){
	   		Integer amt=rs_a2.getInt("Total");
	   		
	   		session.setAttribute("total",amt);
	   	}
		*/
		%>  <% if( rs_a1.next()) {  %>
	    <%@ include file="PidError.jsp"%>
	     <% } else { %>
	   <%@  include file="Cust_Cart_table.jsp"%>
	    <% }
	}
	catch(Exception e){
		out.println(e);
		conn_a1.close();
	}
	conn_a1.close();
	%>

</body>
</html>