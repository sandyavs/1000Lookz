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
	String UserName = request.getParameter("username");
    //System.out.println(UserName);
    
    String email_id=request.getParameter("email");
    //System.out.println(email);
    
    String pass = request.getParameter("Password");
    //System.out.println(pass);
    
    String phone=request.getParameter("mobile");
    //System.out.println(phone);
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst = conn.prepareStatement("Select Username from Customer_Register where Username=? ");
     pst.setString(1,UserName);
    // pst.setString(2, email);
     //pst.setString(3, pass);
     //pst.setString(4,phone);     
     session.setAttribute("Name",UserName);
     session.setAttribute("mail",email_id);
     session.setAttribute("Spass",pass);
     session.setAttribute("mnumber",phone);
     
    ResultSet rs = pst.executeQuery();   
    
    
    %>  <% if( rs.next()) {  %>
    <%@ include file="ExistSignup.jsp"%>
     <% }else { %>
     <%@  include file="CInsert_Signup.jsp"%>
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