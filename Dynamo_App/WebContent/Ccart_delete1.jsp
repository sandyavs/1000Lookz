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
	Connection conn_del1=null;
	try{
	
	
	String u2=(String)session.getAttribute("del_user");
	out.println("delete1:"+u2);
	
	String pid_del=(String)session.getAttribute("del_pid");
	out.println(pid_del);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_del1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_del1 = conn_del1.prepareStatement("Delete from Customer_Cart_Details where  Username=? and P_ID=? ");
	pst_del1.setString(1,u2);
	pst_del1.setString(2,pid_del);
	
	ResultSet rs_del1=pst_del1.executeQuery();
	session.setAttribute("cart_name",u2);
	
	%>  <% if( rs_del1.next()) {  %>
    <%@ include file="Cust_Cart_table.jsp"%>
     <% } else { %>
   <%@  include file="PidError.jsp"%>
    <% }

	

	
    }catch(Exception e){
      out.print(e.getMessage());
  }finally{
      conn_del1.close();
  }

%>
</body>
</html>