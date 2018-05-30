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
	Connection conn_ir1=null;
try{
	String name = (String)session.getAttribute("CName");
    System.out.println(name);
    
    String ret_name=(String)session.getAttribute("RName");
    System.out.println(ret_name);
    
    String id=(String)session.getAttribute("CID");
    System.out.println(id);


    String pwd = (String)session.getAttribute("PASS1");
    System.out.println(pwd);
    
    String num=(String)session.getAttribute("mnum");
    System.out.println(num);
    
    String c_addr=request.getParameter("addr");
    System.out.println(c_addr);

    

    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_ir1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst_ir1 = conn_ir1.prepareStatement("insert into Retailer_Register values(?,?,?,?,?,?)");
     pst_ir1.setString(1,name);
     pst_ir1.setString(2, id);
     pst_ir1.setString(3, pwd);
     pst_ir1.setString(4, ret_name);
     pst_ir1.setString(5, c_addr);   
     pst_ir1.setString(6, num);       


    
    ResultSet rs_ir1 = pst_ir1.executeQuery();   
    
    
    %>  <% if( rs_ir1.next()) {  %>
    <%@ include file="CRegister_Success.jsp"%>
     <% }else { %>
     <%@  include file="CRegister_Fail.jsp"%>
     <% }  
           
}

catch(Exception e){       
   out.println(e); 
   conn_ir1.close();
}      
conn_ir1.close();
%>
</body>
</html>