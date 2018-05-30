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
	Connection conn_del=null;
	try{
	
	
	String u1=(String)session.getAttribute("name");
	out.println("delete:"+u1);
	
	String pid=request.getParameter("Pid");
	out.println(pid);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_del= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_del = conn_del.prepareStatement("Delete from Customer_Cart where  Username=? and P_ID=? ");
	pst_del.setString(1,u1);
	pst_del.setString(2,pid);
	
	ResultSet rs_del=pst_del.executeQuery();
	session.setAttribute("del_user",u1);
	session.setAttribute("del_pid",pid);
	
	%>  <% if( rs_del.next()) {  %>
    <%@ include file="Ccart_delete1.jsp"%>
     <% } else { %>
   <%@  include file="PidError.jsp"%>
    <% }

	

	
    }catch(Exception e){
      out.print(e.getMessage());
  }finally{
      conn_del.close();
  }

%>
</body>
</html>