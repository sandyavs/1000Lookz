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
	Connection conn=null;
	try{
	String u1=(String)session.getAttribute("name");
	out.println("cart:"+u1);
	
	String pid=request.getParameter("Pr_id");
	out.println(pid);
	
	String quantity=request.getParameter("cartq");
	int q=Integer.parseInt(quantity);
	out.println(q);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst = conn.prepareStatement("Select P_ID from Retailer_Product_details where P_ID=?");
	pst.setString(1, pid);
	
	session.setAttribute("us1", u1);
	session.setAttribute("pid", pid);
	session.setAttribute("q", q);
	
	 ResultSet rs = pst.executeQuery();
	 

	
	 %>  <% if( rs.next()) {  %>
	    <%@ include file="Ccart2.jsp"%>
	     <% } else { %>
	   <%@  include file="PidError.jsp"%>
	    <% }
  
}
catch(Exception e){  
	out.println(e);
   conn.close();
}      

conn.close();

%>
</body>
</html>