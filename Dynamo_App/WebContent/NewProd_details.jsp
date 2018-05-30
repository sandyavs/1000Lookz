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
	<h3>Receive </h3>
	<%
		Connection conn_np=null;
		try{
			
		String comp_id=(String)session.getAttribute("comp");
		out.println("new:"+comp_id);
	
		String type=(String)session.getAttribute("Prod_type");	
		System.out.println(type);
		
		String name=(String)session.getAttribute("Prod_name");	
		System.out.println(name);
		
		String id=(String)session.getAttribute("Prod_id");	
		System.out.println(id);
		
		String details=(String)session.getAttribute("Prod_details");	
		System.out.println(details);
		
		int prate=(Integer)session.getAttribute("Prod_cost");	
		System.out.println(prate);
		
		String q=(String)session.getAttribute("Prod_quantity");	
		System.out.println(q);
		
		
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_np= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
	    PreparedStatement pst_np = conn_np.prepareStatement("insert into Retailer_Product_details values(?,?,?,?,?,?,?)");
	     pst_np.setString(1,type);
	     pst_np.setString(2, name);
	     pst_np.setString(3, id);
	     pst_np.setString(4,details);
	     pst_np.setInt(5,prate);  
	     pst_np.setString(6,q);
	     pst_np.setString(7,comp_id);

		session.setAttribute("id2_id",comp_id);
	    
	    ResultSet rs_np = pst_np.executeQuery();   
	    
	    
	    %>  <% if( rs_np.next()) {  %>
	    <%@ include file="Display_pdt_details.jsp"%>
	     <% }else { %>
	     <%@  include file="CRegister_Fail.jsp"%>
	     <% }  
	           

	}
		catch(Exception e){       
			   out.println(e); 
			   conn_np.close();
			}      

			conn_np.close();
	%>
</body>
</html>