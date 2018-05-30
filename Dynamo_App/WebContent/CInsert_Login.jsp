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
<h5> Inserting...</h5>
<%
	Connection conn2=null;
try{
	String username = (String)session.getAttribute("User");
    System.out.println(username);

    
    String Pass1 = (String)session.getAttribute("CPass");
    System.out.println(Pass1);
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst2 = conn2.prepareStatement("insert into Customer_Login values(?,?)");
     pst2.setString(1,username);
     pst2.setString(2, Pass1);
     
     session.setAttribute("User",username);
              
           
    
    ResultSet rs2 = pst2.executeQuery();   
    
    
    %>  <% if( rs2.next()) {  %>
    <%@ include file="LoginSuccess.jsp"%>
     <% }else { %>
     <%@  include file="CustomFailure.jsp"%>
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