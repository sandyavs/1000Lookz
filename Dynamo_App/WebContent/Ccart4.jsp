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
		Connection conn4=null;
	try{
		String name1=(String)session.getAttribute("name_c");
		out.println("cart4:"+name1);
		
		String pro=(String)session.getAttribute("c_pro");
		out.println(pro);
		
		Integer cart1=(Integer)session.getAttribute("cart");
		out.println(cart1);
		
		Integer total=(Integer)session.getAttribute("tot_cost");
		out.println(total);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn4= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst4=conn4.prepareStatement("Select P_Name from Retailer_Product_Details where P_ID=?");
		pst4.setString(1,pro);
		ResultSet rs4=pst4.executeQuery();
		
		while(rs4.next()){
			String P=rs4.getString("P_Name");
			System.out.println("Product name:"+P);	
			session.setAttribute("Product",P);
		}
		session.setAttribute("cart_name",name1);
		//session.setAttribute("c_quan", cart1);
		//session.setAttribute("amount",total);		
		%>  <% if( rs4.next()) {  %>
	    <%@ include file="PidError.jsp"%>
	     <% } else { %>
	   <%@  include file="Cust_Cart_table.jsp"%>
	    <% }
	}
	catch(Exception e){
		out.println(e);
		conn4.close();
	}
	conn4.close();
	%>

</body>
</html>