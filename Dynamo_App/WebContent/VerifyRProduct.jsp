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
		Connection conn_rp=null;
		try{
		 String c_id=(String)session.getAttribute("ind1");
		 out.println("verify:"+c_id);
		 
		String Ptype=request.getParameter("Ptype");
		System.out.println(Ptype);
		
		String Pname=request.getParameter("Pname");
		System.out.println(Pname);
		
		String Pid1=request.getParameter("Pid");
		System.out.println(Pid1);
		
		String Pdetails=request.getParameter("P_details");
		System.out.println(Pdetails);
		
		
		String pcost=request.getParameter("P_cost");
		int b = Integer.parseInt(pcost.replaceAll(",","").replaceAll("\\.",""));		
		System.out.println(b);
		
		String pquan=request.getParameter("quantity");
		System.out.println(pquan);
		
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_rp= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		 PreparedStatement pst_rp = conn_rp.prepareStatement("Select P_ID from Retailer_Product_details where P_ID=?");
		 pst_rp.setString(1, Pid1);
		    session.setAttribute("comp",c_id);
		    session.setAttribute("Prod_type", Ptype);
		    session.setAttribute("Prod_name",Pname);
		    session.setAttribute("Prod_id",Pid1);
		    session.setAttribute("Prod_details",Pdetails);
		    session.setAttribute("Prod_cost",b);
		    session.setAttribute("Prod_quantity",pquan);


		    
		    ResultSet rs_rp = pst_rp.executeQuery();  
		  

		  %>  <% if( rs_rp.next()) {  %>
		    <%@ include file="Exist_Pdetails.jsp"%>
		     <% } else { %>
		   <%@  include file="NewProd_details.jsp"%>
		    <% }
		   
		      
		}
		catch(Exception e){  
			out.println(e);
		   conn_rp.close();
		}      

		conn_rp.close();
		%>
</body>
</html>