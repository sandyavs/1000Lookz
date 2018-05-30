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
    String User = request.getParameter("username");
    System.out.println(User);

    
    String password = request.getParameter("Password");
    System.out.println(password);

    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");  
    PreparedStatement pst = conn.prepareStatement("Select Username,pass from Customer_Register where Username=? and pass=?");
    pst.setString(1, User);
    pst.setString(2, password);
    session.setAttribute("User",User);
    session.setAttribute("CPass",password);


    
    ResultSet rs = pst.executeQuery();  
  

  %>  <% if( rs.next()) {  %>
    <%@ include file="LoginValid1.jsp"%>
     <% } else { %>
   <%@  include file="CRegister_Fail.jsp"%>
    <% }
   
      
}
catch(Exception e){       
   out.println("UserName and Password Field is Empty.Please Provide the valid details"); 
   conn.close();
}      

conn.close();
%>
</body>
</html>