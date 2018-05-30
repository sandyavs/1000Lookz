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
	String username = (String)session.getAttribute("Name");
    System.out.println(username);
    
    String mail=(String)session.getAttribute("mail");
    System.out.println(mail);

    String Pass1 = (String)session.getAttribute("Spass");
    System.out.println(Pass1);
    
    String number=(String)session.getAttribute("mnumber");
    System.out.println(number);
    

    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst1 = conn1.prepareStatement("insert into Customer_Register values(?,?,?,?)");
     pst1.setString(1,username);
     pst1.setString(2, Pass1);
     pst1.setString(3, mail);
     pst1.setString(4, number);       
    
    ResultSet rs1 = pst1.executeQuery();   
    
    
    %>  <% if( rs1.next()) {  %>
    <%@ include file="CRegister_Success.jsp"%>
     <% }else { %>
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