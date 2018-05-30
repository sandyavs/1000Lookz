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
<h1>Validating</h1>
<%
Connection conn1=null;
try{
    String user = (String)session.getAttribute("User");
    System.out.println(user);

    
    String Pass = (String)session.getAttribute("CPass");
    System.out.println(Pass);

    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");  
    PreparedStatement pst1 = conn1.prepareStatement("Select Username,pass from Customer_Login where Username=? and pass=?");
    pst1.setString(1, user);
    pst1.setString(2, Pass);
    session.setAttribute("User",user);
    session.setAttribute("CPass",Pass);


    
    ResultSet rs1 = pst1.executeQuery();  
  

  %>  <% if( rs1.next()) {  %>
    <%@ include file="LoginSuccess.jsp"%>
     <% } else { %>
   <%@  include file="CInsert_Login.jsp"%>
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