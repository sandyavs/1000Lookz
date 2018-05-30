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
	Connection conn_l1=null;
try{
	String id=request.getParameter("cid");
	System.out.println("valid:"+id);
	
	String Rpass=request.getParameter("Password");
	System.out.println(Rpass);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_l1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");  
    PreparedStatement pst_l1 = conn_l1.prepareStatement("Select Company_ID ,pass from Retailer_Register where Company_ID =? and pass=?");
    pst_l1.setString(1, id);
    pst_l1.setString(2, Rpass);
    
    session.setAttribute("Rid",id);
    session.setAttribute("rPass",Rpass);


    
    ResultSet rs_l1 = pst_l1.executeQuery();  
  

  %>  <% if( rs_l1.next()) {  %>
    <%@ include file="RLoginValid1.jsp"%>
     <% } else { %>
   <%@  include file="CRegister_Fail.jsp"%>
    <% }
   
      
}
catch(Exception e){       
   //out.println("Company_id and Password Field is Empty.Please Provide the valid details"); 
   conn_l1.close();
}      

conn_l1.close();
	
	%>

</body>
</html>