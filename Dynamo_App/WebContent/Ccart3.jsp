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
		Connection conn3=null;
		PreparedStatement pst3=null;

	try{
		String name=(String)session.getAttribute("cart_name");
		out.println("cart3:"+name);
		
		String pr=(String)session.getAttribute("c_pid");
		out.println(pr);
		
		Integer q_cart=(Integer)session.getAttribute("c_quan");
		out.println(q_cart);
		
		Integer tcost=(Integer)session.getAttribute("amount");
		out.println(tcost);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn3= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		
		pst3 = conn3.prepareStatement("insert into Customer_Cart_Details values(?,?,?,?)");
		pst3.setString(1, name);
		pst3.setString(2, pr);
		pst3.setInt(3,q_cart);
		pst3.setInt(4, tcost);
		
		session.setAttribute("name_c",name);
		session.setAttribute("c_pro",pr);
		session.setAttribute("cart",q_cart);
		session.setAttribute("tot_cost",tcost);
		
		ResultSet rs3=pst3.executeQuery();

		 %>  <% if( rs3.next()) {  %>
		    <%@ include file="Cust_Cart_table.jsp"%>
		     <% } else { %>
		   <%@  include file="Cust_Cart_table.jsp"%>
		    <% }
		
	}
	catch(Exception e){
		out.println(e);
		conn3.close();
	}
	conn3.close();
	%>

</body>
</html>