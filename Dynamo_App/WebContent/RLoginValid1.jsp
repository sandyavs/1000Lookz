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
Connection conn_l2=null;
try{
    String company = (String)session.getAttribute("Rid");
    System.out.println(company);

    
    String rpass = (String)session.getAttribute("rPass");
    System.out.println(rpass);

    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_l2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");  
    PreparedStatement pst_l2 = conn_l2.prepareStatement("Select Company_ID,pass from Retailer_Login where Company_ID=? and pass=?");
    pst_l2.setString(1, company);
    pst_l2.setString(2, rpass);
    session.setAttribute("com_id",company);
    session.setAttribute("rpas",rpass);

    ResultSet rs_l2 = pst_l2.executeQuery();  
  

  %>  <% if( rs_l2.next()) {  %>
    <%@ include file="RLoginSuccess.jsp"%>
     <% } else { %>
   <%@  include file="RInsertLogin.jsp"%>
    <% }
   
      
}
catch(Exception e){       
   out.println(e); 
   conn_l2.close();
}      

conn_l2.close();
%>

	
	
	
</body>
</html>