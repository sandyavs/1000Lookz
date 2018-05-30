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
	Connection conn1=null;
	try{
	String v1=(String)session.getAttribute("us1");
	out.println("cart2:"+v1);
	
	String v2=(String)session.getAttribute("pid");
	out.println(v2);
	
	Integer v3=(Integer)session.getAttribute("q");
	out.println(v3);

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst1 = conn1.prepareStatement("insert into Customer_Cart values(?,?,?)");
	pst1.setString(1, v1);
	pst1.setString(2, v2);
	pst1.setInt(3, v3);

	
	session.setAttribute("user", v1);
	session.setAttribute("pid",v2);
	session.setAttribute("quan", v3);
	
	 ResultSet rs1= pst1.executeQuery();
	 

	
	 %>  <% if( rs1.next()) {  %>
	    <%@ include file="Cost.jsp"%>
	     <% } else { %>
	   <%@  include file="CRegister_Fail.jsp"%>
	    <% }
  
}
catch(Exception e){  
	out.println(e);
   conn1.close();
}      

conn1.close();

%>
</body>
</html>