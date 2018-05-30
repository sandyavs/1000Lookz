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
	<h1>Inserting retailer details</h1>
	<%
	Connection conn_il1=null;
try{
	String u_id = (String)session.getAttribute("comp_id");
    System.out.println(u_id);

    
    String rpass1 = (String)session.getAttribute("rpas");
    System.out.println(rpass1);
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_il1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst_il1 = conn_il1.prepareStatement("insert into Retailer_Login values(?,?)");
     pst_il1.setString(1,u_id);
     pst_il1.setString(2, rpass1);
     
         
    ResultSet rs_il1 = pst_il1.executeQuery();   
    
    
    %>  <% if( rs_il1.next()) {  %>
    <%@ include file="RLoginSuccess.jsp"%>
     <% }else { %>
     <%@  include file="CustomFailure.jsp"%>
     <% }  
           
}

catch(Exception e){       
   out.println(e); 
   conn_il1.close();
}      
conn_il1.close();
%>
</body>
</html>